import 'package:flutter/material.dart';
import '../data/course_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi catálogo de cursos'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: obtenerCursos(),
        builder: (context, snapshot) {
          // Mientras carga, muestra el indicador circular
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Cargando cursos...'),
                ],
              ),
            );
          }

          // Cuando termina de cargar, muestra las tarjetas
          final cursos = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: cursos.length,
            itemBuilder: (context, index) {
              final curso = cursos[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.book, color: Colors.white),
                  ),
                  title: Text(
                    curso['nombre'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Docente: ${curso['docente']}\n'
                    'Duración: ${curso['duracion']} horas • Nivel: ${curso['nivel']}',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

