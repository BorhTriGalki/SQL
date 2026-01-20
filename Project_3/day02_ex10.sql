SELECT pe1.name AS person_name1, 
	   pe2.name AS person_name2, 
	   pe1.address AS common_address
FROM person pe1
INNER JOIN person pe2
	ON pe1.address = pe2.address
WHERE pe1.id > pe2.id
ORDER BY person_name1, person_name2, common_address;