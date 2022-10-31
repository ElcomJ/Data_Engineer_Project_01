select
    od.order_id,
    od.quantity AS quantity,
    p.product_name,
    od.unit_price AS order_details_price,
    p.unit_price AS products_price,
    round((p.unit_price - od.unit_price), 2) AS difference,
    od.discount AS discount
from order_details AS od
inner join products AS p
using(product_id)
where od.unit_price < p.unit_price
order by difference desc
limit 10;
