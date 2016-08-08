-- Reserva_Vuelo_Vuelta [rel2q]
alter table `reserva`  add column  `vuelo_id_vuelo_2`  integer;
alter table `reserva`   add index fk_reserva_vuelo_2 (`vuelo_id_vuelo_2`), add constraint fk_reserva_vuelo_2 foreign key (`vuelo_id_vuelo_2`) references `vuelo` (`id_vuelo`);


