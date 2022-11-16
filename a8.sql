create table library
(
    book_id number(5),
    book_name varchar(20),
    book_type varchar(20),
    issued_by varchar(20),
    issue_date date
);

insert into library values(1, 'Wings of Fire', 'Biography', 'Vaishnav Ghenge', TO_DATE('17-11-2022', 'DD-MM-YYYY'));
insert into library values(2, 'Wings of Fire 2', 'Biography', 'Atharva Nigal', TO_DATE('17-11-2022', 'DD-MM-YYYY'));
insert into library values(3, 'Wings of Fire 3', 'Biography', 'Jayesh Nikumbh', TO_DATE('17-11-2022', 'DD-MM-YYYY'));
insert into library values(4, 'Wings of Fire 4', 'Biography', 'Saurabh Dev', TO_DATE('17-11-2022', 'DD-MM-YYYY'));

create table library_audit
(
    book_id number(5),
    book_name varchar(20),
    book_type varchar(20),
    issued_by varchar(20),
    issue_date date
);

create or replace trigger lib_trigger
after update or delete on library
for each row
begin
insert into library_audit values(:OLD.book_id, :OLD.book_name, :OLD.book_type, :OLD.issued_by, :OLD.issue_date);
end;
/

update library set issued_by = 'Soham Dalvi' where issued_by = 'Jayesh Nikumbh';

select * from library_audit;

select * from library;
