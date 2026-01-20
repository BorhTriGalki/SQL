INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    new_order + (SELECT MAX(id) FROM person_order),
    new_order,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM generate_series(1, (SELECT COUNT(*) FROM person)) AS new_order;