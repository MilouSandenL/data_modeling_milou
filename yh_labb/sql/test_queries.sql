SET search_path TO yrkesco;

-- Tar först fram klass_id från tabellen klass, hämtar sedan för- och efternamn på utbledare, detta genom JOIN kopplas klass och utbledare tabellerna ihop. ON = kopplar ihop när ID matchar.
SELECT 
    k.klass_id, 
    ul.f_namn || ' ' || ul.l_namn AS utbildningsledare
FROM Klass k
JOIN Utbildningsledare ul ON k.utb_ledare_id = ul.utb_ledare_id;

-- Joinar tabellerna där id matchar för att få fram vilka kurser som finns i programmen
SELECT 
    p.program_namn,
    k.kurs_namn
FROM Program p
JOIN ProgramKurs pk ON p.program_id = pk.program_id
JOIN Kurs k ON pk.kurs_id = k.kurs_id;

-- query för att få fram vilka utbildare som undervisar vilka kurser, Joinar på utbildare, bryggtabellen utbkurs och kurs.
SELECT 
    u.f_namn || ' ' || u.l_namn AS utbildare,
    k.kurs_namn
FROM Utbildare u
JOIN UtbildareKurs uk ON u.utbildare_id = uk.utbildare_id
JOIN Kurs k ON uk.kurs_id = k.kurs_id;

-- räknar hur många kurser varje program har, grupperar med namnet på programmet
SELECT 
    p.program_namn,
    COUNT(pk.kurs_id) AS antal_kurser
FROM Program p
JOIN ProgramKurs pk ON p.program_id = pk.program_id
GROUP BY p.program_namn;

-- Tar fram när de fristående kurserna börjar och sluta, får fram namn på kurs genom joinar den tabellen
SELECT 
    fk.frikurs_id,
    k.kurs_namn,
    fk.startdatum,
    fk.slutdatum
FROM FriståendeKurs fk
JOIN Kurs k ON fk.kurs_id = k.kurs_id;

-- hämtar namn och klass på studenter och sedan joinar på program för att se vad dom studerar
SELECT 
    s.f_namn || ' ' || s.l_namn AS student_namn,
    k.klass_id,
    p.program_namn
FROM Student s
JOIN Klass k ON s.klass_id = k.klass_id
JOIN Program p ON k.program_id = p.program_id;


-- ser studenter och deras tillhörande personnummer
SELECT 
    s.f_namn || ' ' || s.l_namn AS student_namn, 
    su.personnummer
FROM Student s
JOIN StudUppgifter su ON s.student_id = su.student_id;

-- får fram alla utbildare och om de är konsulter eller anställda
SELECT 
    u.f_namn || ' ' || u.l_namn AS utbildare,
    u.title,
    kf.namn AS konsultföretag
FROM Utbildare u
LEFT JOIN UtbKonsult uk ON u.utbildare_id = uk.utbildare_id
LEFT JOIN Konsultföretag kf ON uk.konsult_företag_id = kf.konsult_företag_id;

-- för att se vilka kurser som hålls på vilken anläggning.
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
