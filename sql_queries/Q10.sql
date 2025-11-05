-- Show all performers that are older than 30
SELECT DISTINCT name, surname, age
FROM (
     SELECT DISTINCT person.id_person, person.name, person.surname, person.age,
                     performer.id_person AS id_1, performer.pseudonym,
                     performer.salary, performer.amount_of_people
     FROM person
              JOIN performer ON person.id_person = performer.id_person
     ) r1
WHERE age > 30;