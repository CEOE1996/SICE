CREATE DATABASE SICE
GO
USE SICE
GO
CREATE TABLE Alumno (
  Codigo          varchar(50) NOT NULL, 
  Nombre          varchar(255) NOT NULL, 
  ApellidoPaterno varchar(255) NOT NULL, 
  ApellidoMaterno varchar(255) NOT NULL, 
  NIP             varchar(255) NOT NULL, 
  PRIMARY KEY (Codigo));
CREATE TABLE AlumnoCarrera (
  ID                int IDENTITY NOT NULL, 
  Alumno            varchar(50) NOT NULL, 
  Carrera           int NOT NULL, 
  Estatus           int NOT NULL, 
  CalendarioIngreso int NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_AlumnoCarrera 
    UNIQUE (Alumno, Carrera));
CREATE TABLE AlumnoSeccion (
  ID            int IDENTITY NOT NULL, 
  AlumnoCarrera int NOT NULL, 
  Seccion       int NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_AlumnoSeccionCalendario 
    UNIQUE (AlumnoCarrera, Seccion));
CREATE TABLE Aula (
  ID       int IDENTITY NOT NULL, 
  Nombre   varchar(255) NOT NULL, 
  Edificio int NOT NULL, 
  Activo   bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_NombreEdificio 
    UNIQUE (Nombre, Edificio));
CREATE TABLE Calendario (
  ID         int IDENTITY NOT NULL, 
  Calendario varchar(50) NOT NULL UNIQUE, 
  Inicio     datetime NOT NULL, 
  Fin        datetime NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Carrera (
  ID      int IDENTITY NOT NULL, 
  Carrera char(5) NOT NULL UNIQUE, 
  Nombre  varchar(255) NOT NULL, 
  Activo  bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Carrera_Materia (
  CarreraID int NOT NULL, 
  MateriaID int NOT NULL, 
  PRIMARY KEY (CarreraID, 
  MateriaID));
CREATE TABLE Centro (
  ID       int IDENTITY NOT NULL, 
  Nombre   varchar(255) NOT NULL UNIQUE, 
  Acronimo char(5) NOT NULL, 
  Activo   bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Departamento (
  ID           int IDENTITY NOT NULL, 
  Departamento varchar(255) NOT NULL UNIQUE, 
  Division     int NOT NULL, 
  Jefe         varchar(50) NOT NULL, 
  Activo       bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Departamento_Materia (
  DepartamentoID int NOT NULL, 
  MateriaID      int NOT NULL, 
  PRIMARY KEY (DepartamentoID, 
  MateriaID));
CREATE TABLE Division (
  ID       int IDENTITY NOT NULL, 
  Division varchar(255) NOT NULL, 
  Centro   int NOT NULL, 
  Activo   bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_DivisionCentro 
    UNIQUE (Division, Centro));
CREATE TABLE DivisionCarrera (
  DivisionID  int NOT NULL, 
  CarreraID   int NOT NULL, 
  Coordinador varchar(50) NOT NULL, 
  PRIMARY KEY (DivisionID, 
  CarreraID));
CREATE TABLE Edificio (
  ID     int IDENTITY NOT NULL, 
  Nombre varchar(255) NOT NULL, 
  Centro int NOT NULL, 
  Activo bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_NombreCentro 
    UNIQUE (Nombre, Centro));
CREATE TABLE Estatus (
  ID      int IDENTITY(1, 1) NOT NULL, 
  Estatus varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (ID));
CREATE TABLE Horario (
  ID         int IDENTITY NOT NULL, 
  Seccion    int NOT NULL, 
  Dia        int NOT NULL, 
  HoraInicio time NOT NULL, 
  HoraFin    time NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_ 
    UNIQUE (Dia, HoraInicio, Seccion));
CREATE TABLE Materia (
  ID      int IDENTITY NOT NULL, 
  Clave   char(5) NOT NULL UNIQUE, 
  Materia varchar(255) NOT NULL, 
  Activo  bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Profesor (
  Codigo          varchar(50) NOT NULL, 
  Nombre          varchar(255) NOT NULL, 
  ApellidoPaterno varchar(255) NOT NULL, 
  ApellidoMaterno varchar(255) NOT NULL, 
  NIP             varchar(255) NOT NULL, 
  PRIMARY KEY (Codigo));
CREATE TABLE Seccion (
  ID         int IDENTITY NOT NULL, 
  NRC        int NOT NULL, 
  Profesor   varchar(50) NOT NULL, 
  Materia    int NOT NULL, 
  Seccion    char(3) NOT NULL, 
  Aula       int NOT NULL, 
  Calendario int NOT NULL, 
  Activo     bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_MateriaSeccion 
    UNIQUE (Materia, Seccion));
ALTER TABLE DivisionCarrera ADD CONSTRAINT FKDivisionCa532014 FOREIGN KEY (DivisionID) REFERENCES Division (ID);
ALTER TABLE DivisionCarrera ADD CONSTRAINT FKDivisionCa60158 FOREIGN KEY (CarreraID) REFERENCES Carrera (ID);
ALTER TABLE DivisionCarrera ADD CONSTRAINT FKDivisionCa628240 FOREIGN KEY (Coordinador) REFERENCES Profesor (Codigo);
ALTER TABLE Departamento_Materia ADD CONSTRAINT FKDepartamen902517 FOREIGN KEY (DepartamentoID) REFERENCES Departamento (ID);
ALTER TABLE Departamento_Materia ADD CONSTRAINT FKDepartamen48973 FOREIGN KEY (MateriaID) REFERENCES Materia (ID);
ALTER TABLE Carrera_Materia ADD CONSTRAINT FKCarrera_Ma960449 FOREIGN KEY (CarreraID) REFERENCES Carrera (ID);
ALTER TABLE Carrera_Materia ADD CONSTRAINT FKCarrera_Ma494845 FOREIGN KEY (MateriaID) REFERENCES Materia (ID);
ALTER TABLE AlumnoCarrera ADD CONSTRAINT FKAlumnoCarr648903 FOREIGN KEY (Carrera) REFERENCES Carrera (ID);
ALTER TABLE AlumnoCarrera ADD CONSTRAINT FKAlumnoCarr139227 FOREIGN KEY (Alumno) REFERENCES Alumno (Codigo);
ALTER TABLE AlumnoCarrera ADD CONSTRAINT FKAlumnoCarr108201 FOREIGN KEY (CalendarioIngreso) REFERENCES Calendario (ID);
ALTER TABLE AlumnoCarrera ADD CONSTRAINT FKAlumnoCarr56298 FOREIGN KEY (Estatus) REFERENCES Estatus (ID);
ALTER TABLE AlumnoSeccion ADD CONSTRAINT FKAlumnoSecc811311 FOREIGN KEY (AlumnoCarrera) REFERENCES AlumnoCarrera (ID);
ALTER TABLE AlumnoSeccion ADD CONSTRAINT FKAlumnoSecc814646 FOREIGN KEY (Seccion) REFERENCES Seccion (ID);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamen202531 FOREIGN KEY (Division) REFERENCES Division (ID);
ALTER TABLE Departamento ADD CONSTRAINT FKDepartamen612949 FOREIGN KEY (Jefe) REFERENCES Profesor (Codigo);
ALTER TABLE Division ADD CONSTRAINT FKDivision41366 FOREIGN KEY (Centro) REFERENCES Centro (ID);
ALTER TABLE Edificio ADD CONSTRAINT FKEdificio48430 FOREIGN KEY (Centro) REFERENCES Centro (ID);
ALTER TABLE Aula ADD CONSTRAINT FKAula173116 FOREIGN KEY (Edificio) REFERENCES Edificio (ID);
ALTER TABLE Seccion ADD CONSTRAINT FKSeccion625042 FOREIGN KEY (Materia) REFERENCES Materia (ID);
ALTER TABLE Seccion ADD CONSTRAINT FKSeccion295613 FOREIGN KEY (Profesor) REFERENCES Profesor (Codigo);
ALTER TABLE Seccion ADD CONSTRAINT FKSeccion472941 FOREIGN KEY (Aula) REFERENCES Aula (ID);
ALTER TABLE Seccion ADD CONSTRAINT FKSeccion303749 FOREIGN KEY (Calendario) REFERENCES Estatus (ID);
ALTER TABLE Horario ADD CONSTRAINT FKHorario720745 FOREIGN KEY (Seccion) REFERENCES Seccion (ID);
