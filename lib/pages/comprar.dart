// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/pages/us_perfil.dart';
import 'package:myapp/styles/Styles.dart';

// Constantes para los logos

// Pantalla del catálogo
class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});

  // Simulación de datos de tiendas
  final List<Map<String, String>> stores = [
    {
      'name': 'Tienda 1',
      'description': 'Descripción de la tienda 1',
      'imageUrl':
          'https://images.pexels.com/photos/2309235/pexels-photo-2309235.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda1',
    },
    {
      'name': 'Tienda 2',
      'description': 'Descripción de la tienda 2',
      'imageUrl':
          'https://images.pexels.com/photos/916446/pexels-photo-916446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda2',
    },
    {
      'name': 'Tienda 3',
      'description': 'Descripción de la tienda 3',
      'imageUrl':
          'https://images.pexels.com/photos/2119903/pexels-photo-2119903.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda3',
    },
    {
      'name': 'CapstoneShoes',
      'description': 'La mejor tienda del mundo',
      'imageUrl':
          'https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda4',
    },
    {
      'name': 'Tienda 5',
      'description': 'Descripción de la tienda 5',
      'imageUrl':
          'https://images.pexels.com/photos/11771951/pexels-photo-11771951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda5',
    },
    {
      'name': 'Tienda 6',
      'description': 'Descripción de la tienda 6',
      'imageUrl':
          'https://images.pexels.com/photos/2551794/pexels-photo-2551794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'iziMarket',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(width: 8),
            Image.network(
              logoMarket,
              width: 30,
              height: 30,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: Image.network(
                logoPrincipal,
                height: 100, // Ajusta la altura según sea necesario
                fit: BoxFit.contain,
              ),
            ),
            // Texto encima del GridView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Text(
                'Explora nuestras tiendas locales y apoya a emprendedores.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            // Expande el GridView para ocupar el espacio restante
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Tres columnas
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // Ajuste de tamaño de las tarjetas
                ),
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  final store = stores[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StoreProfileScreen(store: store),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.network(
                                store['imageUrl']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[
                                        300], // Color de fondo en caso de error
                                    child: const Icon(Icons.error),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store['name']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  store['description']!,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
