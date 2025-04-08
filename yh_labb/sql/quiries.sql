-- \dt yrkesco.*

SELECT * FROM Student;
SELECT * FROM Kurs;
SELECT * FROM Klass;
SELECT * FROM Program;

-- visar alla studenter med tillhörande klass och program
SELECT s.student_id, s.f_namn, s.l_namn, k.klass_id, p.program_namn
FROM Student s
JOIN Klass k ON s.klass_id = k.klass_id
JOIN Program p ON k.program_id = p.program_id;

-- hämtar kurserna som ges inom ett visst program
SELECT p.program_namn, k.kurs_namn
FROM Program p
JOIN ProgramKurs pk ON p.program_id = pk.program_id
JOIN Kurs k ON pk.kurs_id = k.kurs_id;

-- visar utbildarna som är konsulter
SELECT u.utbildare_id, u.f_namn, u.l_namn, u.title, kf.namn AS konsultföretag
FROM Utbildare u
JOIN UtbKonsult uk ON u.utbildare_id = uk.utbildare_id
JOIN Konsultföretag kf ON uk.konsult_företag_id = kf.konsult_företag_id;

-- listar de fristående kurserna, med lärare och poäng
SELECT fk.frikurs_id, k.kurs_namn, fk.poäng, fk.startdatum, fk.slutdatum,
       u.f_namn AS lärare_förnamn, u.l_namn AS lärare_efternamn
FROM FriståendeKurs fk
JOIN Kurs k ON fk.kurs_id = k.kurs_id
JOIN Utbildare u ON fk.lärare_id = u.utbildare_id;

-- visar kurser och respektive utbildare