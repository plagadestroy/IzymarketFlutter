import 'package:flutter/material.dart';

// Pantalla de perfil de tienda (ejemplo)
class StoreProfileScreen extends StatelessWidget {
  final Map<String, String> store;

  StoreProfileScreen({super.key, required this.store});

  // Simulación de productos de la tienda
  final List<Map<String, String>> products = [
    {
      'name': 'Producto 1',
      'description': 'Descripción del producto 1',
      'price': '\$9.99',
      'imageUrl': 'https://nikeclprod.vtexassets.com/arquivos/ids/1101407-1200-1200?v=638635052888030000&width=1200&height=1200&aspect=true',
    },
    {
      'name': 'Producto 2',
      'description': 'Descripción del producto 2',
      'price': '\$19.99',
      'imageUrl': 'https://nikeclprod.vtexassets.com/arquivos/ids/1068679/FQ7331_001_A_PREM.jpg?v=638570091449770000',
    },
    {
      'name': 'Producto 3',
      'description': 'Descripción del producto 3',
      'price': '\$29.99',
      'imageUrl': 'https://nikeclprod.vtexassets.com/arquivos/ids/416597/DH3162_100_A_PREM.jpg?v=637836608782100000',
    },
    {
      'name': 'Producto 4',
      'description': 'Descripción del producto 4',
      'price': '\$39.99',
      'imageUrl': 'https://nikeclprod.vtexassets.com/arquivos/ids/673554/DX9176_100_A_PREM.jpg?v=638158947193630000',
    },
    {
      'name': 'Producto 5',
      'description': 'Descripción del producto 5',
      'price': '\$49.99',
      'imageUrl': 'https://nikeclprod.vtexassets.com/arquivos/ids/977697-800-800?v=638478481466530000&width=800&height=800&aspect=true',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          store['name']!,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView( // Permitir desplazamiento en toda la pantalla
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Usar márgenes fijos
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                store['imageUrl']!,
                width: double.infinity,
                height: 250, // Altura fija para la imagen
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16), // Espaciado fijo
              Text(
                store['name']!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                store['description']!,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Lógica para contactar o interactuar con la tienda
                },
                child: Text(
                  'Contactar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Productos Disponibles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // Deshabilitar el desplazamiento del GridView
                shrinkWrap: true, // Permitir que el GridView ocupe el espacio necesario
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Tres columnas
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.9, // Ajuste para tarjetas más altas
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.network(
                              product['imageUrl']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                product['description']!,
                                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                              ),
                              SizedBox(height: 4),
                              Text(
                                product['price']!,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
