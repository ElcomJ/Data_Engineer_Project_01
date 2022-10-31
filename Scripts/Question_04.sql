with pro_2020 as (
    select
        p.product_name AS product,
        s.supplier_id AS id,
        s.company_name AS company,
        trunc(sum(od.unit_price * od.quantity), 2) AS total_2020
    from order_details AS od
    inner join products AS p
    using(product_id)
    inner join suppliers AS s
    using(supplier_id)
    inner join orders AS o
    using(order_id)
    where date_part(year, o.order_date) = 2020
    group by product, id, company
    order by total_2020 desc
    limit 10
),

pro_2021 as (
    select
        p.product_name AS product,
        s.supplier_id AS id,
        s.company_name AS company,
        trunc(sum(od.unit_price * od.quantity), 2) AS total_2021
    from order_details AS od
    inner join products AS p
    using(product_id)
    inner join suppliers AS s
    using(supplier_id)
    inner join orders AS o
    using(order_id)
    where date_part(year, o.order_date) = 2021
    group by product, id, company
    order by total_2021 desc
    limit 10
),

ambos as (
    select
        pro_2021.id,
        pro_2020.company,
        trunc(total_2020, 0) AS "2020",
        trunc(total_2021, 0) AS "2021",
        trunc((total_2021 - total_2020), 0) AS Difference
    from pro_2020
    inner join pro_2021
    using(id)
    order by Difference desc
)

select *
from ambos;
