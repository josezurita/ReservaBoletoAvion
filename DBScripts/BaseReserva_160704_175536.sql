-- Vuelo.origen [ent4y#att32y]
create view `vuelo_origen_view` as
select AL1.`id_vuelo` as `id_vuelo`, AL2.`nombre` as `der_attr`
from  `vuelo` AL1 
               left outer join `ciudad` AL2 on AL1.`ciudad_oid`=AL2.`oid`;


-- Vuelo.destino [ent4y#att33y]
create view `vuelo_destino_view` as
select AL1.`id_vuelo` as `id_vuelo`, AL2.`nombre` as `der_attr`
from  `vuelo` AL1 
               left outer join `ciudad` AL2 on AL1.`ciudad_oid_2`=AL2.`oid`;


