-- Pasajero [ent1q]
create table `pasajero` (
   `id_pasajero`  integer  not null,
   `emailpasajero`  varchar(255),
   `nombrepasajero`  varchar(255),
   `fechanacimiento`  date,
   `cedula`  varchar(255),
  primary key (`id_pasajero`)
) ENGINE=InnoDB;


-- Reserva_Pasajero [rel1q]
alter table `pasajero`  add column  `reserva_id_reserva`  integer;
alter table `pasajero`   add index fk_pasajero_reserva (`reserva_id_reserva`), add constraint fk_pasajero_reserva foreign key (`reserva_id_reserva`) references `reserva` (`id_reserva`);


