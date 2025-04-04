SET search_path TO yrkesco;

INSERT INTO Program (program_id, program_namn, beskrivning) VALUES 
    ('PRG001', 'Systemutveckling', 'Utbildning i programmering'),
    ('PRG002', 'Nätverksteknik', 'Utbildning inom nätverk och säkerhet');

INSERT INTO AnläggningsOrt (anläggning_id, namn, address) VALUES 
    ('AN001', 'Stockholm', 'Sveavägen 10'),
    ('AN002', 'Göteborg', 'Avenyn 5');

INSERT INTO Utbildningsledare (utb_ledare_id, f_namn, l_namn, email) VALUES 
    ('UL001', 'Anna', 'Andersson', 'anna@school.com'),
    ('UL002', 'Mikael', 'Svensson', 'mikael@school.com');

INSERT INTO Klass (klass_id, program_id, omgång_nr, utb_ledare_id, anläggning_id) VALUES 
    ('KLS001', 'PRG001', 1, 'UL001', 'AN001'),
    ('KLS002', 'PRG002', 2, 'UL002', 'AN002');

INSERT INTO Student (student_id, f_namn, l_namn, email, klass_id) VALUES 
    ('STU001', 'Johan', 'Johansson', 'johan@student.com', 'KLS001'),
    ('STU002', 'Erik', 'Eriksson', 'erik@student.com', 'KLS002');

INSERT INTO StudUppgifter (student_id, personnummer) VALUES 
    ('STU001', '199012123456'),
    ('STU002', '198903054321');

INSERT INTO Kurs (kurs_id, kurs_namn, kurs_kod, poäng, beskrivning) VALUES 
    ('KRS001', 'Databaser', 'DB101', 10, 'Grundläggande SQL och databaser'),
    ('KRS002', 'Webbutveckling', 'WEB102', 15, 'HTML, CSS och JavaScript');

INSERT INTO ProgramKurs (program_id, kurs_id) VALUES 
    ('PRG001', 'KRS001'),
    ('PRG001', 'KRS002');

INSERT INTO Utbildare (utbildare_id, f_namn, l_namn, title) VALUES 
    ('UB001', 'Karl', 'Karlsson', 'anställd'),
    ('UB002', 'Sara', 'Svensson', 'konsult');

INSERT INTO UtbildareKurs (utbildare_id, kurs_id) VALUES 
    ('UB001', 'KRS001'),
    ('UB002', 'KRS002');

INSERT INTO Konsultföretag (konsult_företag_id, namn, org_nr, fskatt, arvode_per_h, address) VALUES 
    ('KF001', 'IT-Konsulterna AB', '5566778899', TRUE, 800, 'Kungsgatan 12');

INSERT INTO UtbKonsult (utbildare_id, konsult_företag_id) VALUES 
    ('UB002', 'KF001');
