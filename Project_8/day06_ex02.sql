SELECT 
    pe.name, 
    m.pizza_name, 
    m.price, 
    ROUND(m.price - (m.price / 100 * pd.discount)) AS discount_price, 
    pi.name AS pizzeria_name
FROM person_order po
INNER JOIN person pe 
    ON pe.id = po.person_id
INNER JOIN menu m 
    ON m.id = po.menu_id
INNER JOIN pizzeria pi 
    ON pi.id = m.pizzeria_id
INNER JOIN person_discounts pd 
    ON (po.person_id = pd.person_id AND pi.id = pd.pizzeria_id)
ORDER BY 1, 2;
