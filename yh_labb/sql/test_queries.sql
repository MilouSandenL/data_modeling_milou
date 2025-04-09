SET search_path TO yrkesco;

-- Tar först fram klass_id från tabellen klass, hämtar sedan för- och efternamn på utbledare, detta genom JOIN kopplas klass och utbledare tabellerna ihop. ON = kopplar ihop när ID matchar.
SELECT 
    k.klass_id, 
    ul.f_namn || ' ' || ul.l_namn AS utbildningsledare
FROM Klass k
JOIN Utbildningsledare ul ON k.utb_ledare_id = ul.utb_ledare_id;

-- 2. Lista program och deras kurser
SELECT 
    p.program_namn,
    k.kurs_namn
FROM Program p
JOIN ProgramKurs pk ON p.program_id = pk.program_id
JOIN Kurs k ON pk.kurs_id = k.kurs_id;

-- 3. Lista utbildare och vilka kurser de undervisar i
SELECT 
    u.f_namn || ' ' || u.l_namn AS utbildare,
    k.kurs_namn
FROM Utbildare u
JOIN UtbildareKurs uk ON u.utbildare_id = uk.utbildare_id
JOIN Kurs k ON uk.kurs_id = k.kurs_id;

-- 4. Visa antal kurser per program
SELECT 
    p.program_namn,
    COUNT(pk.kurs_id) AS antal_kurser
FROM Program p
JOIN ProgramKurs pk ON p.program_id = pk.program_id
GROUP BY p.program_namn;

-- 5. Lista fristående kurser, deras start och slutdatum
SELECT 
    fk.frikurs_id,
    k.kurs_namn,
    fk.startdatum,
    fk.slutdatum
FROM FriståendeKurs fk
JOIN Kurs k ON fk.kurs_id = k.kurs_id;

-- 6. Visa alla studenter, deras klass och vilket program de går
SELECT 
    s.f_namn || ' ' || s.l_namn AS student_namn,
    k.klass_id,
    p.program_namn
FROM Student s
JOIN Klass k ON s.klass_id = k.klass_id
JOIN Program p ON k.program_id = p.program_id;


-- Studenter med personnummer
SELECT 
    s.f_namn || ' ' || s.l_namn AS student_namn, 
    su.personnummer
FROM Student s
JOIN StudUppgifter su ON s.student_id = su.student_id;

-- Utbildare med typ och företag
SELECT 
    u.f_namn || ' ' || u.l_namn AS utbildare,
    u.title,
    kf.namn AS konsultföretag
FROM Utbildare u
LEFT JOIN UtbKonsult uk ON u.utbildare_id = uk.utbildare_id
LEFT JOIN Konsultföretag kf ON uk.konsult_företag_id = kf.konsult_företag_id;

-- Kurser på en specifik anläggning
SELECT DISTINCT 
    k.kurs_namn,
    a.namn AS anläggning
FROM Kurs k
JOIN ProgramKurs pk ON k.kurs_id = pk.kurs_id
JOIN Program p ON pk.program_id = p.program_id
JOIN Klass kl ON p.program_id = kl.program_id
JOIN Anläggning a ON kl.anläggning_id = a.anläggning_id
UNION
SELECT 
    k.kurs_namn,
    a.namn AS anläggning
FROM FriståendeKurs fk
JOIN Kurs k ON fk.kurs_id = k.kurs_id
JOIN Anläggning a ON fk.anläggning_id = a.anläggning_id;
