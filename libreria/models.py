from django.db import models

class Paciente(models.Model):
    id_paciente = models.AutoField(primary_key=True)
    dni = models.CharField(max_length=8, unique=True)
    apellidos = models.CharField(max_length=100)
    nombres = models.CharField(max_length=100)
    genero = models.CharField(max_length=10)
    fecha_nacimiento = models.DateField()
    telefono = models.CharField(max_length=15, blank=True, null=True)

    def __str__(self):
        return f"{self.nombres} {self.apellidos}"


class AntecedentesMedicos(models.Model):
    id_antecedente = models.AutoField(primary_key=True)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    antecedentes_familiares = models.TextField(blank=True, null=True)
    antecedentes_personales = models.TextField(blank=True, null=True)
    numero_embarazos = models.IntegerField(blank=True, null=True)
    numero_abortos = models.IntegerField(blank=True, null=True)
    hipertension = models.BooleanField(default=False)
    diabetes = models.BooleanField(default=False)
    cardiopatias = models.BooleanField(default=False)
    otras_enfermedades = models.TextField(blank=True, null=True)
    fecha_registro = models.DateField()

    def __str__(self):
        return f"Antecedentes de {self.paciente}"


class ControlPrenatal(models.Model):
    id_control = models.AutoField(primary_key=True)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    fecha_control = models.DateField()
    edad_gestacional_semanas = models.IntegerField()
    presion_arterial_sistolica = models.IntegerField(blank=True, null=True)
    presion_arterial_diastolica = models.IntegerField(blank=True, null=True)
    peso = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    movimientos_fetales = models.BooleanField(default=False)
    frecuencia_cardiaca_fetal = models.IntegerField(blank=True, null=True)
    proteinuria = models.BooleanField(default=False)
    riesgo = models.CharField(max_length=20, blank=True, null=True)

    def __str__(self):
        return f"Control Prenatal de {self.paciente} - {self.fecha_control}"


class Diagnostico(models.Model):
    id_diagnostico = models.AutoField(primary_key=True)
    control_prenatal = models.ForeignKey(ControlPrenatal, on_delete=models.CASCADE)
    fecha_diagnostico = models.DateField()
    morbilidad_materna_extrema = models.BooleanField(default=False)
    observaciones = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"Diagnóstico {self.id_diagnostico} de {self.control_prenatal.paciente}"


class HistorialMedico(models.Model):
    id_historial = models.AutoField(primary_key=True)
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    descripcion = models.TextField(blank=True, null=True)
    fecha_registro = models.DateField()

    def __str__(self):
        return f"Historial Médico de {self.paciente}"


class Tratamiento(models.Model):
    id_tratamiento = models.AutoField(primary_key=True)
    diagnostico = models.ForeignKey(Diagnostico, on_delete=models.CASCADE)
    nombre_tratamiento = models.CharField(max_length=100, blank=True, null=True)
    dosis = models.CharField(max_length=50, blank=True, null=True)
    duracion = models.CharField(max_length=50, blank=True, null=True)
    observaciones = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"Tratamiento para {self.diagnostico.control_prenatal.paciente}"


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nombre_usuario = models.CharField(max_length=50, unique=True)
    contraseña = models.CharField(max_length=255)
    rol = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre_usuario
