###########################################################
### BASE DE DATOS CENTRO DE SALUD INTEGRAL "INTEGRALIA" ###
###########################################################

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

# Proyecto Integrador - Curso SQL - CoderHouse
#
# Estudiante: Carrizo, Dante Enrique.
#
# Docente: Quezada, Sebastian Andres.
#
# Tutor: Gimenez, Diego
#
# Período: Agosto 2022 - Noviembre 2022

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

###########################################################
###  SCRIPT DE CREACIÓN DE BASE DE DATOS Y SUS TABLAS   ###
###########################################################

##########################################
###    CREACIÓN DE LA BASE DE DATOS    ###
##########################################

-- CREACIÓN DE LA BASE DE DATOS DE PROYECTO DE CENTRO INTEGRAL DE SALUD.
DROP SCHEMA IF EXISTS ProyectoIntegralia;
CREATE SCHEMA IF NOT EXISTS ProyectoIntegralia;
USE ProyectoIntegralia;

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

####################################
###      CREACIÓN DE TABLAS      ###
####################################

-- CREACIÓN DE TABLA "PACIENTES".
CREATE TABLE IF NOT EXISTS pacientes(
	id_paciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_sexo INT NOT NULL,
    id_plan_obra_social INT NOT NULL,
    p_nombre VARCHAR(45) NOT NULL,
    p_apellido VARCHAR(60) NOT NULL,
    p_fec_nac DATE NOT NULL,
    p_documento VARCHAR(20),
    p_domicilio VARCHAR(100)
);

-- CREACIÓN DE TABLA "TELÉFONOS PACIENTES".
CREATE TABLE IF NOT EXISTS telefonosPacientes(
	id_telefono INT NOT NULL,
    id_paciente INT NOT NULL,
    numero VARCHAR(45) NOT NULL
);

-- CREACIÓN DE TABLA "TIPO DE TELÉFONO".
CREATE TABLE IF NOT EXISTS tipoDeTelefono(
	id_telefono INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45) NOT NULL
);

-- CREACIÓN DE TABLA "TELÉFONOS PROFESIONALES".
CREATE TABLE IF NOT EXISTS telefonosProfesionales(
	id_telefono INT NOT NULL,
    id_profesional INT NOT NULL,
    numero VARCHAR(45) NOT NULL
);

-- CREACIÓN DE TABLA "TURNOS".
CREATE TABLE IF NOT EXISTS turnos(
	id_turno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha_turno DATETIME NOT NULL,
    fecha_solicitud DATETIME NOT NULL
);

-- ADICIÓN DE COLUMNA "ID_CONSULTORIO" A TABLA "TURNOS"
ALTER TABLE turnos
ADD COLUMN id_consultorio INT NOT NULL AFTER id_profesional;


-- CREACIÓN DE TABLA "SEXO".
CREATE TABLE IF NOT EXISTS sexo(
	id_sexo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    s_nombre VARCHAR(10) NOT NULL
);

-- CREACIÓN DE TABLA "PLAN OBRA SOCIAL".
CREATE TABLE IF NOT EXISTS planObraSocial(
	id_plan_obra_social INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_obra_social INT NOT NULL,
    plan VARCHAR(60) NOT NULL
);


-- CREACIÓN DE TABLA "OBRAS SOCIALES".
CREATE TABLE IF NOT EXISTS obras_Sociales(
	id_obra_social INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    os_razon_social VARCHAR(60) NOT NULL,
    os_cuit VARCHAR(100) NOT NULL,
    os_direccion VARCHAR(100) NOT NULL
);

-- CREACIÓN DE TABLA "PROFESIONALES_PLAN_OS".
CREATE TABLE IF NOT EXISTS profesionales_plan_OS(
	id_plan_obra_social INT NOT NULL,
    id_profesional INT NOT NULL
);

-- CREACIÓN DE TABLA "ESPECIALIDADES".
CREATE TABLE IF NOT EXISTS especialidades(
	id_especialidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    esp_nombre VARCHAR(50) NOT NULL,
    esp_valor_consulta NUMERIC(7,2) NOT NULL
);

-- CREACIÓN DE TABLA "PROFESIONALES".
CREATE TABLE IF NOT EXISTS profesionales(
	id_profesional INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_sexo INT NOT NULL,
    id_especialidad INT NOT NULL,
    pr_nombre VARCHAR(45) NOT NULL,
    pr_apellido VARCHAR(60) NOT NULL,
    pr_fec_nac DATE NOT NULL,
    pr_domicilio VARCHAR(100) NOT NULL,
    pr_matricula VARCHAR(10) NOT NULL
);

-- CREACIÓN DE TABLA "HISTORIAS CLINICAS"
CREATE TABLE IF NOT EXISTS historias_clinicas(
	id_historiaClinica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_profesional INT NOT NULL,
    id_especialidad INT NOT NULL,
    ultima_actualizacion DATE NOT NULL,
    observaciones VARCHAR(255) NOT NULL
);

-- CREACIÓN DE TABLA "DÍAS DE ATENCIÓN".
CREATE TABLE IF NOT EXISTS diasDeAtencion(
	id_dia_atencion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_profesional INT NOT NULL,
    id_turno_atencion INT NOT NULL,
    id_consultorio INT NOT NULL,
    dias VARCHAR(20) NOT NULL
);

-- CREACIÓN DE TABLA "TURNOS DE ATENCIÓN".
CREATE TABLE IF NOT EXISTS turnosDeAtencion(
	id_turno_atencion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    turno VARCHAR(10) NOT NULL
 );
 
 -- CREACIÓN DE TABLA "CONSULTORIOS".
 CREATE TABLE IF NOT EXISTS consultorios(
	id_consultorio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    numero TINYINT NOT NULL,
    ubicacion VARCHAR(20) NOT NULL
 );
 
# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

#####################################################
###   INSERCIÓN DE DATOS EN LAS DISTINTAS TABLAS  ### 
#####################################################

-- INSERCIÓN EN TABLA "PACIENTES".
INSERT INTO pacientes VALUES
(NULL,1,1,"Maria Estefania","Carballo","1987/02/21","32987412","24 de septiembre 177"),
(NULL,1,2,"Juelita Ines","Bobadilla","1982/08/05","28784121","27 de abril 999"),
(NULL,2,3,"Tomas Andres","Juncos","1992/04/14","36001210","Av. Patria 333"),
(NULL,1,2,"Maria Angeles","Rodriguez","1985/06/11","30145687","Santo Tomas 1922"),
(NULL,2,2,"Jorge Luis","Enriquez","1980/11/28","26121444","Av. Los Granaderos 391"),
(NULL,2,3,"Miguel Sebastian","Munioz","1991/03/09","36021034","Los Robles 555"),
(NULL,2,1,"Roque Gabriel","Perucci","1989/05/12","34310654","Tilcara 887"),
(NULL,1,2,"Paula Florencia","Vanucci","1990/02/19","35023123","Santa Isabel 920"),
(NULL,2,1,"Damian Eduardo","Dominguez","1994/09/21","38314785","Alvear 1234"),
(NULL,1,3,"Iris Jazmin","Rucciardi","1992/10/09","37365289","Obispo Trejo 234"),
(NULL,1,3, "Iris Jazmin", "Rucciardi", "1992/10/09", "36001210", "Obispo Trejo 234"),
(NULL,1,4, "Julieta Andrea", "Llanos", "1990/03/28", "34992654", "Av. Patria 221"),
(NULL,1,6, "Mariana Agustina", "Trello", "1986/01/16", "31254789", "Roma 1234"),
(NULL,2,34, "Facundo Gabriel", "Garcia", "1983/05/24", "29735245", "General Paz 965"),
(NULL,2,47, "Tomas Fernando", "Murua", "1988/11/18", "33125540", "9 de Julio 113"),
(NULL,1,11, "Fernanda Martina", "Romero", "1996/08/03", "40225874", "San Juan 1130"),
(NULL,2,34, "Augusto Sebastian", "Vilches", "1990/12/12", "35996213", "Ongagasta 443"),
(NULL,1,47, "Milena Martina", "Arcuato", "2001/06/22", "45120321", "Laprida 546");

-- INSERCIÓN EN TABLA "PROFESIONALES".
INSERT INTO profesionales VALUES
(NULL,2,1,"Gaston Fernando","Cuevas","1985/04/12","Tucuman 1234","31827"),
(NULL,1,2,"Maria Angeles","Echevarria","1986/07/03","San Juan 345","33829"),
(NULL,1,3, "Andres Sebastian", "Figueroa", "1990/02/18", "Santo Domingo 333", "19950"),
(NULL,2,4,"Jose Martin","Dominguez","1982/05/23","La Rioja 991","30789"),
(NULL,2,5,"Ricardo Nicolas","Fontana","1981/08/30","Santa Fe 786","29919"),
(NULL,1,6,"Angelica Isabella","Soler","1985/11/15","Rio Negro 445","31333"),
(NULL,2,7,"Dario Sebastian","Duarte","1983/01/18","Neuquen 777","32445"),
(NULL,1,8,"Martina Andrea","Molinari","1987/06/09","Jujuy 1540","35678");

-- INSERCIÓN EN TABLA "TURNOS".
INSERT INTO turnos VALUES
(NULL,1,5,1,"2022/12/09 9:20:00","2022/11/17 13:17:05"),
(NULL,2,2,2,"2022/12/12 14:00:00","2022/11/18 11:23:46"),
(NULL,3,1,3,"2022/12/08 10:20:00","2022/11/16 09:37:11"),
(NULL,1,7,3,"2022/12/09 15:40:00","2022/11/19 16:11:31"),
(NULL,2,5,1,"2022/12/09 9:40:00","2022/11/17 17:27:00"),
(NULL,3,7,3,"2022/12/12 15:00:00","2022/11/18 10:27:53"),
(NULL,4,3,1,"2022/12/13 16:20:00","2022/11/22 09:49:20"),
(NULL,5,4,2,"2022/12/13 16:00:00","2022/11/23 13:23:23"),
(NULL,6,1,3,"2022/12/08 10:40:00","2022/11/22 15:33:09"),
(NULL,7,7,3,"2022/12/09 16:00:00","2022/11/17 16:32:21"),
(NULL,8,3,1,"2022/12/13 16:40:00","2022/11/21 10:12:32"),
(NULL,9,2,2,"2022/12/12 14:40:00","2022/11/22 12:38:39"),
(NULL,10,5,1,"2022/12/12 10:00:00","2022/11/21 12:23:11"),
(NULL,2,6,2,"2022/12/15 10:40:00","2022/11/25 13:17:45"),
(NULL,13,4,2,"2023/01/03 15:00:00","2022/12/15 11:05:34"),
(NULL,14,6,2,"2023/01/06 10:40:00","2022/12/19 13:23:21"),
(NULL,15,2,2,"2023/01/04 15:20:00","2022/12/16 16:42:10"),
(NULL,16,3,1,"2023/01/03 11:00:00","2022/12/20 10:13:27"),
(NULL,17,1,3,"2023/01/03 10:20:00","2022/12/20 14:39:58");

-- INSERCIÓN EN TABLA "OBRAS_SOCIALES".
INSERT INTO obras_sociales VALUES
(NULL,"PARTICULAR", "No corresponde", "No corresponde"),
(NULL,"OSDE","30-54674125-3","Av. Leandro N. Alem 1067"),
(NULL,"MEDIFE","30-68273765-0","Lima 87"),
(NULL,"SANCOR SALUD","30-59035479-8","25 de mayo 201"),
(NULL,"FEDERADA SALUD","30-54159260-8","Moreno 1222"),
(NULL,"GALENO","30-52242816-3","Dellepiane Elvira Rawson 150"),
(NULL,"MEDICUS","30-54677131-4","Larrea 877"),
(NULL,"OMINT","30-55024530-9","Carlos Pellegrini 1363"),
(NULL,"APROSS","30-99925367-5","Marcelo T. de Alvear 758"),
(NULL,"PAMI","30-52276392-2","Aristobulo del Valle 155"),
(NULL,"OSECAC","30-55027355-8","Moreno 648");

-- INSERCIÓN EN TABLA "PLAN OBRA SOCIAL".
INSERT INTO planObraSocial VALUES
(NULL,1, "Particular"),
(NULL,2,"210"),
(NULL,2,"310"),
(NULL,2,"410"),
(NULL,2,"450"),
(NULL,2,"510"),
(NULL,3,"Medifé +"),
(NULL,3,"Bronce classic"),
(NULL,3,"Bronce"),
(NULL,3,"Plata classic"),
(NULL,3,"Plata"),
(NULL,3,"Oro"),
(NULL,3,"Platinum"),
(NULL,4,"700A"),
(NULL,4,"800V"),
(NULL,4,"1000"),
(NULL,4,"1500"),
(NULL,4,"3000"),
(NULL,4,"3500"),
(NULL,4,"4000"),
(NULL,4,"4500"),
(NULL,4,"5000 Exclusive"),
(NULL,4,"6000 Exclusive"),
(NULL,5,"Familia"),
(NULL,5,"Jóven"),
(NULL,5,"1000+"),
(NULL,5,"1000"),
(NULL,5,"2000"),
(NULL,5,"3000"),
(NULL,5,"4000"),
(NULL,6,"220"),
(NULL,6,"330"),
(NULL,6,"440"),
(NULL,6,"550"),
(NULL,6,"18-25"),
(NULL,7,"Azul"),
(NULL,7,"Celeste"),
(NULL,7,"Family"),
(NULL,7,"Family flex"),
(NULL,7,"Integra 2"),
(NULL,7,"Integra2 flex"),
(NULL,7,"Conecta"),
(NULL,7,"Mujer"),
(NULL,7,"Jóven"),
(NULL,8,"Premium"),
(NULL,8,"Clásico"),
(NULL,8,"Global"),
(NULL,8,"Genesis"),
(NULL,8,"Midoc"),
(NULL,9,"Base"),
(NULL,10,"Base"),
(NULL,11,"Base");

-- INSERCIÓN EN TABLA "PROFESIONALES_PLAN_OS".
INSERT INTO profesionales_plan_OS VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(2,1),
(2,2),
(2,3),
(2,4),
(3,5),
(3,6),
(3,7),
(4,1),
(4,2),
(4,3),
(4,4),
(5,5),
(5,6),
(5,7),
(6,1),
(6,2),
(6,3),
(6,4),
(7,5),
(7,6),
(7,7),
(10,1),
(10,2),
(10,3),
(10,2),
(11,4),
(11,5),
(11,6),
(11,7),
(13,1),
(13,2),
(13,3),
(13,4),
(31,1),
(31,5),
(31,6),
(31,7),
(32,3),
(32,4),
(32,5),
(34,1),
(34,2),
(34,3),
(34,4),
(34,5),
(34,6),
(34,7),
(47,1),
(47,2),
(47,3),
(47,4),
(47,5),
(47,6),
(47,7),
(50,1),
(50,2),
(50,3),
(50,4),
(51,1),
(51,6),
(51,7),
(52,1),
(52,2),
(52,5),
(52,7);

-- INSERCIÓN EN TABLA "SEXO".
INSERT INTO sexo VALUES
(1, "Mujer"),
(2, "Varón");

-- INSERCIÓN EN TABLA "TIPO DE TELEFONO".
INSERT INTO tipoDeTelefono VALUES
(NULL, "Casa"),
(NULL, "Movil"),
(NULL, "Trabajo");

-- INSERCIÓN EN TABLA "TELEFONOS PACIENTES".
INSERT INTO telefonosPacientes VALUES
(2, 1, "+54-3513987456"),
(2, 2, "+54-3513528412"),
(2, 3, "+54-3516447859"),
(1, 4, "+54-3514257896"),
(2, 4, "+54-3516744787"),
(2, 5, "+54-3513555123"),
(1, 6, "+54-3514725545"),
(2, 6, "+54-3513335855"),
(2, 7, "+54-3512989963"),
(1, 8, "+54-3514759901"),
(2, 8, "+54-3512123357"),
(2, 9, "+54-3516991334"),
(1, 10, "+54-3514722150"),
(2, 10, "+54-3513022012");

-- INSERCIÓN EN TABLA "TELEFONOS PROFESIONALES".
INSERT INTO telefonosProfesionales VALUES
(3, 1, "+54-3514253265"),
(2, 2, "+54-3513142536"),
(3, 2, "+54-3514253265"),
(3, 3, "+54-3514253265"),
(2, 4, "+54-3516005021"),
(3, 4, "+54-3514253265"),
(3, 5, "+54-3514253265"),
(2, 6, "+54-3512663559"),
(3, 6, "+54-3514253265"),
(2, 7, "+54-3512001354"),
(2, 8, "+54-3514289209");

-- INSERCIÓN EN TABLA "ESPECIALIDADES".
INSERT INTO especialidades VALUES
(NULL, "Medicina General", 3500),
(NULL, "Kinesiología y Fisioterapia", 3700),
(NULL, "Educación Física", 3500),
(NULL, "Traumatología", 3500),
(NULL, "Quiropraxia", 3500),
(NULL, "Nutrición", 3500),
(NULL, "Endocrinología", 3800),
(NULL, "Psicología", 3800);

-- INSERCIÓN EN TABLA "HISTORIAS CLINICAS".
INSERT INTO historias_clinicas VALUES
(NULL,1,1,1,"2022-10-11","Dx: Sobrepeso y dislipemia. Objetivo descenso de peso y mejorar perfil lipidico. Se sugiere consulta nutricional."),
(NULL,2,5,5,"2022-10-05","Dx: Persona con peso normal. Objetivo de ganancia de masa muscular. Se plantea plan nutricional ligeramente hiperproteico y aumentar el trabajo de fuerza."),
(NULL,3,1,1,"2022-09-22","Dx: Paciente con post quirurgico de LCA izquierda. Se sugiere consulta con Kinesiologia."),
(NULL,5,1,1,"2022-10-13","Dx: Paciente con peso normal. Objetivo empezar a moverse. Se sugiere consulta con Kinesiologia."),
(NULL,6,5,5,"2022-10-13","Dx: Persona con bajo peso. Manifiesta deseo de aumento de peso y masa muscular. Se plantea plan nutricional hipercalorico e hiperproteico."),
(NULL,4,6,6,"2022-09-23","Dx: Paciente con sobrepeso y resistencia a insulina. Dx de posible hipotiroidismo. Se sugiere consulta nutricional."),
(NULL,7,7,7,"2022-09-23","Dx: Persona con Dx de ansiedad y posible TCA. Se plantea trabajo conductivo-conductual. Se sugiere consulta nutricional."),
(NULL,1,2,2,"2022-10-13","Dx: Persona con sobrepeso. Manifiesta dolor de rodillas. Se plantea trabajo de fuerza y estabilidad en MM.II."),
(NULL,2,7,7,"2022-10-19","Dx: La perpsona manifiesta episodios de ansiedad, consulta por aparente cuadro de burnout."),
(NULL,10,1,1,"2022-10-18","Dx: Paciente con dbt1, insulinodependiente. Objetivo: mas actividad fisica con ganancia de fuerza. Sugiero consulta con endocrinologia, nutricion y kinesiologia."),
(NULL,9,4,4,"2022-10-20","Dx: Paciente con marcada escoliosis derecha. Se sugiere trabajo correctivo postural, consulta con kinesiologia."),
(NULL,8,3,3,"2022-10-18","Dx: Paciente con post-quirurgico de quebradura de tibial anterior derecha. Se sugiere resposo 1 mes."),
(NULL,3,2,2,"2022-10-25","Dx: Persona con post quirurgico de LCA izquierda. Se plantea trabajo de rehabilitacion MM.II."),
(NULL,5,2,2,"2022-10-20","Dx: Persona eutrofico. Manifiesta deseo de aumentar actividad fisica. Sugiero plan de entrenamiento funcional.");

-- INSERCIÓN EN TABLA "CONSULTORIOS".
INSERT INTO consultorios VALUES
(NULL, 1, "Planta baja"),
(NULL, 2, "1er piso A"),
(NULL, 3, "1er piso B"),
(NULL, 4, "Gimnasio");

-- INSERCIÓN EN TABLA "TURNOS DE ATENCION".
INSERT INTO TurnosDeAtencion VALUES
(NULL, "Mañana"),
(NULL, "Tarde"),
(NULL, "Noche");

-- INSERCIÓN EN TABLA "DIAS DE ATENCION".
INSERT INTO DiasDeAtencion VALUES
(NULL, 1, 1, 3, "Mar y Jue"),
(NULL, 2, 2, 2, "Lun y Mie"),
(NULL, 3, 2, 1, "Lun a Vie"),
(NULL, 4, 2, 1, "Mar y Jue"),
(NULL, 5, 2, 2, "Mar y Jue"),
(NULL, 6, 1, 1, "Lun y Mie"),
(NULL, 7, 2, 2, "Lun y Vie"),
(NULL, 8, 2, 3, "Mie y Vie");
 
# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------
 
 ############################################################
 ###  DEFINIENDO RELACIONES ENTRE TABLAS: CONSTRAINTS FK  ###
 ############################################################
 
 -- TABLA "PACIENTES".
 ALTER TABLE pacientes
 ADD CONSTRAINT FOREIGN KEY(id_sexo)
 REFERENCES sexo(id_sexo)
 ON UPDATE CASCADE ON DELETE CASCADE;
 
 ALTER TABLE pacientes
 ADD CONSTRAINT FOREIGN KEY(id_plan_obra_social)
 REFERENCES planObraSocial(id_plan_obra_social)
 ON UPDATE CASCADE ON DELETE CASCADE;
 
 
 -- TABLA "TELEFONOS PACIENTES"
ALTER TABLE telefonosPacientes
ADD CONSTRAINT FOREIGN KEY(id_telefono)
REFERENCES tipoDeTelefono(id_telefono);

ALTER TABLE telefonosPacientes
ADD CONSTRAINT FOREIGN KEY(id_paciente)
REFERENCES pacientes(id_paciente)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "TELEFONOS PROFESIONALES"
ALTER TABLE telefonosProfesionales
ADD CONSTRAINT FOREIGN KEY(id_telefono)
REFERENCES tipoDeTelefono(id_telefono);

ALTER TABLE telefonosProfesionales
ADD CONSTRAINT FOREIGN KEY(id_profesional)
REFERENCES profesionales(id_profesional)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "PLAN OBRA SOCIAL"
ALTER TABLE planObraSocial
ADD CONSTRAINT FOREIGN KEY(id_obra_social)
REFERENCES obras_sociales(id_obra_social)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "PROFESIONALES_PLAN_OS"
ALTER TABLE profesionales_plan_OS
ADD CONSTRAINT FOREIGN KEY(id_plan_obra_social)
REFERENCES planObraSocial(id_plan_obra_social)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE profesionales_plan_OS
ADD CONSTRAINT FOREIGN KEY(id_profesional)
REFERENCES profesionales(id_profesional)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "TURNOS"
ALTER TABLE turnos
ADD CONSTRAINT FOREIGN KEY(id_paciente)
REFERENCES pacientes(id_paciente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE turnos
ADD CONSTRAINT FOREIGN KEY(id_profesional)
REFERENCES profesionales(id_profesional)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE turnos
ADD CONSTRAINT FOREIGN KEY(id_consultorio)
REFERENCES consultorios(id_consultorio)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "PROFESIONALES"
ALTER TABLE profesionales
ADD CONSTRAINT FOREIGN KEY(id_sexo)
REFERENCES sexo(id_sexo)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE profesionales
ADD CONSTRAINT FOREIGN KEY(id_especialidad)
REFERENCES especialidades(id_especialidad)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "HISTORIAS CLINICAS"
ALTER TABLE historias_clinicas
ADD CONSTRAINT FOREIGN KEY(id_paciente)
REFERENCES pacientes(id_paciente)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE historias_clinicas
ADD CONSTRAINT FOREIGN KEY(id_profesional)
REFERENCES profesionales(id_profesional)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE historias_clinicas
ADD CONSTRAINT FOREIGN KEY(id_especialidad)
REFERENCES especialidades(id_especialidad)
ON UPDATE CASCADE ON DELETE CASCADE;


-- TABLA "DIAS DE ATENCION"
ALTER TABLE diasDeAtencion
ADD CONSTRAINT FOREIGN KEY(id_profesional)
REFERENCES profesionales(id_profesional)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE diasDeAtencion
ADD CONSTRAINT FOREIGN KEY(id_turno_atencion)
REFERENCES turnosDeAtencion(id_turno_atencion)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE diasDeAtencion
ADD CONSTRAINT FOREIGN KEY(id_consultorio)
REFERENCES consultorios(id_consultorio)
ON UPDATE CASCADE ON DELETE CASCADE;

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

#####################################
###  CREACIÓN DE OBJETOS: VISTAS  ###
#####################################

-- VISTA "ATENCION_PROFESIONALES" - MUESTRA UNA TABLA CON LOS DÍAS Y HORARIOS DE ATENCIÓN DE CADA PROFESIONAL.
CREATE OR REPLACE VIEW view_atencion_profesionales AS
SELECT CONCAT(pr_nombre, " ", pr_apellido) Profesional,
		pr_matricula MP, esp_nombre Especialidad, 
        dias "Dias de Atencion", 
        turno Turno
FROM profesionales pr
INNER JOIN especialidades e
ON pr.id_especialidad = e.id_especialidad
INNER JOIN diasDeAtencion da
ON pr.id_profesional = da.id_profesional
INNER JOIN turnosDeAtencion ta
ON da.id_turno_atencion = ta.id_turno_atencion;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_ATENCION_PROFESIONALES"
# SELECT * FROM view_atención_profesionales;

# ................................................................................................................................

-- VISTA "PACIENTE_X_PROFESIONAL" - MUESTRA UNA TABLA CON LOS PACIENTES POR PROFESIONAL.
CREATE OR REPLACE VIEW view_paciente_x_profesional AS
SELECT CONCAT(pr_nombre, " ", pr_apellido) Profesional, 
		esp_nombre Especialidad, 
        COUNT(DISTINCT(id_paciente)) "Total de Pacientes" 
FROM turnos t 
INNER JOIN profesionales pr
ON t.id_profesional = pr.id_profesional
INNER JOIN especialidades e
ON pr.id_especialidad = e.id_especialidad
GROUP BY profesional;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_PACIENTE_X_PROFESIONAL"
# SELECT * FROM view_paciente_x_profesional;

# ................................................................................................................................

-- VISTA "DATOS_TURNOS" - MUESTRA UNA TABLA CON LOS TURNOS PARA CADA PACIENTE SEGÚN ESPECIALIDAD, Y EL PROFESIONAL QUE LOS ATENDERÁ.
CREATE OR REPLACE VIEW view_datos_turnos AS
SELECT CONCAT(p_nombre, " ", p_apellido) Paciente, 
		p_documento DNI, fecha_turno Turno, 
        CONCAT(pr_nombre, " ", pr_apellido) Profesional, 
        esp_nombre Especialidad
FROM pacientes p
INNER JOIN turnos t
ON p.id_paciente = t.id_paciente
INNER JOIN profesionales pr
ON t.id_profesional = pr.id_profesional
INNER JOIN especialidades e
ON pr.id_especialidad = e.id_especialidad;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_DATOS_TURNOS"
# SELECT * FROM view_datos_turnos;

# ................................................................................................................................

-- VISTA "PLANES_x_PROFESIONAL" - MUESTRA UNA TABLA CON LOS PLANES DE OBRAS SOCIALES QUE ATIENDEN LOS PROFESIONALES.
CREATE OR REPLACE VIEW view_planes_x_profesional AS
SELECT pos.id_plan_obra_social ID, plan Plan, os_razon_social "Obra Social", CONCAT(pr_nombre, " ", pr_apellido) Profesional
FROM obras_Sociales os
INNER JOIN planObraSocial pos
ON os.id_obra_social = pos.id_obra_social 
INNER JOIN profesionales_plan_os pros
ON pos.id_plan_obra_social = pros.id_plan_obra_social
INNER JOIN profesionales pr
ON pros.id_profesional = pr.id_profesional;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_PLANES_X_PROFESIONAL"
# SELECT * FROM view_planes_x_profesional;

# ................................................................................................................................

-- VISTA "PLANES_x_PACIENTE" - MUESTRA UNA TABLA CON LOS PLANES DE OBRAS SOCIALES DE LOS PACIENTES.
CREATE OR REPLACE VIEW view_planes_x_paciente AS
SELECT plan Plan, os_razon_social "Obra Social", CONCAT(p_nombre, " ", p_apellido) Paciente
FROM pacientes p
INNER JOIN planObraSocial pos
ON p.id_plan_obra_social = pos.id_plan_obra_social 
INNER JOIN obras_sociales os
ON pos.id_obra_social = os.id_obra_social;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_PLANES_X_PACIENTE"
# SELECT * FROM view_planes_x_paciente;

# ................................................................................................................................

-- VISTA "HISTORIAS_CLINICAS_x_Paciente" - MUESTRA UNA TABLA CON LAS HISTORIAS CLÍNICAS ORDENADAS POR PACIENTES.
CREATE OR REPLACE VIEW view_historias_clinicas AS
SELECT 
	id_historiaClinica "Historia Clinica", 
    CONCAT(p_nombre, " ", p_apellido) Paciente, 
    CONCAT(pr_nombre, " ", pr_apellido) Profesional,
    esp_nombre Especialidad,
    ultima_actualizacion Modificacion,
    observaciones Observaciones
FROM historias_clinicas hc
INNER JOIN pacientes p
ON hc.id_paciente = p.id_paciente
INNER JOIN profesionales pr
ON hc.id_profesional = pr.id_profesional
INNER JOIN especialidades es
ON hc.id_especialidad = es.id_especialidad
ORDER BY Paciente ASC;

-- CHEQUEAMOS LA TABLA VISTA "VIEW_HISTORIAS_CLINICAS"
# SELECT * FROM view_historias_clinicas;

# --------------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------------

###################################################################
###  CREACIÓN DE OBJETOS: FUNCIONES PERSONALIZADAS/ALMACENADAS  ###
###################################################################

-- CREACIÓN DE FUNCIÓN "TURNOS PACIENTE X ESPECIALIDAD" - DEVUELVE EL TURNO PARA UNA DETERMINADA ESPECIALIDAD DE UN PACIENTE.
DELIMITER //
CREATE FUNCTION `turnos_paciente_x_especialidad`(id INT, documento VARCHAR(20), esp VARCHAR(30)) 
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE turnos_paciente VARCHAR(100);
	SET turnos_paciente = (
		SELECT fecha_turno Turno
		FROM pacientes p
		INNER JOIN turnos t
		ON p.id_paciente = t.id_paciente
		INNER JOIN profesionales pr
		ON t.id_profesional = pr.id_profesional
		INNER JOIN especialidades es
		ON pr.id_especialidad = es.id_especialidad
		WHERE p.id_paciente = id AND p.p_documento = documento AND esp_nombre = esp
	);
    IF turnos_paciente IS NOT NULL THEN
		RETURN turnos_paciente;
	ELSE
		RETURN CONCAT("No posee turno para la especialidad: ", esp);
	END IF;
END
// DELIMITER ;

-- CONSULTA DE TURNOS DE PACIENTE SEGÚN ESPECIALIDAD
/**
SELECT CONCAT(p_nombre, " ",p_apellido) Paciente, p_documento Documento,
		turnos_paciente_x_especialidad(id_paciente,p_documento,"Kinesiología y Fisioterápia") Turnos
FROM pacientes
ORDER BY p_apellido, turnos_paciente_x_especialidad(id_paciente,p_documento,"Kinesiología y Fisioterápia") ASC;
**/

# ................................................................................................................................

-- CREACIÓN DE FUNCIÓN "GET TURNOS" - DEVUELVE LA FECHA DE UN TURNO RECIBIENDO SU ID COMO PARÁMETRO.
DELIMITER //
CREATE FUNCTION `get_turnos` (id INT)
RETURNS DATETIME
READS SQL DATA
BEGIN
	DECLARE consulta_turno DATETIME;
    SET consulta_turno = (
		SELECT fecha_turno Turno
        FROM turnos t
        WHERE t.id_turno = id
    );
    RETURN consulta_turno;
END
// DELIMITER ;

-- CONSULTA DE TURNOS DE PACIENTE
/**
SELECT CONCAT(p_nombre, " ",p_apellido) Paciente,
		get_turnos(id_turno) Turno
FROM pacientes p
INNER JOIN turnos t
ON p.id_paciente = t.id_paciente
ORDER BY p_apellido, get_turnos(id_turno);
**/

# ................................................................................................................................

-- CREACIÓN DE FUNCIÓN "GET ESPECIALIDAD" - DEVUELVE COMO RESULTADO LA ESPECIALIDAD DE UN PROFESIONAL RECIBIENDO SU ID COMO PARÁMETRO.
DELIMITER //
CREATE FUNCTION `get_especialidad`(id INT)
RETURNS VARCHAR(30)
READS SQL DATA
BEGIN
	DECLARE esp VARCHAR(30);
    SET esp = (
		SELECT esp_nombre FROM especialidades WHERE id_especialidad = id
    );
    RETURN esp;
END
// DELIMITER ;

-- CONSULTA DE TURNOS DE PROFESIONALES COMBINANDO `get_turnos` + `get_especialidad`
/**
SELECT CONCAT(pr_nombre, " ", pr_apellido) Profesional,
		get_especialidad(id_especialidad) Especialidad,
		get_turnos(id_turno) Turno
FROM profesionales pr
INNER JOIN turnos t
ON pr.id_profesional = t.id_profesional
ORDER BY pr_apellido, get_especialidad(id_especialidad),get_turnos(id_turno);
**/

# ................................................................................................................................

-- CREACIÓN DE FUNCIÓN "GET CANTIDAD PACIENTES" - DEVUELVE EL NÚMERO DE PACIENTES POR PROFESIONAL.
DELIMITER //
CREATE FUNCTION `get_cantidad_pacientes`(nombre VARCHAR(50), apellido VARCHAR(60), matricula INT) 
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE total_pacientes INT;
    SET total_pacientes = (
		SELECT COUNT(DISTINCT(p.id_paciente))
        FROM pacientes p
        INNER JOIN turnos t
        ON p.id_paciente = t.id_paciente
        INNER JOIN profesionales pr
        ON t.id_profesional = pr.id_profesional
        WHERE pr_nombre = nombre AND pr_apellido = apellido AND pr_matricula = matricula
    );
    RETURN total_pacientes;
END
// DELIMITER ;

-- CONSULTA CANTIDAD DE PACIENTES POR PROFESIONAL COMBINANDO `GET_CANTIDAD_PACIENTES` + `GET_ESPECIALIDAD`
/**
SELECT CONCAT(pr_nombre, " ", pr_apellido) Profesional,
		get_especialidad(id_especialidad) Especialidad,
        get_cantidad_pacientes(pr_nombre, pr_apellido, pr_matricula) "Cantidad de pacientes"
FROM profesionales;
**/

# ................................................................................................................................

-- CREACIÓN DE FUNCIÓN "DIAS_DESDE_SOLICITUD" - DEVUELVE EL NÚMERO EN DÍAS DESDE LA SOLICITUD DEL TURNO HASTA LA FECHA DEL MISMO.
DELIMITER //
CREATE FUNCTION `dias_desde_solicitud`(idPaciente INT, idProfesional INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE diferencia INT;
    SET diferencia = (
		SELECT DATEDIFF(fecha_turno, fecha_solicitud) 
        FROM turnos
        WHERE id_paciente = idPaciente AND id_profesional = idProfesional
    );
    RETURN diferencia;
END
// DELIMITER ;

-- CONSULTA DIFERENCIA DE DIAS ENTRE FECHA DE SOLICITUD DEL TURNO Y FECHA DEL TURNO DE ATENCIÓN, POR PACIENTE, SEGÚN ESPECIALIDAD.
/**
SELECT CONCAT(p_nombre, " ", p_apellido) Paciente,
		dias_desde_solicitud(p.id_paciente, pr.id_profesional) Dias,
        get_especialidad(id_especialidad) Especialidad
FROM pacientes p
INNER JOIN turnos t
ON p.id_paciente = t.id_paciente
INNER JOIN profesionales pr
ON t.id_profesional = pr.id_profesional
ORDER BY p_apellido, get_especialidad(id_especialidad) ASC;
**/

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

################################################
###  CREACIÓN DE OBJETOS: STORED PROCEDURES  ###
################################################

-- STORED PROCEDURE "orderTable" - Permite ordenar una tabla en función de un campo dado.
-- Recibe 3 parámetros: 
-- 1. Tabla que se desea ordenar, 
-- 2. Campo que se utilizará de referencia para el ordenamiento, 
-- 3- Sentido de ordenamiento(ASC o DESC).

DELIMITER //
CREATE PROCEDURE `orderTable`(IN tabla VARCHAR(50), IN campo VARCHAR(60), IN sentido VARCHAR(20))
BEGIN
	CASE
		WHEN tabla OR campo = "" THEN
			SIGNAL SQLSTATE "45000"
			SET MESSAGE_TEXT = "ORDENAMIENTO FALLIDO: Faltan datos por ingresar.";
		WHEN campo <> "" AND sentido <> "" THEN
			SET @ordenar = CONCAT("ORDER BY ", campo," ", sentido);
		WHEN campo <> "" AND sentido = "" THEN
			SET @ordenar = CONCAT("ORDER BY ", campo, " ", "ASC");
		ELSE
			SET @ordenar = " ";
	END CASE;
    SET @clausula = CONCAT("SELECT * FROM ", tabla, " ", @ordenar);
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    DEALLOCATE PREPARE ejecutarSQL;
END
// DELIMITER ;

-- LLAMANDO A SP `orderTable` correctamente.
#CALL orderTable("pacientes", "p_fec_nac", "DESC");

-- LLAMANDO A SP `orderTable` con error.
#CALL orderTable("pacientes","","");

# ................................................................................................................................

-- STORED PROCEDURE "insertPatients" - Inserta un nuevo registro de paciente. 
-- Recibe 7 parámetros:
-- 1. id_sexo,
-- 2. id_plan_obra_social,
-- 3. p_nombre,
-- 4. p_apellido,
-- 5. p_fec_nac,
-- 6. p_documento,
-- 7. p_domicilio 

DELIMITER //
CREATE PROCEDURE `insertPatient`(
	IN s INT, 
    IN pos INT, 
    IN n VARCHAR(60), 
    IN ap VARCHAR(100), 
    IN fnac DATE, 
    IN doc VARCHAR(20), 
    IN dom VARCHAR(100)
)
BEGIN
	SET @insercion = " ";
    SET @sexo = s;
    SET @pos = pos;
    SET @nombre = n;
    SET @apellido = ap;
    SET @fecNac = fnac;
    SET @doc = doc;
    SET @dom = dom;
    IF (@sexo AND 
		@pos AND 
        @nombre AND 
        @apellido AND
        @fecNac AND 
        @doc AND 
        @dom) <> ("" OR 0 OR NULL) 
	THEN
		SET @insercion = CONCAT("INSERT INTO pacientes(
				id_sexo, id_plan_obra_social, p_nombre, p_apellido, 
				p_fec_nac, p_documento, p_domicilio
			) VALUES(?, ?, ?, ?, ?, ?, ?)");
		PREPARE sentencia FROM @insercion;
		EXECUTE sentencia USING @sexo, @pos, @nombre, @apellido, @fecNac, @doc, @dom;
		DEALLOCATE PREPARE sentencia;
		SELECT * FROM pacientes ORDER BY id_paciente DESC;
	ELSE 
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "INSERCIÓN FALLIDA: Faltan datos por ingresar.";
	END IF;
END
// DELIMITER ;

-- LLAMANDO A SP `insertPatient` correctamente.
#CALL insertPatient(1,6,"Pedro Arturo", "Robles","1985/03/14", 30121023,"Aconcagua 1345");

-- LLAMANDO A SP `insertPatient` con error.
#CALL insertPatient(1,6,"Pedro Arturo", "Robles","1985/03/14", 30121023,"");

# ................................................................................................................................

-- STORED PROCEDURE "insertTurn" - Inserta un nuevo registro de turno. 
-- Recibe 5 parámetros:
-- 1. id_paciente,
-- 2. id_profesional,
-- 3. id_consultorio,
-- 4. fecha_turno,
-- 5. fecha_solicitud

DELIMITER //
CREATE PROCEDURE `insertTurn`(
	IN p INT,
    IN pr INT,
    IN c INT,
    IN ft DATE,
    IN fs DATE
)
BEGIN
	SET @paciente = p;
    SET @profesional = pr;
    SET @consultorio = c;
    SET @fechaTurno = ft;
    SET @fechaSolicitud = fs;
    IF (@paciente AND 
		@profesional AND 
        @consultorio AND 
        @fechaTurno AND 
        @fechaSolicitud) != ("" OR NULL OR 0) 
	THEN
		SET @insercion = CONCAT("INSERT INTO turnos(
				id_paciente, id_profesional, id_consultorio, fecha_turno, fecha_solicitud
			) VALUES (?, ?, ?, ?, ?)");
		PREPARE sentencia FROM @insercion;
		EXECUTE sentencia USING @paciente, @profesional, @consultorio, @fechaTurno, @fechaSolicitud;
		DEALLOCATE PREPARE sentencia;
		SELECT * FROM turnos ORDER BY id_turno DESC;
	ELSE
		SIGNAL SQLSTATE "45000"
		SET MESSAGE_TEXT = "INSERCIÓN FALLIDA: Faltan datos por ingresar.";
	END IF;
END
// DELIMITER ;

-- LLAMANDO A SP `insertTurn` correctamente.
#CALL insertTurn(4,5,2,"2022/12/15", "2022/11/25");

-- LLAMANDO A SP `insertTurn` con error.
#CALL insertTurn(4,5,NULL,"2022/12/15", "2022/11/25");

# ................................................................................................................................

-- STORED PROCEDURE "deleteRow". Elimina el registro de la tabla especificada en función del numero id. 
-- Recibe 3 parámetros:
-- 1. La tabla de la cual eliminaremos el registro,
-- 2. La columna de referencia donde se buscará el número de id del registro a eliminar,
-- 3. El número de id del registro en cuestión.

DELIMITER //
CREATE PROCEDURE `deleteRow`(IN tabla VARCHAR(50), IN columnId VARCHAR(30), IN id_num INT)
BEGIN
	SET @deleter = CONCAT("DELETE FROM ", tabla, " ", "WHERE ", columnId, " = ", id_num, ";");
    PREPARE sentencia FROM @deleter;
    EXECUTE sentencia;
    DEALLOCATE PREPARE sentencia;
    SET @reader = CONCAT("SELECT * FROM ", tabla, " ORDER BY ", columnId, " DESC");
    PREPARE lectura FROM @reader;
    EXECUTE lectura;
    DEALLOCATE PREPARE lectura;
END
// DELIMITER ;

-- LLAMAND A SP `deleteRow`.
#CALL deleteRow("turnos", "id_turno", 17);

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

###########################################
###    CREACIÓN DE OBJETOS: TRIGGERS    ###
###########################################

#############################################
###  CREACIÓN DE TABLAS AUXILIARES: LOGS  ###
#############################################

-- CREACIÓN DE TABLA "LOGSPACIENTES" 
CREATE TABLE IF NOT EXISTS logsPacientes (
	id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_paciente INT,
    old_id_paciente INT,
    new_id_paciente INT,
    old_plan_OSocial INT,
    new_plan_OSocial INT,
    old_domicilio VARCHAR(100),
    new_domicilio VARCHAR(100),
    operacion VARCHAR(100) NOT NULL
);


-- CREACIÓN DE TABLA "LOGSTURNOS"
CREATE TABLE IF NOT EXISTS logsTurnos (
	id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_turno INT,
    old_fecha_turno DATETIME,
    new_fecha_turno DATETIME,
    old_fecha_solicitud DATETIME,
    new_fecha_solicitud DATETIME,
    operacion VARCHAR(100) NOT NULL
);


-- CREACIÓN DE TABLA "LOGS_HISTORIASCLINICAS"
CREATE TABLE IF NOT EXISTS logs_HistoriasClinicas (
	id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_historiaClinica INT,
    id_paciente INT,
    id_profesional INT,
    id_especialidad INT,
    old_ultima_actualizacion DATE,
    new_ultima_actualizacion DATE,
    old_observaciones VARCHAR(255),
    new_observaciones VARCHAR(255),
    operacion VARCHAR(100) NOT NULL
);


##################################################
###  CREACIÓN DE TABLAS AUXILIARES: BITÁCORAS  ###
##################################################

-- CREACIÓN DE TABLA BITÁCORA PARA BACKUP DE DATOS DE PACIENTES
CREATE TABLE IF NOT EXISTS deletedPatientData (
	id_dData INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    date_time DATETIME NOT NULL,
    id_paciente INT NOT NULL,
    id_sexo INT NOT NULL,
    id_plan_obra_social INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR (100) NOT NULL,
	fec_nac DATE NOT NULL,
    documento VARCHAR (30) NOT NULL,
    domicilio VARCHAR (100) NOT NULL
);


-- CREACIÓN DE TABLA BITÁCORA PARA BACKUP DE DATOS DE TURNOS
CREATE TABLE IF NOT EXISTS deletedTurnData (
	id_dData INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    date_time DATETIME NOT NULL,
    id_turno INT NOT NULL,
    id_paciente INT NOT NULL,
    id_profesional INT NOT NULL,
    id_consultorio VARCHAR(100) NOT NULL,
	fecha_turno DATETIME NOT NULL,
    fecha_solicitud DATETIME NOT NULL
);


-- CREACIÓN DE TABLA BITÁCORA PARA BACKUP DE DATOS DE HISTORIAS CLINICAS
CREATE TABLE IF NOT EXISTS deletedHistoriasClinicas(
	id_dData INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_usuario VARCHAR(50) NOT NULL,
    date_time DATETIME NOT NULL,
    id_historiaClinica INT NOT NULL,
    id_paciente INT NOT NULL,
    id_profesional INT NOT NULL,
    id_especialidad INT NOT NULL,
    ultima_actualizacion DATE NOT NULL,
    observaciones VARCHAR(255) NOT NULL
);


###############################
###  CREACIÓN DE TRIGGERS   ###
###############################

### TRIGGERS PARA TABLA "PACIENTES" ###....................................................................

-- CREACIÓN DE TRIGGER DE INSERCIÓN SOBRE TABLA "PACIENTES".
CREATE TRIGGER `insertPatientDetect`
AFTER INSERT ON pacientes
FOR EACH ROW
INSERT INTO logsPacientes (
	id_usuario,
    fecha,
    hora,
    id_paciente,
    operacion
)
VALUES (
    SESSION_USER(),
    CURDATE(),
    CURTIME(),
    NEW.id_paciente,
    "SYSTEM MESSAGE: Se ha -INSERTADO- un nuevo registro en tabla PACIENTES."
);


-- CREACIÓN DE TRIGGER DE ACTUALIZACIÓN SOBRE TABLA "PACIENTES".
CREATE TRIGGER `updatePatientDetect`
AFTER UPDATE ON pacientes
FOR EACH ROW
INSERT INTO logsPacientes (
	id_usuario,
	fecha,
	hora,
	id_paciente,
	old_id_paciente,
	new_id_paciente,
    old_plan_OSocial,
    new_plan_OSocial,
    old_domicilio,
    new_domicilio,
	operacion
)
VALUES(
		SESSION_USER(),
		CURDATE(),
		CURTIME(),
        OLD.id_paciente,
        OLD.id_paciente,
        NEW.id_paciente,
        OLD.id_plan_obra_social,
        NEW.id_plan_obra_social,
		OLD.p_domicilio,
		NEW.p_domicilio,
		"SYSTEM MESSAGE: Se ha -ACTUALIZADO- un registro en tabla PACIENTES."
);


-- CREACIÓN DE TRIGGER DE ELIMINACIÓN SOBRE TABLA "PACIENTES".
CREATE TRIGGER `deletePatientDetect`
BEFORE DELETE ON pacientes
FOR EACH ROW
INSERT INTO logsPacientes (
	id_usuario,
    fecha,
    hora,
    id_paciente,
    operacion
)
VALUES (
    SESSION_USER(),
    CURDATE(),
    CURTIME(),
    OLD.id_paciente,
    "SYSTEM MESSAGE: Se ha -ELIMINADO- un registro en tabla PACIENTES."
);


-- CREACIÓN DE TRIGGER DE BACKUP DE DATOS ELIMINADOS DE PACIENTES.
CREATE TRIGGER `deletedPatientsBackup`
BEFORE DELETE ON pacientes
FOR EACH ROW
INSERT INTO deletedPatientData (
	id_usuario,
	date_time,
	id_paciente,
	id_sexo,
	id_plan_obra_social,
	nombre,
	apellido,
	fec_nac,
	documento,
	domicilio
)
VALUES (
	SESSION_USER(),
	NOW(),
	OLD.id_paciente,
	OLD.id_sexo,
	OLD.id_plan_obra_social,
	OLD.p_nombre,
	OLD.p_apellido,
	OLD.p_fec_nac,
	OLD.p_documento,
	OLD.p_domicilio
);

### ...........................................................................................................

### CREACIÓN DE TRIGGERS PARA TABLA "TURNOS" ### ..............................................................

-- CREACIÓN DE TRIGGER DE INSERCIÓN SOBRE TABLA "TURNOS".
CREATE TRIGGER `insertTurnDetect`
AFTER INSERT ON turnos
FOR EACH ROW
INSERT INTO logsTurnos (
	id_usuario,
    fecha,
    hora,
    id_turno,
    new_fecha_turno,
    new_fecha_solicitud,
    operacion
)
VALUES(
    SESSION_USER(),
    CURDATE(),
    CURTIME(),
    NEW.id_turno,
    NEW.fecha_turno,
    NEW.fecha_solicitud,
    "SYSTEM MESSAGE: Se ha -INSERTADO- un nuevo registro en tabla TURNOS."
);


-- CREACIÓN DE TRIGGER DE ACTUALIZACIÓN SOBRE TABLA "TURNOS".
CREATE TRIGGER `updateTurnDetect`
AFTER UPDATE ON turnos
FOR EACH ROW
INSERT INTO logsTurnos (
	id_usuario,
    fecha,
    hora,
    id_turno,
    old_fecha_turno,
    new_fecha_turno,
    old_fecha_solicitud,
    new_fecha_solicitud,
    operacion
)
VALUES(
	SESSION_USER(),
	CURDATE(),
	CURTIME(),
    OLD.id_turno,
	OLD.fecha_turno,
    NEW.fecha_turno,
    OLD.fecha_solicitud,
    NEW.fecha_solicitud,
	"SYSTEM MESSAGE: Se ha -ACTUALIZADO- un registro en tabla TURNOS."
);


-- CREACIÓN DE TRIGGER DE ELIMINACIÓN SOBRE TABLA "TURNOS".
CREATE TRIGGER `deleteTurnDetect`
BEFORE DELETE ON turnos
FOR EACH ROW
INSERT INTO logsTurnos (
	id_usuario,
    fecha,
    hora,
    id_turno,
    operacion
)
VALUES(
    SESSION_USER(),
    CURDATE(),
    CURTIME(),
    OLD.id_turno,
    "SYSTEM MESSAGE: Se ha -ELIMINADO- un registro en tabla TURNOS."
);


-- TRIGGER DE BACKUP DE ELIMINACION DE DATOS DE TURNOS
CREATE TRIGGER `deletedTurnsBackup`
BEFORE DELETE ON turnos
FOR EACH ROW
INSERT INTO deletedTurnData (
    id_usuario,
    date_time,
    id_turno,
    id_paciente,
    id_profesional,
    id_consultorio,
	fecha_turno,
    fecha_solicitud
)
VALUES(
	SESSION_USER(),
    NOW(),
    OLD.id_turno,
    OLD.id_paciente,
    OLD.id_profesional,
    OLD.id_consultorio,
    OLD.fecha_turno,
    OLD.fecha_solicitud
);

### ..........................................................................................................

### CREACIÓN DE TRIGGERS PARA TABLA "HISTORIAS_CLINICAS" ### .................................................

-- CREACIÓN DE TRIGGER DE INSERCIÓN SOBRE TABLA "HISTORIAS_CLINICAS".
CREATE TRIGGER `insertHistorialDetected`
AFTER INSERT ON historias_clinicas
FOR EACH ROW
INSERT INTO logs_HistoriasClinicas(
	id_usuario,
    fecha,
    hora,
    id_historiaClinica,
    operacion
)
VALUES(
	SESSION_USER(),
    CURDATE(),
    CURTIME(),
    NEW.id_historiaClinica,
    "SYSTEM MESSAGE: Se ha -INSERTADO- un nuevo registro en tabla HISTORIAS_CLINICAS."
);


-- CREACIÓN DE TRIGGER PARA ACTUALIZACIÓN SOBRE TABLA "HISTORIAS_CLINICAS"
CREATE TRIGGER `updateHistorialDetected`
AFTER UPDATE ON historias_clinicas
FOR EACH ROW
INSERT INTO logs_HistoriasClinicas(
    id_usuario,
    fecha,
    hora,
    id_historiaClinica,
    old_ultima_actualizacion,
    new_ultima_actualizacion,
    old_observaciones,
    new_observaciones,
    operacion
)
VALUES(
	SESSION_USER(),
    CURDATE(),
    CURTIME(),
    OLD.id_historiaClinica,
    OLD.ultima_actualizacion,
    NEW.ultima_actualizacion,
    OLD.observaciones,
    NEW.observaciones,
    "SYSTEM MESSAGE: Se ha -ACTUALIZADO- un registro en tabla HISTORIAS_CLINICAS."
);


-- CREACIÓN DE TRIGGER PARA ELIMINACIÓN SOBRE TABLA "HISTORIAS_CLINICAS"
CREATE TRIGGER `deleteHistorialDetected`
BEFORE DELETE ON historias_clinicas
FOR EACH ROW
INSERT INTO logs_HistoriasClinicas(
	id_usuario,
    fecha,
    hora,
    id_historiaClinica,
    operacion
)
VALUES(
	SESSION_USER(),
    CURDATE(),
    CURTIME(),
    OLD.id_historiaClinica,
    "SYSTEM MESSAGE: Se ha -ELIMINADO- un registro en tabla HISTORIAS_CLINICAS."
);


-- TRIGGER DE BACKUP DE ELIMINACION DE DATOS DE HISTORIAS CLINICAS.
CREATE TRIGGER `deletedHistorialsBackup`
BEFORE DELETE ON historias_clinicas
FOR EACH ROW
INSERT INTO deletedHistoriasClinicas(
	id_usuario,
    date_time,
    id_historiaClinica,
    id_paciente,
    id_profesional,
    id_especialidad,
    ultima_actualizacion,
    observaciones
)
VALUES(
	SESSION_USER(),
    NOW(),
    OLD.id_historiaClinica,
    OLD.id_paciente,
    OLD.id_profesional,
    OLD.id_especialidad,
    OLD.ultima_actualizacion,
    OLD.observaciones
);

### .............................................................................................................


### PROBANDO FUNCIONALIDAD DE TRIGGERS, VERIFICANDO CAMBIOS EN TABLAS AUXILIARES ###
/**
INSERT INTO historias_clinicas VALUES
(NULL, 5, 1, 1, "2022-11-23", "Dx: Paciente con obesidad 1, dislipemia y resistencia a insulina. Se sugiere consulta nutricional y endocrinologica.");
SELECT * FROM logs_historiasClinicas;

UPDATE historias_clinicas SET ultima_actualizacion = "2022-11-21" WHERE id_historiaClinica = 15;
SELECT * FROM logs_historiasClinicas;

DELETE FROM historias_clinicas WHERE id_historiaClinica = 15;
SELECT * FROM logs_historiasClinicas;

SELECT * FROM deletedHistoriasClinicas;
SELECT * FROM historias_clinicas;
**/

# -----------------------------------------------------------------------------------------------------------------------------------
# -----------------------------------------------------------------------------------------------------------------------------------

###############################
###  IMPLEMENTACIÓN DE DCL  ###
###############################

/**

# CREACIÓN DE USUARIO 1 Y DEFINICIÓN DE PERMISOS DE SÓLO LECTURA.

-- CREACIÓN DE usuario1
CREATE USER "usuario1"@"localhost" IDENTIFIED BY "123321";

-- OTORGAR A usuario1 PERMISOS DE LECTURA SOBRE TODAS LAS TABLAS DE LA BD
GRANT SELECT ON ProyectoIntegralia.* TO "usuario1"@"localhost"; # Otorga permisos de lectura sobre la BD "ProyectoIntegralia".
SHOW GRANTS FOR "usuario1"@"localhost"; # Verifico los permisos de usuario1.

# CREACIÓN DE USUARIO 2 Y DEFINICIÓN DE PERMISOS DE LECTURA, INSERCIÓN Y MODIFICACIÓN.

-- CREACIÓN DE usuario2
CREATE USER "usuario2"@"localhost" IDENTIFIED BY "456654";

-- OTORGAR A usuario2 PERMISOS DE LECTURA, INSERCIÓN Y MODIFICACIÓN SOBRE TODAS LAS TABLAS DE LA BD
GRANT SELECT, INSERT, UPDATE ON ProyectoIntegralia.* TO "usuario2"@"localhost"; # Otorga permisos de lectura, inserción y modificación 
																				# sobre la BD "ProyectoIntegralia".
SHOW GRANTS FOR "usuario2"@"localhost"; # Verifico los permisos de usuario2.

FLUSH PRIVILEGES; # Refresca los permisos.
**/

/**

### -------------------------------------------------------------------------------------------------------------------------

#######################################################################
###  IMPLEMENTACIÓN DE SENTENCIAS TCL: COMMIT, ROLLBACK, SAVEPOINT  ###
#######################################################################

SELECT @@AUTOCOMMIT; # Verificamos el estado de Autocommit. Si es 1 lo desactivamos seteandolo a 0.
SET AUTOCOMMIT = 0; # Desactivamos el estado de Autocommit cambiandolo de 1 a 0.


### TRBAJANDO SOBRE TABLA "PACIENTES" ###

SELECT * FROM pacientes;

-- ESTOS DATOS ESTÁN A MODO DE RECUPERACIÓN PARA CUANDO SE LOS BORRE MÁS ABAJO.
INSERT INTO pacientes VALUES
(NULL, 1 ,14, "Maria Laura", "Roman", "1990/11/09", "35651211", "Obispo Oro 124"),
(NULL, 1, 12, "Jorgelina Adriana", "Juncos", "1988/04/18", "33772641", "Av. Poeta Lugones 214"),
(NULL, 1, 23, "Agustina Belén", "Toledo", "1982/05/26", "28233254", "Asunción 723");

-- ELIMINACIÓN DE REGISTROS DE TABLA "PACIENTES".
START TRANSACTION;
DELETE FROM pacientes WHERE id_paciente BETWEEN 6 AND 10;

-- DESHACEMOS LA ELIMINACIÓN DE REGISTROS.
ROLLBACK;

-- HACEMOS EFECTIVOS LOS CAMBIOS.
COMMIT;


-- INSERCIÓN DE NUEVOS DATOS EN TABLA "PACIENTES"
START TRANSACTION;
INSERT INTO pacientes VALUES
(NULL, 2, 34, "Fernando Gastón", "Gómez", "1993/06/14", "37297351", "General Bustos 659"),
(NULL, 2, 47, "Hugo Tomas", "Michetti", "1996/01/12", "40155410", "21 de Septiembre 1331"),
(NULL, 1, 11, "Guillermina Francisca", "Ramallo", "1986/08/13", "31022574", "San Lorenzo 306"),
(NULL, 2, 14, "Andres Simón", "Vicenti", "1990/02/12", "35121213", "Paisandú 493"),
(NULL, 1, 47, "Amparo Micaela", "Ardiles", "2000/10/01", "44423211", "Nuevo Mundo 333");

SAVEPOINT punto_pacientes_1; # Establecemos el primer SAVEPOINT "punto_pacientes_1".
SELECT * FROM pacientes;

INSERT INTO pacientes VALUES
(NULL, 1, 34, "Maria Gabriela", "Pereyra", "1984/07/14", "29996991", "General Deheza 751"),
(NULL, 2, 47, "Juan Bautista", "Robles", "1981/10/18", "27198700", "Julio Roca 973"),
(NULL, 2, 11, "Lautaro Fabricio", "Derrida", "1990/08/30", "35412098", "Miguel Cervantes 203"),
(NULL, 1, 34, "Angelica Isabel", "Di Luca", "1995/03/19", "37962131", "Riachuelo 887"),
(NULL, 1, 47, "Virginia Anahí", "Oporto", "1988/04/11", "33223520", "Justo J. Urquiza 834");

SAVEPOINT punto_pacientes_2; # Establecemos el primer SAVEPOINT "punto_pacientes_2".
SELECT * FROM pacientes;

ROLLBACK TO punto_pacientes_1; # Retroceder al SAVEPOINT "punto_pacientes_1".
COMMIT; # Hacemos efectivos los cambios;


### TRBAJANDO SOBRE TABLA "TURNOS" ###

SELECT * FROM turnos;

-- INSERCIÓN DE NUEVOS DATOS EN TABLA "TURNOS"
START TRANSACTION;
INSERT INTO turnos VALUES
(NULL, 2, 4, 2, "2023/01/03", "2022/12/15"),
(NULL, 5, 6, 2, "2023/01/06", "2022/12/19"),
(NULL, 10, 2, 2, "2023/01/04", "2022/12/16"),
(NULL, 7, 3, 1, "2023/01/03", "2022/12/20"),
(NULL, 12, 1, 3, "2023/01/03", "2022/12/20");

SAVEPOINT punto_turnos_1; # Establecemos el primer SAVEPOINT "punto_turnos_1".

INSERT INTO turnos VALUES
(20, 18, 2, 2, "2023/01/04", "2022/12/15"),
(21, 19, 3, 1, "2023/01/03", "2022/12/20"),
(22, 20, 4, 2, "2023/01/03", "2022/12/16"),
(23, 21, 1, 3, "2023/01/03", "2022/12/21"),
(24, 22, 6, 2, "2023/01/06", "2022/12/20");

SAVEPOINT punto_turnos_2; # Establecemos el primer SAVEPOINT "punto_turnos_2".
SELECT * FROM turnos;

ROLLBACK TO punto_turnos_1; # Retroceder al SAVEPOINT "punto_turnos_1".
COMMIT; # Hacemos efectivos los cambios.
**/
