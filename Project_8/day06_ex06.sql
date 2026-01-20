CREATE SEQUENCE seq_person_discounts
    INCREMENT 1
    START 1;

SELECT setval('seq_person_discounts', (SELECT count(*) FROM person_discounts) + 1);

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
