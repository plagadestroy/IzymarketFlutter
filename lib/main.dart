// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/pages/comprar.dart';
import 'package:myapp/pages/infoPage.dart';
import 'styles/Styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IziMarket',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tamaños y colores para los círculos
  final double _sellCircleSize = 200; // Tamaño aumentado
  final double _buyCircleSize = 200; // Tamaño aumentado
  Color _sellCircleColor = Colors.transparent;
  Color _buyCircleColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Espaciado entre el logo y el texto
                SizedBox(height: 30),
                // Logo de IziMarket
                Image.network(
                  logoPrincipal, // Cambia esto por la URL de tu logo
                  width: 350,
                  height: 350,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Espacio entre círculos
                  children: [
                    // Círculo para "Vender"
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _sellCircleColor = Colors.pink.withOpacity(0.5);
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _sellCircleColor = Colors.transparent;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Navegar a la página de Vender
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InfoPage()),
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: _sellCircleSize,
                          height: _sellCircleSize,
                          decoration: BoxDecoration(
                            color: _sellCircleColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.3),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Vender',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24, // Tamaño aumentado
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Círculo para "Comprar"
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _buyCircleColor = Colors.blue.withOpacity(0.5);
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _buyCircleColor = Colors.transparent;
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Navegar a la página de Comprar
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CatalogScreen()),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: _buyCircleSize,
                          height: _buyCircleSize,
                          decoration: BoxDecoration(
                            color: _buyCircleColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Comprar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24, // Tamaño aumentado
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              shadows: [
                                Shadow(
                                  offset: const Offset(0, 2),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
