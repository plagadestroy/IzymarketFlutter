import 'dart:ui';
import 'package:myapp/pages/Login/login.dart';
import 'package:myapp/pages/Login/register.dart';
import 'package:myapp/styles/Styles.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
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
        child: Center(
          child: GlassmorphicCard(
            child: Padding(
              padding: const EdgeInsets.all(30.0), // Ajuste de padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Espacio para la imagen
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      logoPrincipal,
                      height: 200.0, // Aumentamos el tamaño de la imagen
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 0.5),
                  // Texto informativo con borde y estilo moderno
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white.withOpacity(0.8),
                          width: 3.0), // Bordes más gruesos
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Inicia sesión para registrar tu tienda y empezar a vender en IzyMarket. '
                      'Si ya tienes cuenta, inicia sesión para administrar, agregar y gestionar tus productos.',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  // Botón de "Registrar Tienda" con estilo moderno
                  AnimatedButton(
                    text: 'Registrar Tienda',
                    color: const Color(0xFF00A8E8),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                      // Lógica para registrar tienda
                    },
                  ),
                  const SizedBox(height: 25.0),
                  // Botón de "Iniciar Sesión" con estilo moderno
                  AnimatedButton(
                    text: 'Iniciar Sesión',
                    color: const Color(0xFFFF4081),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      // Lógica para iniciar sesión
                    },
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

class GlassmorphicCard extends StatelessWidget {
  final Widget child;

  GlassmorphicCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.3), // Borde más visible
          width: 3.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  AnimatedButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 40.0), // Botones más grandes
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0), // Bordes más redondeados
        ),
        elevation: 12,
        shadowColor: Colors.black38,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0, // Aumentamos el tamaño de la letra
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
