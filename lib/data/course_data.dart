final List<Map<String, dynamic>> listaCursos = [
  {
    'nombre': 'Programación Básica en Dart',
    'docente': 'Prof. Andrés Gómez',
    'duracion': 15, // int
    'nivel': 'Básico',
    'certificado': true, // bool
  },
  {
    'nombre': 'Diseño de Apps con Flutter',
    'docente': 'Ing. Laura Martínez',
    'duracion': 25,
    'nivel': 'Intermedio',
    'certificado': true,
  },
  {
    'nombre': 'Bases de Datos para Móviles',
    'docente': 'Ing. Carlos Mendoza',
    'duracion': 20,
    'nivel': 'Intermedio',
    'certificado': false,
  },
  {
    'nombre': 'Publicación en Tiendas de Apps',
    'docente': 'Dra. Sofía Herrera',
    'duracion': 10,
    'nivel': 'Avanzado',
    'certificado': true,
  },
];

Future<List<Map<String, dynamic>>> obtenerCursos() async {
  // Espera 2 segundos para simular la carga
  await Future.delayed(const Duration(seconds: 2));
  return listaCursos;
}
