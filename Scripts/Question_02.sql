select
    e.first_name + ' ' + e.last_name AS name,
    trunc(sum(od.unit_price * od.quantity - od.discount), 2) AS total_sales
from order_details AS od
inner join orders AS o
using(order_id)
inner join employees AS e
using(employee_id)
where date_part(year, o.order_date) = 2022
group by name
order by total_sales DESC
limit 10;
