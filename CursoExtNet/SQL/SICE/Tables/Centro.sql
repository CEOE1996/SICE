CREATE DATABASE CUCEI
GO
USE CUCEI
GO
CREATE TABLE AlumnoCalificacion (
  ID             int IDENTITY NOT NULL, 
  CalificacionID int NOT NULL, 
  AlumnoSeccion  int NOT NULL, 
  Calificacion   decimal(18, 4) NULL, 
  FechaEntrega   datetime NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_CalificacionAlumno 
    UNIQUE (CalificacionID, AlumnoSeccion));
CREATE TABLE AlumnoClase (
  ID            int IDENTITY NOT NULL, 
  AlumnoSeccion int NOT NULL, 
  Clase         int NOT NULL, 
  Asistencia    int NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_AlumnoSeccionClase 
    UNIQUE (AlumnoSeccion, Clase));
CREATE TABLE Asistencias (
  ID          int IDENTITY NOT NULL, 
  Descripcion varchar(255) NOT NULL, 
  Activo      bit DEFAULT 1 NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Calificacion (
  ID           int IDENTITY NOT NULL, 
  Seccion      int NOT NULL, 
  Tipo         int NOT NULL, 
  Descripcion  varchar(255) NOT NULL, 
  [Fecha Alta] datetime NOT NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Clase (
  ID            int IDENTITY NOT NULL, 
  NRC           int NOT NULL, 
  Asistencias   int NOT NULL, 
  FechaRegistro datetime NULL, 
  PRIMARY KEY (ID));
CREATE TABLE Encuadre (
  ID         int IDENTITY NOT NULL, 
  Seccion    int NOT NULL, 
  Tipo       int NOT NULL, 
  Porcentaje int NOT NULL, 
  PRIMARY KEY (ID), 
  CONSTRAINT UQ_SeccionTipo 
    UNIQUE (Seccion, Tipo));
CREATE TABLE TipoCalificacion (
  ID          int IDENTITY NOT NULL, 
  Descripcion varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (ID));
ALTER TABLE AlumnoCalificacion ADD CONSTRAINT FKAlumnoCali746108 FOREIGN KEY (CalificacionID) REFERENCES Calificacion (ID);
ALTER TABLE Calificacion ADD CONSTRAINT FKCalificaci96285 FOREIGN KEY (Tipo) REFERENCES TipoCalificacion (ID);
ALTER TABLE Encuadre ADD CONSTRAINT FKEncuadre320751 FOREIGN KEY (Tipo) REFERENCES TipoCalificacion (ID);
ALTER TABLE AlumnoClase ADD CONSTRAINT FKAlumnoClas214866 FOREIGN KEY (Clase) REFERENCES Clase (ID);
ALTER TABLE AlumnoClase ADD CONSTRAINT FKAlumnoClas617718 FOREIGN KEY (Asistencia) REFERENCES Asistencias (ID);
ALTER TABLE Clase ADD CONSTRAINT FKClase215273 FOREIGN KEY (Asistencias) REFERENCES Asistencias (ID);
