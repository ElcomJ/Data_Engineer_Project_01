with result as (
    select
        c.category_name AS category,
        trunc(sum(od.unit_price * od.quantity - od.discount), 0) AS total,
        date_part(year, o.order_date) AS year,
        row_number() over (partition by year order by year, total desc) as res
    from categories AS c
    inner join products AS p
    using(category_id)
    inner join order_details AS od
    using(product_id)
    inner join orders AS o
    using(order_id)
    group by category, year
    order by year, total desc
),

filter as (
    select *
    from result
    where res <= 5
)

select
    category,
    year,
    total
from filter;
