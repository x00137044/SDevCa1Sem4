create table address (
  id                            bigint auto_increment not null,
  street                        varchar(255),
  county                        varchar(255),
  constraint pk_address primary key (id)
);

create table department (
  id                            bigint auto_increment not null,
  d_name                          varchar(255),
  constraint pk_department primary key (id)
);

create table employee (
  id                            bigint auto_increment not null,
  fname                         varchar(255),
  lname                         varchar(255),
  department_id                 bigint,
  address_id                    bigint,
  constraint uq_employee_address_id unique (address_id),
  constraint pk_employee primary key (id)
);

create table project (
  id                            bigint auto_increment not null,
  p_name                          varchar(255),
  description                   varchar(255),
  deadline                      varchar(255),
  constraint pk_project primary key (id)
);

create table project_employee (
  project_id                    bigint not null,
  employee_id                   bigint not null,
  constraint pk_project_employee primary key (project_id,employee_id)
);



alter table employee add constraint fk_employee_department_id foreign key (department_id) references department (id) on delete restrict on update restrict;
create index ix_employee_department_id on employee (department_id);

alter table employee add constraint fk_employee_address_id foreign key (address_id) references address (id) on delete restrict on update restrict;

alter table project_employee add constraint fk_project_employee_project foreign key (project_id) references project (id) on delete restrict on update restrict;
create index ix_project_employee_project on project_employee (project_id);

alter table project_employee add constraint fk_project_employee_employee foreign key (employee_id) references employee (id) on delete restrict on update restrict;
create index ix_project_employee_employee on project_employee (employee_id);


# --- !Downs

alter table employee drop constraint if exists fk_employee_department_id;
drop index if exists ix_employee_department_id;

alter table employee drop constraint if exists fk_employee_address_id;

alter table project_employee drop constraint if exists fk_project_employee_project;
drop index if exists ix_project_employee_project;

alter table project_employee drop constraint if exists fk_project_employee_employee;
drop index if exists ix_project_employee_employee;

drop table if exists address;

drop table if exists department;

drop table if exists employee;

drop table if exists project;

drop table if exists project_employee;

drop table if exists user;