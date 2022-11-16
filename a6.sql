create table stud_marks (
    name varchar2(20),
    total_marks number(5)
);

create table result (
    roll number,
    name varchar2(20),
    class varchar2(20)
);

create or replace procedure proc_grade
(roll in number, name in varchar2, marks in number)
as
begin
if marks <= 1500 and marks >= 990 then
    dbms_output.put_line('Congratulations ' || name || ' is in Distinction!' );
    insert into result values(roll, name, 'Distinction');
elsif marks <= 989 and marks >= 900 then
    dbms_output.put_line('Congratulations ' || name || ' is in First Class!' );
    insert into result values(roll, name, 'First Class');
elsif marks <= 899 and marks >= 825 then
    dbms_output.put_line('Congratulations ' || name || ' is in Higher Second Class!' );
    insert into result values(roll, name, 'Higher Second Class');
else
    dbms_output.put_line('Congratulations ' || name || ' is Fail!' );
    insert into result values(roll, name, 'NA');
end if;
insert into stud_marks values(name, marks);
end proc_grade;

begin
proc_grade(2, 'Vaishnav Ghenge', 100);
proc_grade(15, 'Athrva Nigal', 1400);
proc_grade(17, 'Jayesh Nikumbh', 898);
end;
    
    
