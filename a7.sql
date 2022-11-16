create table cust_old ( 
    name varchar(20), 
    primary key(name) 
);

create table cust_new ( 
    name varchar(20), 
    primary key(name) 
);

insert into cust_old values('abc');
insert into cust_old values('pqr');
insert into cust_old values('xyz');
insert into cust_old values('xcr');

insert into cust_new values('abc');
insert into cust_new values('xcr');

select * from cust_old;

select * from cust_new;

declare 
val1 varchar(20); 
val2 varchar(20); 
cursor cur1 is select name from cust_old; 
cursor cur2 is select name from cust_new; 
begin 
open cur1; 
open cur2; 
loop 
fetch cur1 into val1; 
fetch cur2 into val2; 
dbms_output.put_line(val1 || ' ' || val2);
exit when cur1%notfound; 
if val2 <> val1 then 
insert into cust_new values(val1); 
end if; 
end loop; 
close cur1; 
close cur2; 
end;
/

select * from cust_old;

select * from cust_new;
