-- ============================================
-- SCHEMA: blyant
-- DUMMY DATASET (82 ROWS)
-- ============================================

USE blyant;

-- -------------------------
-- 1. PIGMENT (10 rows)
-- -------------------------
INSERT INTO pigment (id, navn) VALUES
(1, 'Grafitt'),
(2, 'Kull'),
(3, 'Organisk fargestoff'),
(4, 'Uorganisk fargestoff'),
(5, 'Voksbasert pigment'),
(6, 'Akvarellpigment'),
(7, 'Oljeholdig pigment'),
(8, 'Pastellpigment'),
(9, 'Metallisk pigment'),
(10, 'Krittbasert pigment');

-- -------------------------
-- 2. DEKKEVNE (5 rows)
-- -------------------------
INSERT INTO dekkevne (id, navn) VALUES
(1, 'Svært høy dekkevne'),
(2, 'Høy dekkevne'),
(3, 'Middels dekkevne'),
(4, 'Lav dekkevne'),
(5, 'Svært lav dekkevne');

-- -------------------------
-- 3. VANNLØSELIGHET (5 rows)
-- -------------------------
INSERT INTO vannloselighet (id, navn) VALUES
(1, 'Ikke vannløselig'),
(2, 'Delvis vannløselig'),
(3, 'Vannløselig'),
(4, 'Akvarell-reaktiv'),
(5, 'Oljebasert – ikke løselig');

-- -------------------------
-- 4. EGENSKAP (20 rows)
-- -------------------------
INSERT INTO egenskap (id, dekkevne_id, vannloselighet_id, pigment_id) VALUES
(1, 2, 1, 1),
(2, 3, 1, 1),
(3, 4, 1, 1),
(4, 2, 3, 6),
(5, 3, 3, 6),
(6, 2, 1, 2),
(7, 1, 1, 2),
(8, 3, 1, 5),
(9, 2, 1, 5),
(10, 3, 1, 3),
(11, 2, 1, 3),
(12, 3, 1, 4),
(13, 2, 1, 4),
(14, 1, 4, 6),
(15, 3, 5, 7),
(16, 2, 5, 7),
(17, 3, 1, 8),
(18, 2, 1, 8),
(19, 1, 1, 9),
(20, 3, 1, 10);

-- -------------------------
-- 5. TYPE (20 rows)
-- -------------------------
INSERT INTO type (id, navn, egenskap_id) VALUES
(1, 'HB Blyant', 1),
(2, '2B Blyant', 2),
(3, '4H Blyant', 3),
(4, 'Akvarellblyant – myk', 4),
(5, 'Akvarellblyant – hard', 5),
(6, 'Kullblyant – myk', 6),
(7, 'Kullblyant – hard', 7),
(8, 'Fargeblyant – voks', 8),
(9, 'Fargeblyant – premium voks', 9),
(10, 'Fargeblyant – organisk', 10),
(11, 'Fargeblyant – organisk sterk', 11),
(12, 'Fargeblyant – uorganisk', 12),
(13, 'Fargeblyant – uorganisk sterk', 13),
(14, 'Akvarellblyant – pro', 14),
(15, 'Oljebasert kunstblyant', 15),
(16, 'Oljebasert kunstblyant – hard', 16),
(17, 'Pastellblyant – myk', 17),
(18, 'Pastellblyant – hard', 18),
(19, 'Metallisk blyant', 19),
(20, 'Krittblyant', 20);

-- -------------------------
-- 6. BRUKSOMRÅDE (10 rows)
-- -------------------------
INSERT INTO bruksomraade (id, navn) VALUES
(1, 'Skriving'),
(2, 'Teknisk tegning'),
(3, 'Kunstskisser'),
(4, 'Akvarellkunst'),
(5, 'Fargelegging'),
(6, 'Portrettkunst'),
(7, 'Arkitekttegning'),
(8, 'Designskisser'),
(9, 'Illustrasjon'),
(10, 'Hobbybruk');

-- -------------------------
-- 7. FARGE (20 rows)
-- -------------------------
INSERT INTO farge (id, navn) VALUES
(1, 'Grå'),
(2, 'Sort'),
(3, 'Rød'),
(4, 'Blå'),
(5, 'Gul'),
(6, 'Grønn'),
(7, 'Brun'),
(8, 'Lilla'),
(9, 'Oransje'),
(10, 'Rosa'),
(11, 'Turkis'),
(12, 'Hvit'),
(13, 'Sølv'),
(14, 'Gull'),
(15, 'Kobber'),
(16, 'Beige'),
(17, 'Mørk blå'),
(18, 'Olivengrønn'),
(19, 'Vinrød'),
(20, 'Sand');

-- -------------------------
-- 8. BLYANT (50 rows)
-- -------------------------
INSERT INTO blyant (id, brukernivaa, hardhet, farge_id, type_id) VALUES
(1, 'Nybegynner', 'HB', 1, 1),
(2, 'Viderekommen', '2B', 1, 2),
(3, 'Profesjonell', '4H', 1, 3),
(4, 'Nybegynner', 'Myk', 3, 8),
(5, 'Viderekommen', 'Myk', 4, 4),
(6, 'Profesjonell', 'Hard', 2, 7),
(7, 'Nybegynner', 'Myk', 5, 8),
(8, 'Viderekommen', 'HB', 7, 1),
(9, 'Profesjonell', '2B', 6, 2),
(10, 'Nybegynner', 'HB', 3, 8),
(11, 'Profesjonell', 'Myk', 8, 17),
(12, 'Viderekommen', 'Hard', 9, 12),
(13, 'Nybegynner', 'HB', 10, 1),
(14, 'Profesjonell', 'Myk', 11, 14),
(15, 'Viderekommen', '2B', 12, 11),
(16, 'Nybegynner', 'HB', 13, 1),
(17, 'Profesjonell', 'Hard', 14, 16),
(18, 'Viderekommen', 'Myk', 15, 10),
(19, 'Nybegynner', 'HB', 16, 1),
(20, 'Profesjonell', 'Myk', 17, 14),
(21, 'Viderekommen', '2B', 18, 11),
(22, 'Nybegynner', 'HB', 19, 1),
(23, 'Profesjonell', 'Hard', 20, 16),
(24, 'Viderekommen', 'Myk', 3, 10),
(25, 'Nybegynner', 'HB', 4, 1),
(26, 'Profesjonell', 'Myk', 5, 14),
(27, 'Viderekommen', '2B', 6, 11),
(28, 'Nybegynner', 'HB', 7, 1),
(29, 'Profesjonell', 'Hard', 8, 16),
(30, 'Viderekommen', 'Myk', 9, 10),
(31, 'Nybegynner', 'HB', 10, 1),
(32, 'Profesjonell', 'Myk', 11, 14),
(33, 'Viderekommen', '2B', 12, 11),
(34, 'Nybegynner', 'HB', 13, 1),
(35, 'Profesjonell', 'Hard', 14, 16),
(36, 'Viderekommen', 'Myk', 15, 10),
(37, 'Nybegynner', 'HB', 16, 1),
(38, 'Profesjonell', 'Myk', 17, 14),
(39, 'Viderekommen', '2B', 18, 11),
(40, 'Nybegynner', 'HB', 19, 1),
(41, 'Profesjonell', 'Hard', 20, 16),
(42, 'Viderekommen', 'Myk', 3, 10),
(43, 'Nybegynner', 'HB', 4, 1),
(44, 'Profesjonell', 'Myk', 5, 14),
(45, 'Viderekommen', '2B', 6, 11),
(46, 'Nybegynner', 'HB', 7, 1),
(47, 'Profesjonell', 'Hard', 8, 16),
(48, 'Viderekommen', 'Myk', 9, 10),
(49, 'Nybegynner', 'HB', 10, 1),
(50, 'Profesjonell', 'Myk', 11, 14);

INSERT INTO blyant_bruksomraade (blyant_id, bruksomraade_id) VALUES (1,1), (2,7), (2,8);