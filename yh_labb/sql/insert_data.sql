SET search_path TO yrkesco;

INSERT INTO Anläggning (anläggning_id, namn, address) VALUES 
    ('AN001', 'Campus Göteborg', 'Vasagatan 11'),
    ('AN002', 'Campus Malmö', 'Malmgatan 22');

INSERT INTO Program (program_id, program_namn, beskrivning) VALUES 
    ('PRG001', 'Systemutvecklare .NET', 'Utbildning i .NET och databaser'),
    ('PRG002', 'Frontend Developer', 'Utbildning i HTML, CSS, JS, React');

INSERT INTO Utbildare (utbildare_id, f_namn, l_namn, title) VALUES 
    ('UB001', 'Anna', 'Karlsson', 'anställd'),
    ('UB002', 'Johan', 'Svensson', 'konsult'),
    ('UB003', 'Maria', 'Hansson', 'konsult'),
    ('UB004', 'Olle', 'Olsson', 'anställd');

INSERT INTO Konsultföretag (konsult_företag_id, namn, org_nr, fskatt, arvode_per_h, address) VALUES 
    ('KF001', 'ITKonsult AB', '5566778899', TRUE, 800, 'Kungsgatan 1'),
    ('KF002', 'WebbKonsult AB', '5566779900', TRUE, 900, 'Storgatan 45');

INSERT INTO UtbKonsult (utbildare_id, konsult_företag_id) VALUES 
    ('UB002', 'KF001'),
    ('UB003', 'KF002');

INSERT INTO Klass (klass_id, program_id, omgång_nr, utb_ledare_id, anläggning_id) VALUES 
    ('KLS001', 'PRG001', 1, 'UB001', 'AN001'),
    ('KLS002', 'PRG002', 2, 'UB002', 'AN002'),
    ('KLS003', 'PRG002', 3, 'UB002', 'AN002');

INSERT INTO Student (student_id, f_namn, l_namn, email, klass_id) VALUES 
    ('STU001', 'Eva', 'Andersson', 'eva@student.com', 'KLS001'),
    ('STU002', 'Per', 'Nilsson', 'per@student.com', 'KLS002'),
    ('STU003', 'Lisa', 'Lind', 'lisa@student.com', 'KLS003'),
    ('STU004', 'Mohammed', 'Ali', 'mohammed@student.com', 'KLS001');

INSERT INTO StudUppgifter (student_id, personnummer) VALUES 
    ('STU001', '199001011234'),
    ('STU002', '198512304321'),
    ('STU003', '199405065432'),
    ('STU004', '199812125678');

INSERT INTO Kurs (kurs_id, kurs_namn, kurs_kod, poäng, beskrivning) VALUES 
    ('KRS001', 'Databasteknik', 'DBT101', 15, 'SQL och relationsdatabaser'),
    ('KRS002', 'Webbutveckling', 'WEB102', 10, 'HTML, CSS, JavaScript'),
    ('KRS003', 'Pythonprogrammering', 'PYT103', 20, 'Grunder i Python'),
    ('KRS004', 'Agil utveckling', 'AGI104', 5, 'Scrum och Kanban'),
    ('KRS005', 'Datakommunikation', 'DAT105', 10, 'TCP/IP och nätverk');

INSERT INTO ProgramKurs (program_id, kurs_id) VALUES 
    ('PRG001', 'KRS001'),
    ('PRG001', 'KRS005'),
    ('PRG002', 'KRS002'),
    ('PRG002', 'KRS003'),
    ('PRG002', 'KRS004');

INSERT INTO UtbildareKurs (utbildare_id, kurs_id) VALUES 
    ('UB001', 'KRS001'),
    ('UB002', 'KRS002'),
    ('UB003', 'KRS003'),
    ('UB004', 'KRS004');

INSERT INTO FriståendeKurs (frikurs_id, kurs_id, anläggning_id, startdatum, slutdatum, poäng, lärare_id) VALUES 
    ('FRK001', 'KRS003', 'AN001', '2025-09-01', '2025-10-01', 20, 'UB003'),
    ('FRK002', 'KRS005', 'AN002', '2025-05-15', '2025-06-15', 10, 'UB001');

INSERT INTO FriståendeStudent (student_id, frikurs_id, betyg) VALUES 
    ('STU004', 'FRK001', 'VG'),
    ('STU003', 'FRK002', 'G');
