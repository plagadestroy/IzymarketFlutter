import 'package:flutter/material.dart';
import 'package:myapp/pages/Login/login.page.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Si usas Supabase
import 'package:myapp/pages/Vender/form_screen.dart';
import 'package:myapp/pages/Info/quienesSomos.dart';
import 'package:myapp/styles/Styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Colores para los botones
  Color _sellButtonColor = Colors.transparent;
  Color _buyButtonColor = Colors.transparent;

  Future<void> _navigateToSellPage() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      // Usuario con sesión activa, navegar al formulario
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormTienda()),
      );
    } else {
      // Usuario sin sesión activa, navegar a la página de información
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          logoPrincipal, // Cambia esto por la URL de tu logo
          width: 200,
          height: 80,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              // Navegar a la página "¿Quiénes somos?"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuinesSomos()),
              );
            },
            child: const Text(
              '¿Quiénes somos?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Fondo blanco
          Container(color: Colors.pinkAccent.withOpacity(0.2)),
          // Fondo negro
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.blue.withOpacity(0.5),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botón para "Vender"
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _sellButtonColor = Colors.pink.withOpacity(0.5);
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _sellButtonColor = Colors.transparent;
                      });
                    },
                    child: GestureDetector(
                      onTap:
                          _navigateToSellPage, // Usa la función para redirigir
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: _sellButtonColor,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Vender',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Botón para "Comprar"
                Expanded(
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _buyButtonColor = Colors.blue.withOpacity(0.5);
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _buyButtonColor = Colors.transparent;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        // Navegar a la página de Comprar
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FormTienda()),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: _buyButtonColor,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Comprar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 2),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
