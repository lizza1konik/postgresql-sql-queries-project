-- smazání všech záznamů z tabulek

CREATE or replace FUNCTION clean_tables() RETURNS void AS $$
declare
l_stmt text;
begin
select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename) , ',')
into l_stmt
from pg_tables
where schemaname in ('public');

execute l_stmt || ' cascade';
end;
$$ LANGUAGE plpgsql;
select clean_tables();

-- reset sekvenci

CREATE or replace FUNCTION restart_sequences() RETURNS void AS $$
DECLARE
i TEXT;
BEGIN
FOR i IN (SELECT column_default FROM information_schema.columns WHERE column_default SIMILAR TO 'nextval%')
  LOOP
         EXECUTE 'ALTER SEQUENCE'||' ' || substring(substring(i from '''[a-z_]*')from '[a-z_]+') || ' '||' RESTART 1;';
END LOOP;
END $$ LANGUAGE plpgsql;
select restart_sequences();
-- konec resetu


insert into location (id_loc, name, capacity, country, city) values (1, 'Hydrocodone Bitartrate And Acetaminophen', 19282, 'Czech Republic', 'Prague');
insert into location (id_loc, name, capacity, country, city) values (2, 'Amoxicillin', 42017, 'Ukraine', 'Kyiv');
insert into location (id_loc, name, capacity, country, city) values (3, 'Walgreens', 31504, 'USA', 'Los Angeles');
insert into location (id_loc, name, capacity, country, city) values (4, 'Cerebral Composition', 17493, 'Poland', 'Krakov');
insert into location (id_loc, name, capacity, country, city) values (5, 'Phenytoin Sodium', 34879, 'Poland', 'Byczyna');

select setval(pg_get_serial_sequence('location', 'id_loc'), 5);


insert into rent (id_rent, price, duration, company_name) values (1, null, null, 'Boyer Group');
insert into rent (id_rent, price, duration, company_name) values (2, 37473, 7, 'Beahan, Konopelski and Treutel');
insert into rent (id_rent, price, duration, company_name) values (3, 29432, 4, 'Johnson LLC');
insert into rent (id_rent, price, duration, company_name) values (4, 18799, 7, 'O''Hara Group');
insert into rent (id_rent, price, duration, company_name) values (5, 31678, 5, 'Treutel, Donnelly and Batz');
insert into rent (id_rent, price, duration, company_name) values (6, 33580, 7, 'Kiehn-White');
insert into rent (id_rent, price, duration, company_name) values (7, 30843, 2, 'Runte-Jacobs');
insert into rent (id_rent, price, duration, company_name) values (8, 21366, 8, 'Zboncak-Tromp');
insert into rent (id_rent, price, duration, company_name) values (9, 38475, 1, 'Kerluke LLC');
insert into rent (id_rent, price, duration, company_name) values (10, 48535, 8, 'Grant-Sawayn');
insert into rent (id_rent, price, duration, company_name) values (11, 42073, 8, null);
insert into rent (id_rent, price, duration, company_name) values (12, 49145, 6, 'Glover LLC');
insert into rent (id_rent, price, duration, company_name) values (13, null, null, 'Kemmer and Sons');
insert into rent (id_rent, price, duration, company_name) values (14, 15141, 7, 'Zemlak-Funk');
insert into rent (id_rent, price, duration, company_name) values (15, null, null, 'Mohr, Shanahan and Rau');
insert into rent (id_rent, price, duration, company_name) values (16, 24623, 7, 'Stamm-Langworth');
insert into rent (id_rent, price, duration, company_name) values (17, 48705, 3, null);
insert into rent (id_rent, price, duration, company_name) values (18, 47539, 6, 'Gerlach LLC');
insert into rent (id_rent, price, duration, company_name) values (19, null, null, null);
insert into rent (id_rent, price, duration, company_name) values (20, null, null, 'Wisozk-Ziemann');
insert into rent (id_rent, price, duration, company_name) values (21, 22918, 1, 'Reinger, Rosenbaum and Beahan');
insert into rent (id_rent, price, duration, company_name) values (22, 43822, 9, 'Larson, Marquardt and Von');
insert into rent (id_rent, price, duration, company_name) values (23, 48560, 1, 'Dooley, McCullough and Bartoletti');
insert into rent (id_rent, price, duration, company_name) values (24, 32508, 8, 'Windler-Murazik');
insert into rent (id_rent, price, duration, company_name) values (25, 24853, 2, 'Christiansen, Hahn and Bauch');
insert into rent (id_rent, price, duration, company_name) values (26, 41578, 6, 'Schowalter Inc');
insert into rent (id_rent, price, duration, company_name) values (27, 28231, 9, 'Rutherford, Fritsch and Schamberger');
insert into rent (id_rent, price, duration, company_name) values (28, 16422, 8, 'Lebsack LLC');
insert into rent (id_rent, price, duration, company_name) values (29, 38906, 7, 'Kuhic, Gislason and Kuphal');
insert into rent (id_rent, price, duration, company_name) values (30, 13752, 6, 'Wiegand-Klocko');
insert into rent (id_rent, price, duration, company_name) values (31, 22918, 1, 'Reinger, Rosenbaum and Beahan');
insert into rent (id_rent, price, duration, company_name) values (32, 23232, 9, 'Larson, Marquardt and Von');
insert into rent (id_rent, price, duration, company_name) values (33, 48560, 1, 'Dooley, McCullough and Bartoletti');
insert into rent (id_rent, price, duration, company_name) values (34, 45843, 8, 'Windler-Murazik');
insert into rent (id_rent, price, duration, company_name) values (35, 12345, 2, 'Christiansen, Hahn and Bauch');
insert into rent (id_rent, price, duration, company_name) values (36, 43521, 6, 'Schowalter Inc');
insert into rent (id_rent, price, duration, company_name) values (37, 38917, 9, 'Rutherford, Fritsch and Schamberger');
insert into rent (id_rent, price, duration, company_name) values (38, 19287, 8, 'Lebsack LLC');
insert into rent (id_rent, price, duration, company_name) values (39, 16422, 7, 'Kuhic, Gislason and Kuphal');
insert into rent (id_rent, price, duration, company_name) values (40, 986, 6, 'Wiegand-Klocko');
insert into rent (id_rent, price, duration, company_name) values (41, 41578, 6, 'Schowalter Inc');
insert into rent (id_rent, price, duration, company_name) values (42, 28231, 9, 'Rutherford, Fritsch and Schamberger');
insert into rent (id_rent, price, duration, company_name) values (43, 16422, 8, 'Lebsack LLC');
insert into rent (id_rent, price, duration, company_name) values (44, 38906, 7, 'Kuhic, Gislason and Kuphal');
insert into rent (id_rent, price, duration, company_name) values (45, 13752, 6, 'Wiegand-Klocko');
insert into rent (id_rent, price, duration, company_name) values (46, 22918, 1, 'Reinger, Rosenbaum and Beahan');
insert into rent (id_rent, price, duration, company_name) values (47, 23232, 9, 'Larson, Marquardt and Von');
insert into rent (id_rent, price, duration, company_name) values (48, 48560, 1, 'Dooley, McCullough and Bartoletti');
insert into rent (id_rent, price, duration, company_name) values (49, 45843, 8, 'Windler-Murazik');
insert into rent (id_rent, price, duration, company_name) values (50, 12345, 2, 'Christiansen, Hahn and Bauch');
insert into rent (id_rent, price, duration, company_name) values (51, 43521, 6, 'Schowalter Inc');
insert into rent (id_rent, price, duration, company_name) values (52, 38917, 9, 'Rutherford, Fritsch and Schamberger');
insert into rent (id_rent, price, duration, company_name) values (53, 19287, 8, 'Lebsack LLC');
insert into rent (id_rent, price, duration, company_name) values (54, 16422, 7, 'Kuhic, Gislason and Kuphal');
insert into rent (id_rent, price, duration, company_name) values (55, 986, 6, 'Wiegand-Klocko');
insert into rent (id_rent, price, duration, company_name) values (56, 13752, 6, 'Wiegand-Klocko');
insert into rent (id_rent, price, duration, company_name) values (57, 22918, 1, 'Reinger, Rosenbaum and Beahan');
insert into rent (id_rent, price, duration, company_name) values (58, 23232, 9, 'Larson, Marquardt and Von');
insert into rent (id_rent, price, duration, company_name) values (59, 48560, 1, 'Dooley, McCullough and Bartoletti');
insert into rent (id_rent, price, duration, company_name) values (60, 45843, 8, 'Windler-Murazik');

select setval(pg_get_serial_sequence('rent', 'id_rent'), 40);



insert into stage (id_stage, id_loc, id_rent, name) values (1, 1, 1, 'Harmony Heights');
insert into stage (id_stage, id_loc, id_rent, name) values (2, 2, 2, 'Groove Garden');
insert into stage (id_stage, id_loc, id_rent, name) values (3, 3, 3, 'Funky Fiesta');
insert into stage (id_stage, id_loc, id_rent, name) values (4, 4, 4, 'Electro Enigma');
insert into stage (id_stage, id_loc, id_rent, name) values (5, 5, 5, 'Melodic Meadow');
insert into stage (id_stage, id_loc, id_rent, name) values (6, 1, 6, 'Reggaeton Rendezvous');
insert into stage (id_stage, id_loc, id_rent, name) values (7, 2, 7, 'Soul Serenade');
insert into stage (id_stage, id_loc, id_rent, name) values (8, 2, 8, 'Rock Riot');
insert into stage (id_stage, id_loc, id_rent, name) values (9, 3, 9, 'Beats Boulevard');
insert into stage (id_stage, id_loc, id_rent, name) values (10, 4, 10, 'Salsa Square');
insert into stage (id_stage, id_loc, id_rent, name) values (11, 5, 11, 'Dreamy Dunes');
insert into stage (id_stage, id_loc, id_rent, name) values (12, 5, 12, 'Techno Terrace');
insert into stage (id_stage, id_loc, id_rent, name) values (13, 1, 13, 'Indie Oasis');
insert into stage (id_stage, id_loc, id_rent, name) values (14, 2, 14, 'Hip-Hop Haven');
insert into stage (id_stage, id_loc, id_rent, name) values (15, 3, 15, 'Celtic Corner');
insert into stage (id_stage, id_loc, id_rent, name) values (16, 3, 56, 'Harmony Heights Festival');
insert into stage (id_stage, id_loc, id_rent, name) values (17, 3, 57, 'Rhythm Revival Extravaganza');
insert into stage (id_stage, id_loc, id_rent, name) values (18, 3, 58, 'Melody Mania Spectacular');



select setval(pg_get_serial_sequence('stage', 'id_stage'), 15);



insert into person (id_person, name, surname, age) values (1, 'Justin', 'Bieber', 79);
insert into person (id_person, name, surname, age) values (2, 'Stefani', 'Germanotta', 23);
insert into person (id_person, name, surname, age) values (3, 'Katy', 'Perry', 70);
insert into person (id_person, name, surname, age) values (4, 'Robyn Rihanna', 'Fenty', 42);
insert into person (id_person, name, surname, age) values (5, 'Taylor', 'Swift', 84);
insert into person (id_person, name, surname, age) values (6, 'Britney', 'Spears', 83);
insert into person (id_person, name, surname, age) values (7, 'Shakira Isabel', 'Mebarak Ripoll', 66);
insert into person (id_person, name, surname, age) values (8, 'Joycelin', 'Rough', 30);
insert into person (id_person, name, surname, age) values (9, 'Justin', 'Timberlake', 41);
insert into person (id_person, name, surname, age) values (10, 'Jennifer', 'Lopez', 15);
insert into person (id_person, name, surname, age) values (11, 'Nicki', 'Minaj', 64);
insert into person (id_person, name, surname, age) values (12, 'Peter Gene', 'Hernandez', 19);
insert into person (id_person, name, surname, age) values (13, 'Alecia Beth', 'Moore', 33);
insert into person (id_person, name, surname, age) values (14, 'Selena', 'Gomez', 83);
insert into person (id_person, name, surname, age) values (15, 'Marshall Bruce', 'Mathers', 34);
insert into person (id_person, name, surname, age) values (16, 'Adele Laurie', 'Blue Adkins', 56);
insert into person (id_person, name, surname, age) values (17, 'Alicia', 'Augello', 79);
insert into person (id_person, name, surname, age) values (18, 'Chris', 'Brown', 96);
insert into person (id_person, name, surname, age) values (19, 'Harry', 'Styles ', 30);
insert into person (id_person, name, surname, age) values (20, 'Audre', 'Lavigne', 97);
insert into person (id_person, name, surname, age) values (21, 'Miley Ray', 'Cyrus', 44);
insert into person (id_person, name, surname, age) values (22, 'Cordozar Calvin', 'Broadus', 70);
insert into person (id_person, name, surname, age) values (23, 'Louis', 'Tomlinson', 26);
insert into person (id_person, name, surname, age) values (24, 'Mariah', 'Carey', 47);
insert into person (id_person, name, surname, age) values (25, 'Liam', 'Payne', 24);
insert into person (id_person, name, surname, age) values (26, 'Chris', 'Martin', 74);
insert into person (id_person, name, surname, age) values (27, 'Wiz', 'Khalifa', 42);
insert into person (id_person, name, surname, age) values (28, 'Armando Christian', 'Perez', 16);
insert into person (id_person, name, surname, age) values (29, 'Avril', 'Lavigne', 26);
insert into person (id_person, name, surname, age) values (30, 'Kanye', 'West', 92);
insert into person (id_person, name, surname, age) values (31, 'Zayn', 'Malik', 59);
insert into person (id_person, name, surname, age) values (32, 'Ricky', 'Martin', 20);
insert into person (id_person, name, surname, age) values (33, 'David', 'Guetta', 62);
insert into person (id_person, name, surname, age) values (34, 'Curtis James', 'Jackson', 78);
insert into person (id_person, name, surname, age) values (35, 'Ed', 'Sheeran', 52);
insert into person (id_person, name, surname, age) values (36, 'Cheryl', 'Cole', 90);
insert into person (id_person, name, surname, age) values (37, 'Enrique', 'Iglesias', 70);
insert into person (id_person, name, surname, age) values (38, 'Ricardo', 'Montaner', 18);
insert into person (id_person, name, surname, age) values (39, 'Christina', 'Aguilera', 39);
insert into person (id_person, name, surname, age) values (40, 'Sean Love', 'Combs', 91);
insert into person (id_person, name, surname, age) values (41, 'Reggy', 'Quarlis', 18);
insert into person (id_person, name, surname, age) values (42, 'Coleman', 'Jowitt', 77);
insert into person (id_person, name, surname, age) values (43, 'Freddy', 'Coddrington', 57);
insert into person (id_person, name, surname, age) values (44, 'Casper', 'Armatys', 97);
insert into person (id_person, name, surname, age) values (45, 'Dallis', 'Christian', 78);
insert into person (id_person, name, surname, age) values (46, 'Doria', 'Mitie', 84);
insert into person (id_person, name, surname, age) values (47, 'Stanislaus', 'Surman-Wells', 82);
insert into person (id_person, name, surname, age) values (48, 'Alysa', 'Needs', 15);
insert into person (id_person, name, surname, age) values (49, 'Murry', 'Polon', 91);
insert into person (id_person, name, surname, age) values (50, 'Elsbeth', 'Teague', 61);
insert into person (id_person, name, surname, age) values (51, 'Emilio', 'Wyllcocks', 25);
insert into person (id_person, name, surname, age) values (52, 'Dennis', 'Ekins', 64);
insert into person (id_person, name, surname, age) values (53, 'Zeke', 'Deniset', 83);
insert into person (id_person, name, surname, age) values (54, 'Harbert', 'Evins', 69);
insert into person (id_person, name, surname, age) values (55, 'Ag', 'Gradon', 52);
insert into person (id_person, name, surname, age) values (56, 'Kristy', 'O''Donoghue', 79);
insert into person (id_person, name, surname, age) values (57, 'Caty', 'Gourlie', 94);
insert into person (id_person, name, surname, age) values (58, 'Elysee', 'Lovelace', 38);
insert into person (id_person, name, surname, age) values (59, 'Mychal', 'Vivers', 99);
insert into person (id_person, name, surname, age) values (60, 'Linc', 'Derycot', 79);
insert into person (id_person, name, surname, age) values (61, 'Gustavus', 'Innott', 50);
insert into person (id_person, name, surname, age) values (62, 'Frieda', 'Abrahmer', 53);
insert into person (id_person, name, surname, age) values (63, 'Audra', 'Paula', 53);
insert into person (id_person, name, surname, age) values (64, 'Simonne', 'Dagwell', 83);
insert into person (id_person, name, surname, age) values (65, 'Mame', 'Ryle', 34);
insert into person (id_person, name, surname, age) values (66, 'Thorndike', 'Dumpleton', 64);
insert into person (id_person, name, surname, age) values (67, 'Julia', 'Oley', 28);
insert into person (id_person, name, surname, age) values (68, 'Adrienne', 'MacEnelly', 84);
insert into person (id_person, name, surname, age) values (69, 'Ava', 'Stell', 64);
insert into person (id_person, name, surname, age) values (70, 'Rodi', 'Forsbey', 26);
insert into person (id_person, name, surname, age) values (71, 'Deina', 'Wozencroft', 98);
insert into person (id_person, name, surname, age) values (72, 'Judy', 'Howcroft', 42);
insert into person (id_person, name, surname, age) values (73, 'Kristen', 'Leng', 63);
insert into person (id_person, name, surname, age) values (74, 'Ebeneser', 'Rudyard', 22);
insert into person (id_person, name, surname, age) values (75, 'Ariana', 'Grande', 29);
insert into person (id_person, name, surname, age) values (76, 'Ainsley', 'Filpo', 79);
insert into person (id_person, name, surname, age) values (77, 'Candide', 'Valente', 18);
insert into person (id_person, name, surname, age) values (78, 'Teddi', 'Jojic', 25);
insert into person (id_person, name, surname, age) values (79, 'Sonny', 'John Moore', 35);
insert into person (id_person, name, surname, age) values (80, 'Calvin', 'Harris', 39);
insert into person (id_person, name, surname, age) values (81, 'Tijs Michiel', 'Verwest', 54);
insert into person (id_person, name, surname, age) values (82, 'Kellen', 'Addlestone', 41);
insert into person (id_person, name, surname, age) values (83, 'Blancha', 'Kynder', 20);
insert into person (id_person, name, surname, age) values (84, 'Joanne', 'Vanns', 32);
insert into person (id_person, name, surname, age) values (85, 'Marteen', 'Gatrix', 23);

select setval(pg_get_serial_sequence('person', 'id_person'), 85);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Calvin Morris', 'Gatrix', 23);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Merrel', 'Cloute', 59);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Maegan', 'Graveston', 36);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Lu', 'Crosio', 2);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Celina', 'M''cowis', 81);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Reggis', 'Mountfort', 11);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Ingaberg', 'Berkely', 9);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Justinian', 'Rutgers', 54);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Josephine', 'Starbuck', 2);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Chrisse', 'Rapaport', 38);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Dinah', 'Birk', 68);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Daphene', 'Dax', 77);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Aurelie', 'Huburn', 23);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Iseabal', 'Crackett', 67);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kermie', 'McFetridge', 56);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Geri', 'Howsam', 74);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Jackqueline', 'Oldford', 68);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Bobby', 'Knox', 3);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Israel', 'Seagar', 98);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Deana', 'Ranald', 37);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Harrietta', 'Hylden', 38);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Tally', 'Girdlestone', 22);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Rora', 'Rizzi', 75);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Charmine', 'Wilshaw', 92);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Daphna', 'Dome', 26);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Laryssa', 'Okeshott', 49);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Rennie', 'Woolens', 70);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Britteny', 'Troth', 36);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Francine', 'Lening', 88);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Skelly', 'Collacombe', 13);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kingston', 'Grioli', 93);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Raimundo', 'Benka', 30);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Ody', 'Micallef', 77);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Orly', 'Middlebrook', 92);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Marketa', 'Alloisi', 53);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Ingunna', 'Bomfield', 70);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Rozamond', 'Hyland', 36);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Demott', 'Golson', 85);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Odelia', 'Danielski', 94);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Eduard', 'Kitter', 73);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Graeme', 'Sackler', 47);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Egbert', 'Rubinfeld', 44);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Enrique', 'Henker', 88);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Hammad', 'McCathay', 28);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Daffi', 'Geindre', 92);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Pierette', 'Kingescot', 84);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Caria', 'Stother', 30);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Morgun', 'Orry', 29);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Willie', 'Pink', 53);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Timmie', 'McArdell', 36);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Sosanna', 'Wooster', 84);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Betsy', 'McIlmurray', 28);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Sophi', 'Thorsen', 66);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kevin', 'Ducker', 21);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Arlee', 'Deinhard', 45);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Calla', 'Horsewood', 47);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Shawnee', 'McKeurtan', 11);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Huberto', 'Feifer', 95);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Gaylene', 'Hoovart', 56);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Rebecka', 'Greenman', 39);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Gabriel', 'Twopenny', 21);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Freda', 'Slemmonds', 7);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Jecho', 'Strickler', 41);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kristina', 'Gooden', 3);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Corenda', 'Tucknutt', 47);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Wynnie', 'Yair', 91);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Aristotle', 'Mac Giolla Pheadair', 53);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Carilyn', 'Mabbs', 44);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Hirsch', 'Ladon', 84);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Filbert', 'Tomas', 24);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kathie', 'Jobin', 26);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Isidore', 'Bartomeu', 5);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Meredith', 'Volette', 2);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Hilario', 'Vero', 10);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Boonie', 'Mogenot', 59);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Curran', 'Rispen', 42);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Davy', 'Girkin', 28);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Aggy', 'Plaid', 73);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Liane', 'Antonovic', 41);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Iggie', 'Faldoe', 84);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Conrado', 'Fawthorpe', 25);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Marnia', 'Kupis', 80);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Karilynn', 'Ivanuschka', 21);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Willi', 'Exelby', 74);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Vail', 'Greene', 86);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Petronia', 'Wase', 14);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Locke', 'Pinar', 82);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Granthem', 'Hanstock', 47);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Tatiania', 'Risdall', 85);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Scarface', 'Lathleiff', 27);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Tricia', 'Loosemore', 81);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Barbara', 'Cornew', 88);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Darius', 'Beagley', 79);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Cornelius', 'Loxton', 16);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Glyn', 'Pyffe', 51);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Cassandre', 'Sidary', 1);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Damita', 'Duddin', 64);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Rubie', 'Eadie', 19);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Coletta', 'Linden', 53);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Gearalt', 'Rillett', 97);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Franni', 'Cove', 90);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Mireille', 'Brocking', 19);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Zia', 'Ridings', 58);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Levin', 'Ioselev', 55);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Osbourn', 'Newis', 16);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Ernesto', 'Planke', 35);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Kippar', 'Winney', 72);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Florenza', 'Deer', 37);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Godard', 'Leamon', 30);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Karissa', 'Shaplin', 62);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Paule', 'Matasov', 19);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Anetta', 'Neave', 61);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Emelyne', 'Spenclay', 70);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Erhard', 'Mills', 58);
insert into person (id_person, name, surname, age) values (DEFAULT, 'Anestassia', 'Durden', 14);



INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (1, 'Justin Bieber', 36854, 5);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (2, 'Lady Gaga', 57218, 10);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (3, 'Katy Perry', 28947, 5);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (4, 'Rihanna', 69817, 12);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (5, 'Taylor Swift', 43645, 16);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (6, 'Britney Spears', 39299, 0);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (7, 'Shakira', 12668, 8);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (8, 'Joycelin Rough', 49387, 25);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (9, 'Justin Timberlake', 61424, 10);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (10, 'Jennifer Lopez', 64503, 34);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (11, 'Nicki Minaj', 42156, 9);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (12, 'Bruno Mars', 51259, 23);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (13, 'Pink', 54245, 7);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (14, 'Selena Gomez', 31324, 0);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (15, 'Eminem', 53075, 10);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (16, 'Adele', 12386, 23);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (17, 'Alicia Keys', 26635, 4);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (18, 'Chris Brown', 36025, 4);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (19, 'Harry Styles ', 58340, 14);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (20, 'Audre Lavigne', 25040, 12);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (21, 'Miley Cyrus', 49827, 12);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (22, 'Snoop Dogg', 61360, 37);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (23, 'Louis Tomlinson', 39244, 0);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (24, 'Mariah Carey', 50876, 8);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (25, 'Liam Payne', 23223, 25);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (26, 'Chris Martin', 63397, 0);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (27, 'Wiz Khalifa', 43756, 11);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (28, 'Pitbull', 55370, 9);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (29, 'Avril Lavigne', 54515, 23);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (30, 'Kanye West', 59448, 14);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (31, 'Zayn Malik', 11733, 21);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) vALUES (32, 'Ricky Martin', 65208, 21);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (33, 'David Guetta', 39467, 23);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (34, '50 Cent', 13179, 11);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (35, 'Ed Sheeran', 32288, 4);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (36, 'Cheryl Cole', 48920, 14);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (37, 'Enrique Iglesias', 33375, 12);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (38, 'Ricardo Montaner', 17535, 0);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (39, 'Christina Aguilera', 10673, 22);
INSERT INTO public.performer (id_person, pseudonym, salary, amount_of_people) VALUES (40, 'Sean Combs', 10481, 21);


INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (16, 'Pointtip Twinpod');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (17, 'Pointtip Twinpod');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (18, 'Slender Goldenbanner');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (19, 'Fortune`s Osmanthus');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (20, 'Virginia Thistle');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (21, 'Cigarbush');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (22, 'Nevada Dustymaiden');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (23, 'Southern Catalpa');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (24, 'Connect Alsns');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (25, 'Nodding Saxifrage');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (26, 'NDwarf Saltwort');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (27, 'Slender Goldenbanner');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (28, 'Fortune`s Osmanthus');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (29, 'Virginia Thistle');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (30, 'Cigarbush');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (31, 'Basic DJ Starter Kit');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (32, 'Pro Audio Powerhouse');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (33, 'Live Performance Rig');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (34, 'Compact PA System');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (35, 'Studio Recording Bundle');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (36, 'Portable Speaker Package');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (37, 'DJ Club Setup');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (38, 'Vocalist Studio Package');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (39, 'Guitarist''s Dream Kit');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (40, 'Wireless Microphone Set');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (41, 'Drum Mic Kit');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (42, 'Home Studio Essentials');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (43, 'Audio Mixer Combo');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (44, 'DJ Controller Package');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (45, 'Stage Monitor System');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (46, 'Podcasting Studio Setup');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (47, 'Keyboardist Performance Pack');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (48, 'Acoustic Guitar Amp Kit');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (49, 'Live Sound Engineer Kit');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (50, 'Karaoke Party Bundle');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (51, 'Conference Room Sound System');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (52, 'Bass Player''s Gear Pack');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (53, 'Vocal Effects Processor Bundle');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (54, 'Headphone Monitoring Set');

INSERT INTO public.sound_equipment (id_rent, name_of_set)
VALUES (55, 'Touring Sound System');






INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (1, 1, 16, 'Electric Dreams', 60);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (2, 2, 17, 'Midnight Serenade', 70);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (3, 3, 18, 'Rhythmic Fusion', 80);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (4, 4, 19, 'Harmony Unleashed', 90);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (5, 5, 20, 'Soulful Journey', 100);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (6, 6, 21, 'Stellar Melodies', 110);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (7, 7, 22, 'Vibrant Beats', 120);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (8, 8, 23, 'Enchanting Rhythms', 130);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (9, 9, 24, 'Melodic Echoes', 140);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (10, 10, 25, 'Euphoric Grooves', 150);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (11, 11, 26, 'Serendipity Sounds', 60);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (12, 12, 27, 'Dynamic Resonance', 70);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (13, 13, 28, 'Captivating Harmonies', 80);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (14, 14, 29, 'Celestial Cadence', 90);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (15, 15, 30, 'Whispering Melodies', 100);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (16, 1, 31, 'Funky Reverie', 110);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (17, 2, 32, 'Jazzed Up Vibe', 120);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (18, 3, 33, 'Blissful Notes', 130);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (19, 4, 34, 'Symphonic Serenade', 140);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (20, 5, 35, 'Enigmatic Encore', 150);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (21, 6, 36, 'Groovy Medley', 60);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (22, 7, 37, 'Harmonious Bliss', 70);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (23, 8, 38, 'Melancholic Ballad', 80);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (24, 9, 39, 'Sizzling Showcase', 90);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (25, 10, 40, 'Lyrical Odyssey', 100);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (26, 11, 41, 'Eclectic Melange', 110);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (27, 12, 42, 'Magnetic Melodies', 120);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (28, 13, 43, 'Enchanted Melisma', 130);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (29, 14, 44, 'Serene Sonata', 140);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (30, 15, 45, 'Dazzling Crescendo', 150);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (31, 1, 46, 'Whirling Rhythms', 60);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (32, 2, 47, 'Ethereal Ensemble', 70);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (33, 3, 48, 'Ambient Aria', 80);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (34, 4, 49, 'Captivating Cadence', 90);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (35, 5, 50, 'Fusion Fiesta', 100);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (36, 4, 51, 'Enthralling Overture', 110);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (37, 4, 52, 'Harmonic Reverie', 120);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (38, 4, 53, 'Melodious Mosaic', 130);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (39, 4, 54, 'Dynamic Duet', 140);

INSERT INTO public.performance (id_person, id_stage, id_rent, name, duration)
VALUES (40, 5, 55, 'Soulful Showcase', 150);






---------------------------------
INSERT INTO public.staff_member (id_person, salary)
VALUES (41, 20014);

INSERT INTO public.staff_member (id_person, salary)
VALUES (42, 22793);

INSERT INTO public.staff_member (id_person, salary)
VALUES (43, 25547);

INSERT INTO public.staff_member (id_person, salary)
VALUES (44, 28325);

INSERT INTO public.staff_member (id_person, salary)
VALUES (45, 31189);

INSERT INTO public.staff_member (id_person, salary)
VALUES (46, 33922);

INSERT INTO public.staff_member (id_person, salary)
VALUES (47, 20367);

INSERT INTO public.staff_member (id_person, salary)
VALUES (48, 23185);

INSERT INTO public.staff_member (id_person, salary)
VALUES (49, 25963);

INSERT INTO public.staff_member (id_person, salary)
VALUES (50, 28747);

INSERT INTO public.staff_member (id_person, salary)
VALUES (51, 31582);

INSERT INTO public.staff_member (id_person, salary)
VALUES (52, 34306);

INSERT INTO public.staff_member (id_person, salary)
VALUES (53, 20616);

INSERT INTO public.staff_member (id_person, salary)
VALUES (54, 23435);

INSERT INTO public.staff_member (id_person, salary)
VALUES (55, 26241);

----------------------------------------------------------------------------------------------------------------------------
INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, '1500');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 3500, 'Extra VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1100, 'Standart');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 2700, 'VIP');

INSERT INTO public.ticket (id_ticket, price, type)
VALUES (DEFAULT, 1500, 'Advanced');






INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (1, 1, 1, 'john.doe1234@gmail.com', '8765432190');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (2, 2, 2, 'emily.smith5678@yahoo.com', '8904321756');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (3, 3, 3, 'david.jones91011@hotmail.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (4, 4, 4, 'sarah.wilson1213@outlook.com', '9045671234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (5, 5, 5, 'mike.brown1415@gmail.com', '7654321098');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (6, 6, 1, 'lisa.walker1617@yahoo.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (7, 7, 2, 'andrew.harris1819@hotmail.com', '9876543210');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (8, 8, 3, 'jessica.parker2021@outlook.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (9, 9, 4, 'matthew.johnson2223@gmail.com', '7650984321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (10, 10, 5, 'olivia.roberts2425@yahoo.com', '9012374568');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (11, 11, 1, 'alexander.white2627@hotmail.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (12, 12, 2, 'sophia.wilson2829@outlook.com', '9087654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (13, 13, 3, 'william.davis3031@gmail.com', '3210987654');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (14, 14, 4, 'emma.martin3233@yahoo.com', '8765012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (15, 15, 5, 'jackson.brown3435@hotmail.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (16, 16, 1, 'mia.anderson3637@outlook.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (17, 17, 2, 'ethan.thompson3839@gmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (18, 18, 3, 'ava.green4041@yahoo.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (19, 19, 4, 'samuel.wright4243@hotmail.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (20, 20, 5, 'abigail.hill4445@outlook.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (21, 21, 1, 'noah.robinson4647@gmail.com', '7890654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (22, 22, 2, 'amelia.bailey4849@yahoo.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (23, 23, 3, 'daniel.wilson5051@hotmail.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (24, 24, 4, 'chloe.king5253@outlook.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (25, 25, 5, 'logan.miller5455@gmail.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (26, 26, 1, 'sophie.hall5657@yahoo.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (27, 27, 2, 'michael.cooper5859@hotmail.com', '0987654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (28, 28, 3, 'emily.hughes6061@outlook.com', '6543210987');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (29, 29, 4, 'benjamin.walker6263@gmail.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (30, 30, 5, 'isabella.perry6465@yahoo.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (31, 31, 1, 'samantha.brown123@gmail.com', '9876543210');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (32, 32, 2, 'jacob.smith456@yahoo.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (33, 33, 3, 'emily.jones789@hotmail.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (34, 34, 4, 'nathan.wilson1011@outlook.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (35, 35, 5, 'isabella.davis1213@gmail.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (36, 36, 1, 'lucas.martin1415@yahoo.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (37, 37, 2, 'olivia.thompson1617@hotmail.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (38, 38, 3, 'aiden.green1819@outlook.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (39, 39, 4, 'mia.harris2021@gmail.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (40, 40, 5, 'ethan.baker2223@yahoo.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (41, 41, 1, 'ava.cooper2425@hotmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (42, 42, 2, 'william.morris2627@outlook.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (43, 43, 3, 'sophia.clark2829@gmail.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (44, 44, 4, 'noah.lewis3031@yahoo.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (45, 45, 5, 'emma.hill3233@hotmail.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (46, 46, 1, 'jackson.rogers3435@outlook.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (47, 47, 2, 'chloe.carter3637@gmail.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (48, 48, 3, 'logan.wright3839@yahoo.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (49, 49, 4, 'madison.king4041@hotmail.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (50, 50, 5, 'jacob.adams4243@outlook.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (51, 51, 1, 'grace.miller4445@gmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (52, 52, 2, 'aiden.hall4647@yahoo.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (53, 53, 3, 'abigail.bailey4849@hotmail.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (54, 54, 4, 'samuel.perry5051@outlook.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (55, 55, 5, 'sophie.johnson5253@gmail.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (56, 56, 1, 'daniel.thomas5455@yahoo.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (57, 57, 2, 'lily.wilson5657@hotmail.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (58, 58, 3, 'jacob.james5859@outlook.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (59, 59, 4, 'mia.cook6061@gmail.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (60, 60, 5, 'ethan.mitchell6263@yahoo.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (61, 61, 1, 'ava.stewart6465@hotmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (62, 62, 2, 'oliver.morgan6667@gmail.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (63, 63, 3, 'emily.phillips6869@yahoo.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (64, 64, 4, 'noah.edwards7071@hotmail.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (65, 65, 5, 'grace.turner7273@outlook.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (66, 66, 1, 'jacob.roberts7475@gmail.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (67, 67, 2, 'sophia.scott7677@yahoo.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (68, 68, 3, 'daniel.clark7879@hotmail.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (69, 69, 4, 'emma.brown8081@outlook.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (70, 70, 5, 'nathan.harris8283@gmail.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (71, 71, 1, 'isabella.johnson8485@yahoo.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (72, 72, 2, 'lucas.lewis8687@hotmail.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (73, 73, 3, 'lily.martin8889@outlook.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (74, 74, 4, 'abigail.adams9091@gmail.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (75, 75, 5, 'ethan.wright9293@yahoo.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (76, 76, 1, 'chloe.carter9495@hotmail.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (77, 77, 2, 'samantha.green9697@outlook.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (78, 78, 3, 'jacob.hall9899@gmail.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (79, 79, 4, 'mia.cook100101@yahoo.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (80, 80, 5, 'logan.mitchell102103@hotmail.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (81, 81, 1, 'olivia.morgan104105@outlook.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (82, 82, 2, 'aiden.phillips106107@gmail.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (83, 83, 3, 'emily.stewart108109@yahoo.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (84, 84, 4, 'noah.roberts110111@hotmail.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (85, 85, 5, 'grace.scott112113@outlook.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (86, 86, 1, 'jacob.clark114115@gmail.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (87, 87, 2, 'sophia.brown116117@yahoo.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (88, 88, 3, 'daniel.harris118119@hotmail.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (89, 89, 4, 'emma.jones120121@outlook.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (90, 90, 5, 'nathan.wilson122123@gmail.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (91, 91, 1, 'isabella.davis124125@yahoo.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (92, 92, 2, 'lucas.martin126127@hotmail.com', '0123456789');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (93, 93, 3, 'lily.thompson128129@outlook.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (94, 94, 4, 'abigail.green130131@gmail.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (95, 95, 5, 'ethan.hall132133@yahoo.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (96, 96, 1, 'mia.baker134135@hotmail.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (97, 97, 2, 'ason.walker136137@gmail.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (98, 98, 3, 'sophie.morris138139@yahoo.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (99, 99, 4, 'matthew.carter140141@hotmail.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (100, 100, 5, 'olivia.brown142143@outlook.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (101, 98, 3, 'jackson.harris144145@gmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (102, 98, 3, 'emily.adams146147@yahoo.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (103, 98, 3, 'samuel.wright148149@hotmail.com', '9045671234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (104, 55, 5, 'chloe.mitchell150151@outlook.com', '7654321098');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (105, 55, 5, 'ethan.perry152153@gmail.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (106, 78, 3, 'ava.cooper154155@yahoo.com', '9876543210');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (107, 78, 3, 'john.doe@example.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (108, 96, 1, 'mary.smith@example.com', '7650984321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (109, 86, 1, 'johndoe123@example.com', '9012374568');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (110, 86, 1, 'msmith85@example.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (111, 96, 1, 'alex.jones@example.com', '9087654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (112, 12, 2, 'emily.wilson@example.com', '3210987654');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (113, 12, 2, 'jenniferbrown@example.com', '8765012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (114, 12, 2, 'david.miller@example.com', '1234567890');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (115, 12, 2, 'sarahjane@example.com', '7890123456');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (116, 1, 1, 'samuel.jackson@example.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (117, 2, 2, 'amanda.harris@example.com', '2345678901');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (118, 3, 3, 'robertsmith@example.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (119, 4, 4, 'olivia.carter@example.com', '4567890123');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (120, 5, 5, 'william.johnson@example.com', '7890654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (121, 6, 1, 'sophia.brown@example.com', '9012345678');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (122, 7, 2, 'michael.davis@example.com', '6789012345');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (123, 7, 2, 'emma.jones@example.com', '3456789012');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (124, 6, 1, 'jacob.thomas@example.com', '5678901234');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (125, 6, 1, 'lily.green@example.com', '8901234567');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (126, 6, 1, 'ethan.wilson@example.com', '0987654321');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (127, 10, 5, 'ava.rodriguez@example.com', '6543210987');
INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (128, 11, 1, 'noah.martinez@example.com', '2345678901');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (129, 11, 1, 'mia.walker@example.com', '4567890123');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (130, 11, 1, 'matthew.roberts@example.com', '9876543210');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (131, 12, 2, 'isabella.campbell@example.com', '8901234567');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (132, 12, 2, 'jayden.anderson@example.com', '1234567890');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (133, 13, 3, 'abigail.white@example.com', '2345678901');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (134, 31, 1, 'austin.thompson@example.com', '3456789012');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (135, 31, 1, 'grace.hill@example.com', '4567890123');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (136, 31, 1, 'logan.martin@example.com', '5678901234');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (137, 1, 1, 'sophia.morris@example.com', '6789012345');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (138, 2, 2, 'gabriel.lewis@example.com', '7890123456');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (139, 3, 3, 'harper.lee@example.com', '8901234567');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (140, 4, 4, 'james.sanchez@example.com', '9012345678');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (141, 5, 5, 'emily.phillips@example.com', '0123456789');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (142, 6, 1, 'jackson.hernandez@example.com', '1234567890');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (143, 7, 2, 'madison.king@example.com', '2345678901');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (144, 8, 3, 'aiden.mitchell@example.com', '3456789012');

INSERT INTO public.visitor (id_person, id_ticket, id_loc, email, contact_number) VALUES (145, 8, 3, 'addison.turner@example.com', '4567890123');








INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (1, 124, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (2, 125, 20);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (3, 126, 15);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (4, 127, 30);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (5, 128, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (6, 129, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (7, 130, 15);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (8, 131, 20);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (9, 132, 30);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (10, 133, 20);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (1, 134, 15);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (1, 135, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (1, 136, 15);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (2, 137, 30);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (2, 138, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (3, 139, 20);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (1, 140, 30);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (4, 141, 15);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (6, 142, 10);

INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (6, 143, 20);
INSERT INTO public.backstage_pass (performer_id_person, id_person, duration)
VALUES (4, 143, 20);





INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 1);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 2);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 3);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 4);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 5);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 6);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 7);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 8);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 9);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 10);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 11);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 12);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 13);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 14);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 15);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 16);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 17);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 18);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 19);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 20);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 21);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 22);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 23);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 24);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 25);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 26);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 27);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 28);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 29);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 30);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 31);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 32);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 33);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 34);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 35);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 36);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 37);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 38);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 39);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (48, 40);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (42, 2);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (43, 3);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (44, 4);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (45, 5);
INSERT INTO public.staff_member_performer (staff_member_id_person, performer_id_person) VALUES (50, 10);



INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (41, 30, 15);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (42, 15, 15);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (43, 14, 14);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (44, 29, 14);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (45, 13, 13);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (46, 28, 13);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (47, 27, 12);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (48, 12, 12);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (49, 11, 11);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (51, 26, 11);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (51, 25, 10);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (52, 10, 10);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (53, 24, 9);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (54, 26, 11);

INSERT INTO public.staff_member_performance (staff_member_id_person, performance_id_person, id_stage)
VALUES (54, 27, 12);

