

create table users
(
    id       int primary key auto_increment,
    login    varchar(30) not null,
    password varchar(60) not null,
    unique uniq_login (login)
);

create table permissions
(
    id         int primary key auto_increment,
    permission varchar(30) not null,
    unique uniq_permission (permission)
);

create table user_to_permissions (
                                     user_id int not null,
                                     permission_id int not null,
                                     constraint fk_user_to_permission_user foreign key (user_id) references users(id),
                                     constraint fk_user_to_permission_permission foreign key (permission_id) references permissions(id)
);



insert into users (login, password) values
('admin', 'password'),
('catalog', 'password'),
('user', 'password');

insert into permissions (permission) values
('VIEW_ADMIN'),
('VIEW_CATALOG');

insert into user_to_permissions (user_id, permission_id) values
((select id from users where login = 'admin'), (select id from permissions where permission = 'VIEW_ADMIN')),
((select id from users where login = 'admin'), (select id from permissions where permission = 'VIEW_CATALOG')),
((select id from users where login = 'catalog'), (select id from permissions where permission = 'VIEW_CATALOG'));