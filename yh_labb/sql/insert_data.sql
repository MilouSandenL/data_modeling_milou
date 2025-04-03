SET search_path TO yrkesco;

INSERT INTO Program VALUES 
    ('PRG001', 'Systemutveckling', 'Utbildning i programmering'),
    ('PRG002', 'Nätverksteknik', 'Utbildning inom nätverk och säkerhet');

INSERT INTO AnläggningsOrt VALUES 
    ('AN001', 'Stockholm', 'Sveavägen 10'),
    ('AN002', 'Göteborg', 'Avenyn 5');

INSERT INTO Utbildningsledare VALUES 
    ('UL001', 'Anna', 'Andersson', 'anna@school.com'),
    ('UL002', 'Mikael', 'Svensson', 'mikael@school.com');

INSERT INTO Klass VALUES 
    ('KLS001', 'PRG001', 1, 'UL001', 'AN001'),
    ('KLS002', 'PRG002', 2, 'UL002', 'AN002');

INSERT INTO Student VALUES 
    ('STU001', 'Johan', 'Johansson', 'johan@student.com', 'KLS001'),
    ('STU002', 'Erik', 'Eriksson', 'erik@student.com', 'KLS002');

INSERT INTO StudUppgifter VALUES 
    ('STU001', '199012123456'),
    ('STU002', '198903054321');

INSERT INTO Kurs VALUES 
    ('KRS001', 'Databaser', 'DB101', 10, 'Grundläggande SQL och databaser'),
    ('KRS002', 'Webbutveckling', 'WEB102', 15, 'HTML, CSS och JavaScript');

INSERT INTO ProgramKurs VALUES 
    ('PRG001', 'KRS001'),
    ('PRG001', 'KRS002');

INSERT INTO Utbildare VALUES 
    ('UB001', 'Karl', 'Karlsson', 'anställd'),
    ('UB002', 'Sara', 'Svensson', 'konsult');

INSERT INTO UtbildareKurs VALUES 
    ('UB001', 'KRS001'),
    ('UB002', 'KRS002');

INSERT INTO Konsultföretag VALUES 
    ('KF001', 'IT-Konsulterna AB', '5566778899', TRUE, 800, 'Kungsgatan 12');

INSERT INTO UtbKonsult VALUES 
    ('UB002', 'KF001');
