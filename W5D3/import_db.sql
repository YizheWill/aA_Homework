create table plays (
  id integer primary key,
  title text not null,
  year integer not null, 
  playwright_id integer not null,
  foreign key (playwright_id) references playwrights(id)
 );

create table playwrights (
  id integer primary key,
  name text not null,
  birth_year integer
);

insert into playwrights (name, birth_year)
values
  ('Arthur Miller', 1915),
  ('Eugene O''Neill', 1888);

insert into plays (title, year, playwright_id)
values
  ('All my sons', 1947, (select id from playwrights where name = 'Arthur Miller')),
  ('Long Day ''s Journey Into Night' , 1956, (select id from playwrights where name = 'Eugene O''Neill'));

