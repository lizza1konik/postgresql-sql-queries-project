-- Remove conflicting tables
DROP TABLE IF EXISTS backstage_pass CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS performance CASCADE;
DROP TABLE IF EXISTS performer CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS rent CASCADE;
DROP TABLE IF EXISTS sound_equipment CASCADE;
DROP TABLE IF EXISTS staff_member CASCADE;
DROP TABLE IF EXISTS stage CASCADE;
DROP TABLE IF EXISTS ticket CASCADE;
DROP TABLE IF EXISTS visitor CASCADE;
DROP TABLE IF EXISTS staff_member_performer CASCADE;
DROP TABLE IF EXISTS staff_member_performance CASCADE;
-- End of removing

CREATE TABLE backstage_pass (
                                performer_id_person INTEGER NOT NULL,
                                id_person INTEGER NOT NULL,
                                duration INTEGER NOT NULL
);
ALTER TABLE backstage_pass ADD CONSTRAINT pk_backstage_pass PRIMARY KEY (performer_id_person, id_person);

CREATE TABLE location (
                          id_loc SERIAL NOT NULL,
                          name VARCHAR(256) NOT NULL,
                          capacity INTEGER NOT NULL,
                          city VARCHAR(256),
                          country VARCHAR(256)
);
ALTER TABLE location ADD CONSTRAINT pk_location PRIMARY KEY (id_loc);

CREATE TABLE performance (
                             id_person INTEGER NOT NULL,
                             id_stage INTEGER NOT NULL,
                             id_rent INTEGER NOT NULL,
                             name VARCHAR(256) NOT NULL,
                             duration INTEGER NOT NULL
);
ALTER TABLE performance ADD CONSTRAINT pk_performance PRIMARY KEY (id_person, id_stage);
ALTER TABLE performance ADD CONSTRAINT u_fk_performance_performer UNIQUE (id_person);
ALTER TABLE performance ADD CONSTRAINT u_fk_performance_sound_equipmen UNIQUE (id_rent);

CREATE TABLE performer (
                           id_person INTEGER NOT NULL,
                           pseudonym VARCHAR(256) NOT NULL,
                           salary INTEGER NOT NULL,
                           amount_of_people INTEGER
);
ALTER TABLE performer ADD CONSTRAINT pk_performer PRIMARY KEY (id_person);
ALTER TABLE performer ADD CONSTRAINT uc_performer_pseudonym UNIQUE (pseudonym);

CREATE TABLE person (
                        id_person SERIAL NOT NULL,
                        name VARCHAR(256) NOT NULL,
                        surname VARCHAR(256) NOT NULL,
                        age INTEGER
);
ALTER TABLE person ADD CONSTRAINT pk_person PRIMARY KEY (id_person);

CREATE TABLE rent (
                      id_rent SERIAL NOT NULL,
                      price VARCHAR(256),
                      duration INTEGER,
                      company_name VARCHAR(256)
);
ALTER TABLE rent ADD CONSTRAINT pk_rent PRIMARY KEY (id_rent);

CREATE TABLE sound_equipment (
                                 id_rent INTEGER NOT NULL,
                                 name_of_set VARCHAR(256) NOT NULL
);
ALTER TABLE sound_equipment ADD CONSTRAINT pk_sound_equipment PRIMARY KEY (id_rent);

CREATE TABLE staff_member (
                              id_person INTEGER NOT NULL,
                              salary INTEGER NOT NULL
);
ALTER TABLE staff_member ADD CONSTRAINT pk_staff_member PRIMARY KEY (id_person);

CREATE TABLE stage (
                       id_stage SERIAL NOT NULL,
                       id_loc INTEGER NOT NULL,
                       id_rent INTEGER NOT NULL,
                       name VARCHAR(256) NOT NULL
);
ALTER TABLE stage ADD CONSTRAINT pk_stage PRIMARY KEY (id_stage);
ALTER TABLE stage ADD CONSTRAINT u_fk_stage_rent UNIQUE (id_rent);

CREATE TABLE ticket (
                        id_ticket SERIAL NOT NULL,
                        price INTEGER NOT NULL,
                        type VARCHAR(256)
);
ALTER TABLE ticket ADD CONSTRAINT pk_ticket PRIMARY KEY (id_ticket);

CREATE TABLE visitor (
                         id_person INTEGER NOT NULL,
                         id_ticket INTEGER NOT NULL,
                         id_loc INTEGER,
                         email VARCHAR(256) NOT NULL,
                         contact_number VARCHAR(256) NOT NULL
);
ALTER TABLE visitor ADD CONSTRAINT pk_visitor PRIMARY KEY (id_person);

CREATE TABLE staff_member_performer (
                                        staff_member_id_person INTEGER NOT NULL,
                                        performer_id_person INTEGER NOT NULL
);
ALTER TABLE staff_member_performer ADD CONSTRAINT pk_staff_member_performer PRIMARY KEY (staff_member_id_person, performer_id_person);

CREATE TABLE staff_member_performance (
                                          staff_member_id_person INTEGER NOT NULL,
                                          performance_id_person INTEGER NOT NULL,
                                          id_stage INTEGER NOT NULL
);
ALTER TABLE staff_member_performance ADD CONSTRAINT pk_staff_member_performance PRIMARY KEY (staff_member_id_person, performance_id_person, id_stage);

ALTER TABLE backstage_pass ADD CONSTRAINT fk_backstage_pass_performer FOREIGN KEY (performer_id_person) REFERENCES performer (id_person) ON DELETE CASCADE;
ALTER TABLE backstage_pass ADD CONSTRAINT fk_backstage_pass_visitor FOREIGN KEY (id_person) REFERENCES visitor (id_person) ON DELETE CASCADE;

ALTER TABLE performance ADD CONSTRAINT fk_performance_performer FOREIGN KEY (id_person) REFERENCES performer (id_person) ON DELETE CASCADE;
ALTER TABLE performance ADD CONSTRAINT fk_performance_stage FOREIGN KEY (id_stage) REFERENCES stage (id_stage) ON DELETE CASCADE;
ALTER TABLE performance ADD CONSTRAINT fk_performance_sound_equipment FOREIGN KEY (id_rent) REFERENCES sound_equipment (id_rent) ON DELETE CASCADE;

ALTER TABLE performer ADD CONSTRAINT fk_performer_person FOREIGN KEY (id_person) REFERENCES person (id_person) ON DELETE CASCADE;

ALTER TABLE sound_equipment ADD CONSTRAINT fk_sound_equipment_rent FOREIGN KEY (id_rent) REFERENCES rent (id_rent) ON DELETE CASCADE;

ALTER TABLE staff_member ADD CONSTRAINT fk_staff_member_person FOREIGN KEY (id_person) REFERENCES person (id_person) ON DELETE CASCADE;

ALTER TABLE stage ADD CONSTRAINT fk_stage_location FOREIGN KEY (id_loc) REFERENCES location (id_loc) ON DELETE CASCADE;
ALTER TABLE stage ADD CONSTRAINT fk_stage_rent FOREIGN KEY (id_rent) REFERENCES rent (id_rent) ON DELETE CASCADE;

ALTER TABLE visitor ADD CONSTRAINT fk_visitor_person FOREIGN KEY (id_person) REFERENCES person (id_person) ON DELETE CASCADE;
ALTER TABLE visitor ADD CONSTRAINT fk_visitor_ticket FOREIGN KEY (id_ticket) REFERENCES ticket (id_ticket) ON DELETE CASCADE;
ALTER TABLE visitor ADD CONSTRAINT fk_visitor_location FOREIGN KEY (id_loc) REFERENCES location (id_loc) ON DELETE CASCADE;

ALTER TABLE staff_member_performer ADD CONSTRAINT fk_staff_member_performer_staff FOREIGN KEY (staff_member_id_person) REFERENCES staff_member (id_person) ON DELETE CASCADE;
ALTER TABLE staff_member_performer ADD CONSTRAINT fk_staff_member_performer_perfo FOREIGN KEY (performer_id_person) REFERENCES performer (id_person) ON DELETE CASCADE;

ALTER TABLE staff_member_performance ADD CONSTRAINT fk_staff_member_performance_sta FOREIGN KEY (staff_member_id_person) REFERENCES staff_member (id_person) ON DELETE CASCADE;
ALTER TABLE staff_member_performance ADD CONSTRAINT fk_staff_member_performance_per FOREIGN KEY (performance_id_person, id_stage) REFERENCES performance (id_person, id_stage) ON DELETE CASCADE;