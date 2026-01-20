CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT 
    discount
FROM person_discounts
WHERE person_id > 8 
    AND pizzeria_id BETWEEN 2 AND 5;

SET enable_seqscan = ON;