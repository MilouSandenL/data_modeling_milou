DROP SCHEMA IF EXISTS yrkesco CASCADE;
CREATE SCHEMA yrkesco;
SET search_path TO yrkesco;

CREATE TABLE Program (
    program_id VARCHAR(10) PRIMARY KEY,
    program_namn VARCHAR(100)
);

CREATE TABLE Kurs (
    kurs_id VARCHAR(10) PRIMARY KEY,
    kurs_namn VARCHAR(100),
    kurs_kod VARCHAR(10) UNIQUE,
    poäng INTEGER NOT NULL,
    beskrivning TEXT
);

CREATE TABLE Anläggning (
    anläggning_id VARCHAR(10) PRIMARY KEY,
    namn VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE Utbildare (
    utbildare_id VARCHAR(10) PRIMARY KEY,
    f_namn VARCHAR(50),
    l_namn VARCHAR(50),
    title VARCHAR(20),
    CHECK (title IN ('anställd', 'konsult'))
);

CREATE TABLE Utbildningsledare (
    utb_ledare_id VARCHAR(10) PRIMARY KEY,
    f_namn VARCHAR(50),
    l_namn VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Konsultföretag (
    konsult_företag_id VARCHAR(10) PRIMARY KEY,
    namn VARCHAR(100),
    org_nr CHAR(10),
    fskatt BOOLEAN,
    arvode_per_h INT,
    address VARCHAR(100)
);

CREATE TABLE Klass (
    klass_id VARCHAR(10) PRIMARY KEY,
    program_id VARCHAR(10),
    omgång_nr INT,
    utb_ledare_id VARCHAR(10),
    anläggning_id VARCHAR(10),
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (utb_ledare_id) REFERENCES Utbildningsledare(utb_ledare_id),
    FOREIGN KEY (anläggning_id) REFERENCES Anläggning(anläggning_id)
);

CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    f_namn VARCHAR(50),
    l_namn VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    klass_id VARCHAR(10),
    FOREIGN KEY (klass_id) REFERENCES Klass(klass_id)
);

CREATE TABLE StudUppgifter (
    student_id VARCHAR(10) PRIMARY KEY,
    personnummer CHAR(12),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE ProgramKurs (
    program_id VARCHAR(10),
    kurs_id VARCHAR(10),
    PRIMARY KEY (program_id, kurs_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(kurs_id)
);

CREATE TABLE UtbildareKurs (
    utbildare_id VARCHAR(10),
    kurs_id VARCHAR(10),
    PRIMARY KEY (utbildare_id, kurs_id),
    FOREIGN KEY (utbildare_id) REFERENCES Utbildare(utbildare_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(kurs_id)
);

CREATE TABLE UtbKonsult (
    utbildare_id VARCHAR(10) PRIMARY KEY,
    konsult_företag_id VARCHAR(10),
    FOREIGN KEY (utbildare_id) REFERENCES Utbildare(utbildare_id),
    FOREIGN KEY (konsult_företag_id) REFERENCES Konsultföretag(konsult_företag_id)
);

CREATE TABLE FriståendeKurs (
    frikurs_id VARCHAR(10) PRIMARY KEY,
    kurs_id VARCHAR(10),
    anläggning_id VARCHAR(10),
    startdatum DATE,
    slutdatum DATE,
    poäng INTEGER NOT NULL,
    lärare_id VARCHAR(10),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(kurs_id),
    FOREIGN KEY (anläggning_id) REFERENCES Anläggning(anläggning_id),
    FOREIGN KEY (lärare_id) REFERENCES Utbildare(utbildare_id)
);

CREATE TABLE FriståendeStudent (
    student_id VARCHAR(10),
    frikurs_id VARCHAR(10),
    betyg CHAR(2),
    PRIMARY KEY (student_id, frikurs_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (frikurs_id) REFERENCES FriståendeKurs(frikurs_id)
);
