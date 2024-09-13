from django.urls import path
from . import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('nosotros', views.nosotros, name='nosotros'),
    path('pacientes', views.pacientes, name='pacientes'),
    path('pacientes/crear', views.crearPaciente, name='crear'),
    path('pacientes/editar', views.editarPaciente, name='editar'),
]
