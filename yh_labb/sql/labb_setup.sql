CREATE SCHEMA IF NOT EXISTS yrkesco;

SET search_path TO yrkesco;

CREATE TABLE IF NOT EXISTS Program (
    program_id VARCHAR(50) PRIMARY KEY NOT NULL,
    program_namn VARCHAR(255) NOT NULL,
    beskrivning TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Klass (
    klass_id VARCHAR(50) PRIMARY KEY NOT NULL,
    program_id VARCHAR(50) NOT NULL,
    omgång_nr INTEGER NOT NULL,
    utb_ledare_id VARCHAR(50) NOT NULL,
    anläggning_id VARCHAR(50) NOT NULL,
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (utb_ledare_id) REFERENCES Utbildningsledare(utb_ledare_id),
    FOREIGN KEY (anläggning_id) REFERENCES AnläggningsOrt(anläggning_id)
);

CREATE TABLE IF NOT EXISTS Utbildningsledare (
    utb_ledare_id VARCHAR(50) PRIMARY KEY NOT NULL,
    f_namn VARCHAR(100) NOT NULL,
    l_namn VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
    student_id VARCHAR(50) PRIMARY KEY NOT NULL,
    f_namn VARCHAR(100) NOT NULL,
    l_namn VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS StudUppgifter (
    student_id VARCHAR(50) PRIMARY KEY NOT NULL,
    personnummer CHAR(12) UNIQUE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE IF NOT EXISTS FriståendeKurs (
    fri_kurs_id VARCHAR(50) PRIMARY KEY NOT NULL,
    kurs_namn VARCHAR(255) NOT NULL,
    kurs_kod VARCHAR(20) UNIQUE NOT NULL,
    poäng INTEGER NOT NULL,
    beskrivning TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS FriståendeStudent (
    fri_kurs_id VARCHAR(50) NOT NULL,
    student_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (fri_kurs_id, student_id),
    FOREIGN KEY (fri_kurs_id) REFERENCES FriståendeKurs(fri_kurs_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE IF NOT EXISTS Kurs (
    kurs_id VARCHAR(50) PRIMARY KEY NOT NULL,
    kurs_namn VARCHAR(255) NOT NULL,
    kurs_kod VARCHAR(20) UNIQUE NOT NULL,
    poäng INTEGER NOT NULL,
    beskrivning TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ProgramKurs (
    program_id VARCHAR(50) NOT NULL,
    kurs_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (program_id, kurs_id),
    FOREIGN KEY (program_id) REFERENCES Program(program_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(kurs_id)
);

CREATE TABLE IF NOT EXISTS AnläggningsOrt (
    anläggning_id VARCHAR(50) PRIMARY KEY NOT NULL,
    namn VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Utbildare (
    utbildare_id VARCHAR(50) PRIMARY KEY NOT NULL,
    f_namn VARCHAR(100) NOT NULL,
    l_namn VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS UtbildareKurs (
    utbildare_id VARCHAR(50) NOT NULL,
    kurs_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (utbildare_id, kurs_id),
    FOREIGN KEY (utbildare_id) REFERENCES Utbildare(utbildare_id),
    FOREIGN KEY (kurs_id) REFERENCES Kurs(kurs_id)
);

CREATE TABLE IF NOT EXISTS Konsultföretag (
    konsult_företag_id VARCHAR(50) PRIMARY KEY NOT NULL,
    namn VARCHAR(255) NOT NULL,
    org_nr CHAR(10) UNIQUE NOT NULL,
    fskatt BOOLEAN NOT NULL,
    arvode_per_h NUMERIC(10,2) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS UtbKonsult (
    utbildare_id VARCHAR(50) NOT NULL,
    konsult_företag_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (utbildare_id, konsult_företag_id),
    FOREIGN KEY (utbildare_id) REFERENCES Utbildare(utbildare_id),
    FOREIGN KEY (konsult_företag_id) REFERENCES Konsultföretag(konsult_företag_id)
);
