import 'package:flutter/material.dart';
import 'package:myapp/pages/Comprar/us_perfil.dart';
import 'package:myapp/styles/Styles.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({super.key});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String selectedType = 'Todos'; // Opción seleccionada
  List<Map<String, String>> filteredStores = [];
  List<Map<String, String>> displayedStores = [];
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> stores = [
    {
      'name': 'Refreshing',
      'description': 'Tienda especializada en ropa hecha a la medida',
      'imageUrl':
          'https://static4.depositphotos.com/1005895/355/i/450/depositphotos_3554179-stock-photo-shopping-in-a-causal-clothing.jpg',
      'profileUrl': '/perfil_tienda1',
      'type': 'Ropa',
    },
    {
      'name': 'Pablito',
      'description': 'Panaderia y pasteleria',
      'imageUrl':
          'https://images.pexels.com/photos/916446/pexels-photo-916446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda2',
      'type': 'Comida',
    },
    {
      'name': 'Bajael',
      'description': 'Los mejores productos electronicos al mejor precio',
      'imageUrl':
          'https://png.pngtree.com/background/20230521/original/pngtree-commercial-electronics-store-of-many-screens-picture-image_2683696.jpg',
      'profileUrl': '/perfil_tienda3',
      'type': 'Electrónica',
    },
    {
      'name': 'CinnaShoes',
      'description': 'La mejor tienda de zapatos y zapatillas del mundo',
      'imageUrl':
          'https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda4',
      'type': 'Zapatos',
    },
    {
      'name': 'Julong',
      'description': 'Venta de los mejores y mas vinos vinos',
      'imageUrl':
          'https://images.pexels.com/photos/11771951/pexels-photo-11771951.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda5',
      'type': 'Comida',
    },
    {
      'name': 'LiamCoffe',
      'description': 'Contamos con los mejores granos de café del mundo',
      'imageUrl':
          'https://images.pexels.com/photos/2551794/pexels-photo-2551794.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'profileUrl': '/perfil_tienda6',
      'type': 'Comida',
    },
  ];

  @override
  void initState() {
    super.initState();
    filteredStores = stores; // Mostrar todas las tiendas al inicio
    displayedStores = filteredStores;
    searchController.addListener(() {
      filterStoresBySearch();
    });
  }

  // Función para filtrar por tipo
  void filterStores(String type) {
    setState(() {
      if (type == 'Todos') {
        filteredStores = stores;
      } else {
        filteredStores =
            stores.where((store) => store['type'] == type).toList();
      }
      displayedStores = filteredStores; // Actualizar la lista mostrada
    });
  }

  // Función para filtrar por búsqueda
  void filterStoresBySearch() {
    final query = searchController.text.toLowerCase();
    setState(() {
      displayedStores = filteredStores.where((store) {
        return store['name']!.toLowerCase().contains(query) ||
            store['description']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _login() {
    // Aquí agregar lógica para iniciar sesión
    print("Iniciar sesión");
  }

  void _logout() {
    // Aquí agregar lógica para cerrar sesión
    print("Cerrar sesión");
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile =
        screenWidth < 600; // Definir que es móvil si el ancho es menor a 600px

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 6),
            Image.network(
              logoMarket,
              width: 60,
              height: 60,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        actions: [
          TextButton(
            onPressed: _login,
            child: const Text(
              'Iniciar Sesión',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: _logout,
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Texto y botón de filtro y buscador
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  children: [
                    const Text(
                      'Explora nuestras tiendas locales y apoya a emprendedores.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          value: selectedType,
                          items: <String>[
                            'Todos',
                            'Ropa',
                            'Comida',
                            'Electrónica',
                            'Zapatos'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            filterStores(newValue!);
                          },
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Buscar tienda...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // GridView filtrado
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile
                        ? 2
                        : 3, // Cambiar el número de columnas según el ancho
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                    childAspectRatio:
                        isMobile ? 0.85 : 0.75, // Ajustar el aspecto del tamaño
                  ),
                  itemCount: displayedStores.length,
                  itemBuilder: (context, index) {
                    final store = displayedStores[index];
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
                                      color: Colors.grey[300],
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
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    store['description']!,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
      ),
      // Footer
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            '© 2024 iziMarket. Todos los derechos reservados.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
