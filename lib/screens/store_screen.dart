import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 147, 165),
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
