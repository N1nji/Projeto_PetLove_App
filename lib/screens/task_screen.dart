import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 144, 165),
      appBar: AppBar(
        title: const Text(
          'Verdade e Desafio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Arial',
            color: Color.fromARGB(255, 0, 0, 0),
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
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const SizedBox(height: 20)],
            ),
          ),
        ],
      ),
    );
  }
}
