import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_1/screens/pet_creation_screen.dart'; // Tela de criação do pet (Por enquanto só funciona o Gato)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Love',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Após 7 segundos, vai para a tela de criação do pet (Tem que mostrar um pouco a animação do Nyan Cat :D)
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PetCreationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0003A),
      appBar: AppBar(
        title: const Text(
          'Pet Love', 
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            fontFamily: 'Poppins',
            color: Colors.pink,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black54,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true, //Centralizando o título :)
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animação do Nyan Cat usando Lottie
          Center(
            child: Lottie.asset(
              'assets/cat_animation.json', // Animação do Nyan Cat na Tela de Carregamento :D
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20), // Espaço entre a animação e a barra de carregamento

          // Barrinha de carregamento
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: LinearProgressIndicator(
              minHeight: 8,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
