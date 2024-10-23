import 'package:flutter/material.dart';
import 'package:myapp/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Asegúrate de que los widgets se inicialicen antes de Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Ejecuta la aplicación
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IzyMarket',
      debugShowCheckedModeBanner: false,
      home:
          HomeScreen(), // Asegúrate de que esta sea la pantalla que quieres mostrar primero
    );
  }
}
