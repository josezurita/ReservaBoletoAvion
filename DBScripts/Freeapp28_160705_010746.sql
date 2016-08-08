-- Ciudad .pais [ent3y#att2y]
create view `ciudad_pais_view` as
select AL1.`oid` as `oid`, AL2.`nombrepais` as `der_attr`
from  `ciudad` AL1 
               left outer join `pais` AL2 on AL1.`pais_id_pais`=AL2.`id_pais`;


