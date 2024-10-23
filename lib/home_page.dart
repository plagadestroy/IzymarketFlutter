import 'package:flutter/material.dart';
import 'package:myapp/pages/Comprar/comprar.dart';
import 'package:myapp/pages/Info/info.dart';
import 'package:myapp/pages/Login/infoPage.dart';
import 'package:myapp/styles/Styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Colores para los botones
  Color _sellButtonColor = Colors.transparent;
  Color _buyButtonColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          logoPrincipal, // Cambia esto por la URL de tu logo
          width: 200, // Ajusta el tamaño del logo aquí
          height: 80,
        ),
        centerTitle: true,
        backgroundColor: Colors.black, // Cambia el color del AppBar si deseas
        actions: [
          TextButton(
            onPressed: () {
              // Navegar a la página "¿Quiénes somos?"
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        QuinesSomos()), 
              );
            },
            child: Text(
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
                      onTap: () {
                        // Navegar a la página de Vender
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoPage()),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: _sellButtonColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(
                                  15)), // Bordes redondeados a la izquierda
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
                            fontSize: 24,
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
                          MaterialPageRoute(
                              builder: (context) => CatalogScreen()),
                        );
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: _buyButtonColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(
                                  15)), // Bordes redondeados a la derecha
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Comprar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
