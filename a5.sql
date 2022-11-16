create table areas ( 
    area number(5), 
    radius number(5) 
);

declare 
area number; 
radius number; 
pi number := 3.14; 
begin 
for radius in 5..9 loop 
 area := pi*radius*radius; 
 insert into areas values(area, radius); 
end loop; 
end;
/

select * from areas;
