import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/pages/infoPage.dart';

class RegisterSellerPage extends StatefulWidget {
  @override
  _RegisterSellerPageState createState() => _RegisterSellerPageState();
}

class _RegisterSellerPageState extends State<RegisterSellerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _storeNameController = TextEditingController();
  final _storeDescriptionController = TextEditingController();
  final _storeAddressController = TextEditingController();
  final _phoneController = TextEditingController();

  XFile? _profileImage;
  XFile? _storeImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isProfile) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        if (isProfile) {
          _profileImage = pickedImage;
        } else {
          _storeImage = pickedImage;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: GlassmorphicCard(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Registro de Vendedor',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField('Nombre del vendedor', _nameController, Icons.person),
                        const SizedBox(height: 20),
                        _buildTextField('Correo electrónico', _emailController, Icons.email),
                        const SizedBox(height: 20),
                        _buildTextField('Contraseña', _passwordController, Icons.lock, isPassword: true),
                        const SizedBox(height: 20),
                        _buildTextField('Nombre de la tienda', _storeNameController, Icons.store),
                        const SizedBox(height: 20),
                        _buildTextField('Descripción de la tienda', _storeDescriptionController, Icons.description),
                        const SizedBox(height: 20),
                        _buildTextField('Dirección de la tienda', _storeAddressController, Icons.location_on),
                        const SizedBox(height: 20),
                        _buildTextField('Número de teléfono', _phoneController, Icons.phone),
                        const SizedBox(height: 20),
                        _buildImagePicker('Imagen de perfil', _profileImage, true),
                        const SizedBox(height: 20),
                        _buildImagePicker('Imagen de la tienda', _storeImage, false),
                        const SizedBox(height: 30),
                        AnimatedButton(
                          text: 'Registrar',
                          color: const Color(0xFF00A8E8),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Lógica para registrar tienda
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[100]!.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa $label';
        }
        return null;
      },
    );
  }

  Widget _buildImagePicker(String label, XFile? image, bool isProfile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => _pickImage(isProfile),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200]!.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: image == null
                ? Icon(Icons.add_a_photo, color: Colors.blueAccent, size: 50)
                : Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
