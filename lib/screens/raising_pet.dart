import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PetHomeScreen extends StatelessWidget {
  final String petName;
  final int petAge;
  final String petAnimation;

  const PetHomeScreen({
    Key? key,
    required this.petName,
    required this.petAge,
    required this.petAnimation, required String petType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB0003A),
      appBar: AppBar(
        title: const Text(
          'Pet Love',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Arial',
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 5,
                color: Colors.black38,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Ação do menu de atividades
          },
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/raising_cat.json', // Animação do Nyan Cat :D
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                Text(
                  '$petName, $petAge anos',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Ação de alimentar o pet
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.restaurant, color: Colors.pink),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                //loja de acessórios
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.shopping_cart, color: Colors.pink),
            ),
          ),
        ],
      ),
    );
  }
}
