-- Alumnos en más de un club --
select COUNT(c.pid), s.firstname, s.lastname
from Clubs C, Student S, CampusClub CC
where c.pid=s.pid and c.cid=cc.cid
group by s.firstname, s.lastname
having COUNT(c.pid) > 1

--Alumnos que no pertenecen a ningún club --
select distinct s.firstname, s.lastname
from Clubs C, Student S, CampusClub cc
where s.pid NOT IN (select c.pid
from Clubs C, student S, CampusClub cc
where cc.cid=c.cid and s.pid=c.pid )

--Seleccionar primer nombre y fecha de nacimiento para alumnos que pertenecen a club 1 --
select firstname, dob
from Clubs C, Student S, CampusClub cc
where c.cid = 1 and cc.cid=c.cid and s.pid=c.pid

--Encontrar al asesor académico del Club2 (nombre rango y departamento donde trabaja) --
select cc.name, deref(advisorof).firstname as firstname, deref(advisorof).lastname as lastname, deref(advisorof).rank as rank
from campusclub cc
where cc.cid = '101'
