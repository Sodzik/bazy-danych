/* 1 */
UPDATE produkty SET id_p = 'EGP' WHERE nazwa_p = 'Wegiel Eko Groszek PROMETEUSZ';
SELECT * FROM  produkty;

/* 2 */
UPDATE produkty SET jedn_cena = jedn_cena * 1.1;
SELECT * FROM  produkty;

/* 3 */
UPDATE klienci SET imie = UPPER(imie) WHERE imie = 'Abel';
SELECT * FROM  klienci;

/* 4 */
UPDATE klienci SET imie = LOWER(imie) WHERE imie = 'Abigail';
SELECT * FROM  klienci;

/* 5 */
SELECT REPLACE(imie, "Ab", "aaaa") FROM klienci;

/* 6 */
SELECT SUBSTRING(imie,4) FROM klienci;
SELECT SUBSTRING(imie FROM 4) FROM klienci;
SELECT SUBSTRING(imie,4,2) FROM klienci;
SELECT SUBSTRING(imie FROM 4 FOR 2) FROM klienci;

/* 7 */
UPDATE klienci SET imie = CONCAT(imie, ' Luna') WHERE nazwisko = 'Tyrkiew';
SELECT * FROM klienci WHERE nazwisko = 'Tyrkiew';

/* 8 */
UPDATE produkty SET nazwa_p = CONCAT(nazwa_p, ' +') WHERE LENGTH(nazwa_p) = (SELECT MIN(LENGTH(nazwa_p)) FROM produkty);
SELECT * FROM  produkty;

/* 9 */
SELECT LEFT(imie, 4) FROM klienci;
SELECT RIGHT(imie, 4) FROM klienci;

/* 10 */
UPDATE klienci SET imie = CONCAT(UPPER(LEFT(imie, 1)), LOWER(RIGHT(imie, (CHAR_LENGTH(imie) - 1 ))));
SELECT * FROM  klienci;

/* 11 */
UPDATE klienci AS k
JOIN (
    SELECT id_k
    FROM transakcje AS t
    GROUP BY id_k
    ORDER BY COUNT(*) DESC
    LIMIT 1
) t ON t.id_k = k.id_k
SET k.miejscowosc = 'Wrocław',
    k.ulica = 'Mikołaja Reja 3';

SELECT * FROM klienci WHERE ulica = 'Mikołaja Reja 3';


/* 12 */
INSERT INTO klienci VALUES
('JeEp2115', 'Jeffrey', 'Epstein', 101, '123-456-78-90', 10, '00-001', 'Wrocław', 'ul. św. Popka', 23),
('JaSu420', 'Jacek', 'Sutryk', 102, '987-654-32-10', 12, '31-002', 'Kamień', 'ul. wsioków', 67),
('KaKo6769', 'Kamil', 'Kovalenko', 103, '555-666-77-88', 14, '60-003', 'Trzebnica', 'ul. gnoju', 0);

/* 13 */
INSERT INTO transakcje VALUES
('F/TR/12345', 'JeEp2115', 'O', 24, CURRENT_DATE),
('F/TR/54321', 'JeEp2115', 'EGP', 99, CURRENT_DATE),
('F/TR/13467', 'JaSu420', 'OO', 1, CURRENT_DATE),
('F/TR/12601', 'JaSu420', 'O', 6, CURRENT_DATE),
('F/TR/1', 'KaKo6769', 'EGP', 19, CURRENT_DATE),
('F/TR/120002', 'KaKo6769', 'OO', 196, CURRENT_DATE)

/* 14 */
INSERT INTO klienci 
SELECT 'AbEl2115', 'Abdiusz', nazwisko, id_us, nip, id_w, kod, miejscowosc, ulica, nr_domu
FROM klienci WHERE imie = 'Abdiasz' AND nazwisko = 'Eleryk';

/* 15 */
DELETE FROM transakcje WHERE MONTH(data_t) = 3 AND YEAR(data_t) = 2014;

/* 16 */
DELETE FROM klienci WHERE imie = 'Adaukt' AND nazwisko LIKE 'M%'

/* 17 */
DELETE FROM klienci 
WHERE id_k NOT IN (SELECT id_k FROM transakcje);

/* 18 */
INSERT INTO produkty 
SELECT 'MLG', 'Ogórki wiejskie', 'miligram', (MAX(jedn_cena) + 100) FROM produkty

/* 19 */
UPDATE uskarbowe SET id_us = (id_us+1) ORDER BY id_us DESC

/* 20 */
DELETE FROM klienci;
