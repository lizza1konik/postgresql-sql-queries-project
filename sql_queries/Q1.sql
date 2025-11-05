-- Show performers name and surname, that have a concert on the 15th stage
select p.name, p.surname from person p
join performer per on p.id_person = per.id_person
join performance perform on perform.id_person = per.id_person
where perform.id_stage=15;