SET search_path TO yrkesco;

INSERT INTO Program (program_id, program_namn, beskrivning)
VALUES ('PRG001', 'Systemutveckling', 'Utbildning i programmering');

INSERT INTO Klass (klass_id, program_id, omgång_nr, utb_ledare_id, anläggning_id)
VALUES ('KLS001', 'PRG001', 1, 'UL001', 'AN001');

INSERT INTO Utbildningsledare (utb_ledare_id, f_namn, l_namn, email)
VALUES ('UL001', 'Anna', 'Andersson', 'anna@school.com');

INSERT INTO Student (student_id, f_namn, l_namn, email)
VALUES ('STU001', 'Johan', 'Johansson', 'johan@student.com');

INSERT INTO StudUppgifter (student_id, personnummer)
VALUES ('STU001', '199012123456');

INSERT INTO Kurs (kurs_id, kurs_namn, kurs_kod, poäng, beskrivning)
VALUES ('KRS001', 'Databaser', 'DB101', 10, 'Grundläggande SQL och databaser');

INSERT INTO ProgramKurs (program_id, kurs_id)
VALUES ('PRG001', 'KRS001');

INSERT INTO Utbildare (utbildare_id, f_namn, l_namn)
VALUES ('UB001', 'Karl', 'Karlsson');

INSERT INTO UtbildareKurs (utbildare_id, kurs_id)
VALUES ('UB001', 'KRS001');
