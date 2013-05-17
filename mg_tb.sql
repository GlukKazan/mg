create table    mg_table (
  table_name    varchar(100)   not null,
  pk_name       varchar(100)   not null,
  primary key(table_name)
);

create sequence mg_action_seq;

create table    mg_action (
  id            bigint         default nextval('mg_action_seq') not null,
  table_name    varchar(100)   not null references mg_table(table_name),
  old_id        varchar(50)    not null,
  new_id        varchar(50)    not null,
  action_time   timestamp      default now() not null,
  primary key(id)
);

create sequence mg_action_detail_seq;

create table    mg_action_detail (
  id            bigint         default nextval('mg_action_detail_seq') not null,
  action_id     bigint         not null references mg_action(id),
  table_name    varchar(100)   not null,
  pk_name       varchar(100)   not null,
  column_name   varchar(100)   not null,
  obj_id        varchar(50)    not null,
  primary key(id)
);
