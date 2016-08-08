-- Pais [ent2y]
create table `pais` (
   `id_pais`  integer  not null,
   `borrado`  bit,
   `nombrepais`  varchar(255),
  primary key (`id_pais`)
);


-- Ciudad  [ent3y]
create table `ciudad` (
   `oid`  integer  not null,
   `borrado`  bit,
   `nombre`  varchar(255),
  primary key (`oid`)
);


-- Vuelo [ent4y]
create table `vuelo` (
   `id_vuelo`  integer  not null,
   `borrado`  bit,
   `diallegada`  date,
   `diasalida`  date,
   `horallegada`  time,
   `horasalida`  time,
   `asientoslibres`  varchar(255),
  primary key (`id_vuelo`)
);


-- Asiento [ent5y]
create table `asiento` (
   `id_asiento`  integer  not null,
   `borrado`  bit,
   `estado`  bit,
   `tipo`  varchar(255),
  primary key (`id_asiento`)
);


-- Reserva [ent6y]
create table `reserva` (
   `id_reserva`  integer  not null,
   `borrado`  bit,
  primary key (`id_reserva`)
);


-- User [User]
alter table `user`  add column  `name`  varchar(255);
alter table `user`  add column  `lastname`  varchar(255);
alter table `user`  add column  `borrado`  bit;


-- Pais_Ciudad  [rel1y]
alter table `ciudad`  add column  `pais_id_pais`  integer;
alter table `ciudad`   add index fk_ciudad_pais (`pais_id_pais`), add constraint fk_ciudad_pais foreign key (`pais_id_pais`) references `pais` (`id_pais`);


-- Origen [rel2y]
alter table `vuelo`  add column  `ciudad_oid`  integer;
alter table `vuelo`   add index fk_vuelo_ciudad (`ciudad_oid`), add constraint fk_vuelo_ciudad foreign key (`ciudad_oid`) references `ciudad` (`oid`);


-- Destino [rel3y]
alter table `vuelo`  add column  `ciudad_oid_2`  integer;
alter table `vuelo`   add index fk_vuelo_ciudad_2 (`ciudad_oid_2`), add constraint fk_vuelo_ciudad_2 foreign key (`ciudad_oid_2`) references `ciudad` (`oid`);


-- Asiento_Reserva [rel4y]
create table `asiento_reserva` (
   `asiento_id_asiento`  integer not null,
   `reserva_id_reserva`  integer not null,
  primary key (`asiento_id_asiento`, `reserva_id_reserva`)
);
alter table `asiento_reserva`   add index fk_asiento_reserva_asiento (`asiento_id_asiento`), add constraint fk_asiento_reserva_asiento foreign key (`asiento_id_asiento`) references `asiento` (`id_asiento`);
alter table `asiento_reserva`   add index fk_asiento_reserva_reserva (`reserva_id_reserva`), add constraint fk_asiento_reserva_reserva foreign key (`reserva_id_reserva`) references `reserva` (`id_reserva`);


-- Vuelo_Reserva [rel6y]
alter table `reserva`  add column  `vuelo_id_vuelo`  integer;
alter table `reserva`   add index fk_reserva_vuelo (`vuelo_id_vuelo`), add constraint fk_reserva_vuelo foreign key (`vuelo_id_vuelo`) references `vuelo` (`id_vuelo`);


-- User_Reserva [rel8y]
alter table `reserva`  add column  `user_oid`  integer;
alter table `reserva`   add index fk_reserva_user (`user_oid`), add constraint fk_reserva_user foreign key (`user_oid`) references `user` (`oid`);


