from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def inicio(request):
    return render(request, 'paginas/inicio.html')

def nosotros(request):
    return render(request, 'paginas/nosotros.html')

def pacientes(request):
    return render(request, 'pacientes/index.html')

def crearPaciente(request):
    return render(request, 'pacientes/crear.html')

def editarPaciente(request):
    return render(request, 'pacientes/editar.html')

