CREATE TABLE PACIENTE (
    ID_Paciente INT AUTO_INCREMENT PRIMARY KEY,  -- ID autoincremental como clave primaria
    DNI VARCHAR(8) NOT NULL UNIQUE,     -- DNI único, longitud máxima de 8 caracteres
    Apellidos VARCHAR(100) NOT NULL,    -- Apellido del paciente
    Nombres VARCHAR(100) NOT NULL,      -- Nombre del paciente
    Genero VARCHAR(10) NOT NULL,        -- Género (Masculino/Femenino)
    Fecha_Nacimiento DATE NOT NULL,     -- Fecha de nacimiento
    Teléfono VARCHAR(15)                -- Teléfono (Celular/Fijo)
);

CREATE TABLE ANTECEDENTES_MEDICOS (
    ID_Antecedente INT AUTO_INCREMENT PRIMARY KEY,  -- ID autoincremental como clave primaria
    ID_Paciente INT NOT NULL,                       -- ID que permite relacionarlo con la entidad Paciente
    Antecedentes_Familiares TEXT,                   -- Cualquier problema y/o enfermedad hereditaria
    Antecedentes_Personales TEXT,                   -- Cualquier problema y/o enfermedad de la paciente del pasado
    Número_Embarazos INT,                           -- Cantidad de embarazos anteriores
    Número_Abortos INT,                             -- Cantidad de abortos anteriores
    Hipertensión BOOLEAN,                           -- Si la paciente padece de hipertension
    Diabetes BOOLEAN,                               -- Si la paciente padece de diabetes
    Cardiopatias BOOLEAN,                           -- Si la paciente padece de alguna cardiopatia
    Otras_Enfermedades TEXT,                        -- Si la paciente padece de alguna otra enfermedad
    Fecha_Registro DATE NOT NULL,                   -- Fecha en la que se registraron los antecedentes
    FOREIGN KEY (ID_Paciente) REFERENCES PACIENTE(ID_Paciente)
);

CREATE TABLE CONTROL_PRENATAL (
    ID_Control INT AUTO_INCREMENT PRIMARY KEY,          -- ID autoincremental como clave primaria
    ID_Paciente INT NOT NULL,                           -- ID que permite relacionarlo con la entidad Paciente
    Fecha_Control DATE NOT NULL,                        -- Fecha en la que se realizó el control
    Edad_Gestacional_Semanas INT NOT NULL,              -- Número de semanas de gestación
    Presión_Arterial_Sistólica INT,                     -- Presión cuando los ventrículos del corazón se contraen (mm)
    Presión_Arterial_Diastólica INT,                    -- Presión cuando los ventrículos del corazón se relajan (mm)
    Peso DECIMAL(5,2),                                  -- Peso de la paciente
    Movimientos_Fetales BOOLEAN,                        -- Presencia de movimientos fetales
    Frecuencia_Cardiaca_Fetal INT,                      -- Presencia de frecuencia cardiaca fetal
    Proteinuria BOOLEAN,                                -- Presencia de proteinuria
    Riesgo VARCHAR(20),                                 -- Nivel de riesgo (Bajo/Media/Alto)
    FOREIGN KEY (ID_Paciente) REFERENCES PACIENTE(ID_Paciente)
);

CREATE TABLE DIAGNOSTICO (
    ID_Diagnostico INT AUTO_INCREMENT PRIMARY KEY,      -- ID autoincremental como clave primaria
    ID_Control INT NOT NULL,                            -- ID que permite relacionarlo con la entidad Control Prenatal
    Fecha_Diagnostico DATE NOT NULL,                    -- Fecha en la que se hizo el diagnóstico
    Morbilidad_Materna_Extrema BOOLEAN,                 -- Se indica si existe morbilidad materna extrem
    Observaciones TEXT,                                 -- Notas adicionales
    FOREIGN KEY (ID_Control) REFERENCES CONTROL_PRENATAL(ID_Control)
);

CREATE TABLE USUARIO (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Usuario VARCHAR(50) NOT NULL UNIQUE,         -- ID autoincremental como clave primaria
    Contraseña VARCHAR(255) NOT NULL,                   -- Encriptada
    Rol VARCHAR(20) NOT NULL                            -- Ejemplo: Administrador, Médico
);

CREATE TABLE TRATAMIENTO (
    ID_Tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Diagnostico INT NOT NULL,
    Nombre_Tratamiento VARCHAR(100),
    Dosis VARCHAR(50),
    Duración VARCHAR(50),
    Observaciones TEXT,
    FOREIGN KEY (ID_Diagnostico) REFERENCES DIAGNOSTICO(ID_Diagnostico)
);

CREATE TABLE HISTORIAL_MEDICO (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Paciente INT NOT NULL,
    Descripción TEXT,
    Fecha_Registro DATE NOT NULL,
    FOREIGN KEY (ID_Paciente) REFERENCES PACIENTE(ID_Paciente)
);

