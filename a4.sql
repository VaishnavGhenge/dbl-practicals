create table borrower (
    roll number,
    name varchar2(25),
    dateofissue date,
    nameofbook varchar2(20),
    status varchar2(20)
);

create table fine (
    roll number,
    dateofi date,
    amt number
);

insert into borrower values(1, 'Vaishnav', to_date('17-10-2022', 'DD-MM-YYYY'), 'Wings of Fire', 'I');
insert into borrower values(2, 'Jayesh', to_date('17-09-2022', 'DD-MM-YYYY'), 'Wings of Fire', 'I');
insert into borrower values(3, 'Atharva', to_date('10-11-2022', 'DD-MM-YYYY'), 'Wings of Fire', 'I');

declare
roll number;
no_ofdays number;
doi date;
nameofbook varchar2(20);
today_date date := to_date(sysdate, 'DD-MM-YYYY');
NEG_DAYS exception;
fine number := 0;
begin
roll := '&roll_no';
nameofbook := '&name_of_book';
select to_date(borrower.dateofissue, 'DD-MM-YYYY') into doi from borrower where borrower.nameofbook = name and borrower.roll = roll;

no_ofdays := today_date-doi;

if no_ofdays < 0 then
    raise NEG_DAYS;
end if;

dbms_output.put_line(no_ofdays);

if no_ofdays <= 30 and no_ofdays >= 15 then
fine := 5*no_ofdays;
elsif no_ofdays > 30 then
fine := (50*(no_ofdays-30)) + 150;
end if;
dbms_output.put_line(fine);

if fine > 0 then
insert into fine values(roll, today_date, fine);
end if;

update borrower set status = 'R' where borrower.roll =roll;

exception
when NEG_DAYS then
dbms_output.put_line('Negative days not accepted');
when no_data_found then
dbms_output.put_line('No data found');
when others then
dbms_output.put_line('Something went wrong');
end;
/

select * from fine;
select * from borrower;
