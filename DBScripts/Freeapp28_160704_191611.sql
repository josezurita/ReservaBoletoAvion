-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `borrado`  bit,
   `lastname`  varchar(255),
   `name`  varchar(255),
   `bithdate`  date,
  primary key (`oid`)
) ENGINE=InnoDB;


-- Pais [ent2y]
create table `pais` (
   `id_pais`  integer  not null,
   `borrado`  bit,
   `nombrepais`  varchar(255),
  primary key (`id_pais`)
) ENGINE=InnoDB;


-- Ciudad  [ent3y]
create table `ciudad` (
   `oid`  integer  not null,
   `borrado`  bit,
   `nombre`  varchar(255),
  primary key (`oid`)
) ENGINE=InnoDB;


-- Vuelo [ent4y]
create table `vuelo` (
   `id_vuelo`  integer  not null,
   `borrado`  bit,
   `diallegada`  date,
   `diasalida`  date,
   `horallegada`  time,
   `horasalida`  time,
   `asientoslibres`  integer,
  primary key (`id_vuelo`)
) ENGINE=InnoDB;


-- Asiento [ent5y]
create table `asiento` (
   `id_asiento`  integer  not null,
   `borrado`  bit,
   `estado`  bit,
   `tipo`  varchar(255),
  primary key (`id_asiento`)
) ENGINE=InnoDB;


-- Reserva [ent6y]
create table `reserva` (
   `id_reserva`  integer  not null,
   `borrado`  bit,
  primary key (`id_reserva`)
) ENGINE=InnoDB;


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
) ENGINE=InnoDB;
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
) ENGINE=InnoDB;
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


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
) ENGINE=InnoDB;
alter table `asiento_reserva`   add index fk_asiento_reserva_asiento (`asiento_id_asiento`), add constraint fk_asiento_reserva_asiento foreign key (`asiento_id_asiento`) references `asiento` (`id_asiento`);
alter table `asiento_reserva`   add index fk_asiento_reserva_reserva (`reserva_id_reserva`), add constraint fk_asiento_reserva_reserva foreign key (`reserva_id_reserva`) references `reserva` (`id_reserva`);


-- Vuelo_Reserva [rel6y]
alter table `reserva`  add column  `vuelo_id_vuelo`  integer;
alter table `reserva`   add index fk_reserva_vuelo (`vuelo_id_vuelo`), add constraint fk_reserva_vuelo foreign key (`vuelo_id_vuelo`) references `vuelo` (`id_vuelo`);


-- User_Reserva [rel8y]
alter table `reserva`  add column  `user_oid`  integer;
alter table `reserva`   add index fk_reserva_user (`user_oid`), add constraint fk_reserva_user foreign key (`user_oid`) references `user` (`oid`);


-- Vuelo_Asiento [rel9y]
alter table `asiento`  add column  `vuelo_id_vuelo`  integer;
alter table `asiento`   add index fk_asiento_vuelo (`vuelo_id_vuelo`), add constraint fk_asiento_vuelo foreign key (`vuelo_id_vuelo`) references `vuelo` (`id_vuelo`);


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


