CREATE VIEW v_price_with_discount AS
SELECT 
    pe.name, 
    m.pizza_name, 
    m.price, 
    ROUND(m.price - m.price * 0.1) AS discount_price
FROM person pe
INNER JOIN person_order po
    ON po.person_id = pe.id
INNER JOIN menu m
    ON m.id = po.menu_id
ORDER BY 1, 2;