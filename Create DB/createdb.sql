-- DROP TABLES --
drop type Person_t force
/
drop type CampusClub_t force
/
drop type Faculty_t force
/
drop type Student_t force
/
drop type Department_T force
/
drop table Clubs force
/
drop table Person FORCE
/
drop table CampusClub force
/
drop table Faculty force
/
drop table Student force
/
drop table Department force
/
CREATE OR REPLACE TYPE Person_t AS OBJECT(
    pid VARCHAR(50),
    dob date,
    firstname VARCHAR(20),
    lastName VARCHAR(60)
) NOT FINAL;
/
-- CREATE OR REPLACE EDITIONABLE TYPE Department_t AS OBJECT(
CREATE OR REPLACE TYPE Department_t AS OBJECT(
    code VARCHAR(10),
    name VARCHAR(30)
);
/
CREATE OR REPLACE TYPE Student_t under person_t(
    status VARCHAR(20),
    major ref Department_t
);
/
-- CREATE OR REPLACE EDITIONABLE TYPE Faculty_t under person_t(
CREATE OR REPLACE TYPE Faculty_t under person_t(
    rank VARCHAR(50),
    salaries INT
);
/
CREATE OR REPLACE EDITIONABLE TYPE CampusClub_t AS OBJECT(
    cid VARCHAR(30),
    name VARCHAR(30),
    location VARCHAR(50),
    phone VARCHAR(30),
    advisorof ref Faculty_t
);
/

--CREATE TABLES --
CREATE TABLE  Person OF  Person_t   (
    PRIMARY KEY (pid)
);
/
CREATE TABLE Student of Student_t(
   PRIMARY KEY (pid),
   constraint tipo_status CHECK (status IN ('freshman', 'sophomore', 'junior', 'senior'))
);
/
CREATE TABLE CampusClub of CampusClub_t(
    PRIMARY KEY (cid)
);
/
CREATE TABLE Faculty of Faculty_t  (
    PRIMARY KEY (pid),
    constraint tipo_rank CHECK (rank IN ('Instructor', 'Asistente', 'Asociado', 'Titular'))
);
/
CREATE TABLE Department of Department_t (
    PRIMARY KEY (code)
);
/
CREATE TABLE Clubs (
    pid VARCHAR(30),
    cid VARCHAR(30),
    PRIMARY KEY (pid, cid),
    FOREIGN KEY (pid) REFERENCES  Student(pid),
    FOREIGN KEY (cid) REFERENCES CampusClub(cid)
);
---INSERCION DE DEPARTMENT---
INSERT INTO Department Values('D001', 'Computer Science');
INSERT INTO Department Values('D002', 'Matematicas');

---INSERCION DE STUDENT---
alter session set NLS_DATE_FORMAT='DD-MM-YYYY';
INSERT INTO student VALUES('A001', '5-04-1995', 'Juan', 'Aa', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A002', '10-09-1995', 'Luis', 'Bb', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A003', '1-01-1995', 'Juan Luis', 'Cc', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A004', '2-09-1995', 'Miguel', 'Dd', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A005', '3-10-1995', 'Fernando', 'Ee', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A006', '4-11-1995', 'Pablo', 'Ff', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A007', '05-12-1995', 'Daniel', 'Gg', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A008', '5-08-1995', 'Jose', 'Hh', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A009', '08-07-1995', 'Abril', 'Ii', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A010', '10-09-1995', 'Marina', 'Jj', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A011', '6-02-1995', 'Mariana', 'Kk', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Computer Science'));
INSERT INTO student VALUES('A012', '7-02-1995', 'Andrea', 'Ll', 'freshman', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A013', '01-05-1995', 'Karen', 'Mm', 'freshman', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A014', '09-03-1995', 'Ana', 'Nn', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A015', '07-02-1995', 'Melissa', 'Oo', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A016', '8-03-1995', 'Maria', 'Pp', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A017', '9-09-1995', 'Paula', 'Qq', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A018', '04-07-1995', 'Carmelo', 'Rr', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A019', '4-08-1995', 'Oscar', 'Ss', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A020', '3-01-1995', 'Marcelo', 'Tt', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A021', '3-08-1995', 'Edgar', 'Uu', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A022', '2-06-1995', 'Adriana', 'Vv', 'freshman', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A023', '2-04-1995', 'Josh', 'Ww', 'freshman', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A024', '4-01-1995', 'Drake', 'Xx', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A025', '5-04-1995', 'Felipe', 'Yy', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A026', '1-10-1995', 'Diego', 'Zz', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A027', '3-03-1995', 'Jorge', 'ABab', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A028', '6-12-1995', 'Gerardo', 'ACac', 'junior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A029', '7-04-1995', 'Yarely', 'ADad', 'sophomore', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));
INSERT INTO student VALUES('A030', '9-12-1995', 'Gala', 'AEae', 'senior', (SELECT ref(d) FROM department d WHERE d.name='Matematicas'));

---INSERCION DE PROFESORES---
INSERT INTO Faculty Values('L001', '04/10/2000', 'Lavariega', 'Juan Carlos', 'Titular', 10000);
INSERT INTO Faculty Values('L002', '05/10/2000', 'Diaz', 'Pablo', 'Asociado', 12000);
INSERT INTO Faculty Values('L003', '06/10/2000', 'Garrido', 'Leonardo', 'Asistente', 15000);
INSERT INTO Faculty Values('L004', '08/10/2000', 'Gonzalez', 'Luis Humberto', 'Asociado', 10000);
INSERT INTO Faculty Values('L005', '09/10/2000', 'Quiroga', 'Elda', 'Instructor', 20000);
INSERT INTO Faculty Values('L006', '10/10/2000', 'De la Fuente', 'Mario', 'Titular', 18000);

--INSERCION 3 CLUBES--
INSERT INTO CampusClub Values('100', 'Club1', 'Garza Sada, A1, 101', '88808707', (SELECT ref(f) FROM Faculty f WHERE f.pid='L003'));
INSERT INTO CampusClub Values('101', 'Club2', 'Junco de la Vega, A3, 301', '88801000',  (SELECT ref(f) FROM Faculty f WHERE f.pid='L004'));
INSERT INTO CampusClub Values('102', 'Club3', 'Garcia Roel, A5, 202', '83675859',  (SELECT ref(f) FROM Faculty f WHERE f.pid='L006'));

---c DE STUDENTS EN CLUB---
INSERT INTO Clubs Values('A001', '100');
INSERT INTO Clubs Values('A002', '100');
INSERT INTO Clubs Values('A003', '100');
INSERT INTO Clubs Values('A004', '100');
INSERT INTO Clubs Values('A005', '100');
INSERT INTO Clubs Values('A006', '100');
INSERT INTO Clubs Values('A007', '100');
INSERT INTO Clubs Values('A008', '100');
INSERT INTO Clubs Values('A009', '100');
INSERT INTO Clubs Values('A010', '100');
--10 STUDENTS ON CLUB 100 --
INSERT INTO Clubs Values('A011', '101');
INSERT INTO Clubs Values('A012', '101');
INSERT INTO Clubs Values('A013', '101');
INSERT INTO Clubs Values('A014', '101');
INSERT INTO Clubs Values('A015', '101');
INSERT INTO Clubs Values('A016', '101');
INSERT INTO Clubs Values('A017', '101');
INSERT INTO Clubs Values('A018', '101');
INSERT INTO Clubs Values('A019', '101');
INSERT INTO Clubs Values('A020', '101');
--10 STUDENTS ON CLUB 101 --
INSERT INTO Clubs Values('A021', '102');
INSERT INTO Clubs Values('A022', '102');
INSERT INTO Clubs Values('A023', '102');
INSERT INTO Clubs Values('A024', '102');
INSERT INTO Clubs Values('A025', '102');
INSERT INTO Clubs Values('A026', '102');
INSERT INTO Clubs Values('A027', '102');
INSERT INTO Clubs Values('A028', '102');
INSERT INTO Clubs Values('A001', '102');
INSERT INTO Clubs Values('A002', '102');
INSERT INTO Clubs Values('A003', '102');
INSERT INTO Clubs Values('A004', '102');
INSERT INTO Clubs Values('A011', '102');
INSERT INTO Clubs Values('A012', '102');
INSERT INTO Clubs Values('A013', '102');
--15 STUDENTS ON CLUB 102 --
