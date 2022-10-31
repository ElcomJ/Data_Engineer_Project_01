select
    product_name AS name,
    trunc(unit_price, 0) AS price
from products
order by price desc
limit 10;
