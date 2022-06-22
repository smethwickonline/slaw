create table users (
  id serial primary key,
  username varchar(255)
    not null
    check (content != ''),
  password varchar(255)
    not null
    check (content != ''),
);

create table forums (
    id serial primary key,
    name varchat(255)
        not null
        check (content != '')
);