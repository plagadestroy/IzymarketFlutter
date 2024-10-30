import 'package:flutter/material.dart';
import 'package:myapp/pages/Login/login.page.dart';
import 'package:myapp/pages/Vender/addtienda.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormTienda extends StatefulWidget {
  const FormTienda({super.key});

  @override
  State<FormTienda> createState() => _FormTiendaState();
}

class _FormTiendaState extends State<FormTienda> {
  final SupabaseClient supabase = Supabase.instance.client;

  String? _imageUrl;
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();
  String? selectedCategory;

  Future<void> _guardarTienda() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes iniciar sesión')),
      );
      return;
    }

    final tiendaData = {
      'nombre': nombreController.text,
      'descripcion': descripcionController.text,
      'direccion': direccionController.text,
      'categoria': selectedCategory,
      'imagen_url': _imageUrl,
    };

    try {
      await supabase.from('tiendas').upsert(tiendaData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Tienda guardada o actualizada correctamente')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar la tienda: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso De tienda'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          const Text('Cerrar Sesion'),
          IconButton(
            onPressed: () async {
              try {
                await supabase.auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sesión cerrada exitosamente'),
                    backgroundColor: Colors.green,
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error al cerrar sesión: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_imageUrl != null)
              const SizedBox(
                height: 100,
                width: 200,
              ),
            Addtienda(
              imageUrl: _imageUrl,
              onUpload: (imageUrl) {
                setState(() {
                  final timestamp = DateTime.now().millisecondsSinceEpoch;
                  _imageUrl = '$imageUrl?t=$timestamp';
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre de la Tienda',
                    ),
                  ),
                  TextField(
                    controller: descripcionController,
                    decoration: const InputDecoration(
                      labelText: 'Descripción',
                    ),
                  ),
                  TextField(
                    controller: direccionController,
                    decoration: const InputDecoration(
                      labelText: 'Dirección',
                    ),
                  ),
                  DropdownButton<String>(
                    hint: const Text('Selecciona una categoría'),
                    value: selectedCategory,
                    items: <String>['Ropa', 'Electrónica', 'Comida']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (nombreController.text.isNotEmpty &&
                          descripcionController.text.isNotEmpty &&
                          direccionController.text.isNotEmpty &&
                          selectedCategory != null &&
                          _imageUrl != null) {
                        await _guardarTienda();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Por favor completa todos los campos'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: const Text('Guardar Tienda'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
