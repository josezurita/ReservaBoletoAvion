-- Vuelo.asientosLibres [ent4y#att14y]
create view `vuelo_asientoslibres_view` as
select AL1.`id_vuelo` as `id_vuelo`, count(distinct AL2.`id_asiento`) as `der_attr`
from  `vuelo` AL1 
               left outer join `asiento` AL2 on AL1.`id_vuelo`=AL2.`vuelo_id_vuelo`
where AL2.`estado` = '1'
group by AL1.`id_vuelo`;


