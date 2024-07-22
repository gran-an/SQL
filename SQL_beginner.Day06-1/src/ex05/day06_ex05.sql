COMMENT ON TABLE person_discounts IS 'Table with discounts to people from pizza places';
COMMENT ON COLUMN person_discounts.id IS 'Column with the sequence number of each row';
COMMENT ON COLUMN person_discounts.person_id IS 'Column indicating the id of the person whose discount is being discounted';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Column with the id of the pizzeria that issued the discount ';
COMMENT ON COLUMN person_discounts.discount IS 'Column indicating the discount in percentages';