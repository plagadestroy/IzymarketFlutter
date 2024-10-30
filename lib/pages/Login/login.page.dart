import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:myapp/pages/Login/feedback_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5E60CE), Color(0xFF56CCF2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FormBuilder(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo circular
                  SizedBox(
                    height: size.height * 0.35,
                    width: size.width * 0.5,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Campo de correo electrónico
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Campo de contraseña
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: FormBuilderTextField(
                      name: 'Contrasena',
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  // Botón de inicio de sesión con Google
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color(0xFF5E60CE),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      _formkey.currentState?.save();
                      var a = _formkey.currentState?.value;
                      try {
                        await supabase.auth.signInWithPassword(
                            email: a?['email'], password: a?['Contrasena']);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sesion Iniciada')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedbackLog()));
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Error al intentar Iniciar sesion')));
                        }
                      }

                      // Lógica de inicio de sesión
                    },
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text('O tambien'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: const Color.fromARGB(255, 128, 49, 255),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      _formkey.currentState?.save();
                      var a = _formkey.currentState?.value;
                      try {
                        await supabase.auth.signUp(
                            email: a?['email'], password: a?['Contrasena']);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Cuenta Creada Con exito porfavor confirma tu correo')));
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Error al intentar Crear Cuenta')));
                        }
                      }
                      // Lógica de inicio de sesión
                    },
                    child: const Text(
                      'Registrate',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
