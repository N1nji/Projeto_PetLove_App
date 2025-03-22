import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'raising_pet.dart'; // Importação da nova tela

class PetCreationScreen extends StatefulWidget {
  const PetCreationScreen({super.key});

  @override
  PetCreationScreenState createState() => PetCreationScreenState();
}

class PetCreationScreenState extends State<PetCreationScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

 // Seleção dos Pets e definição de idade, nome e tipo do pet 
  final Map<String, String> petImages = {
    'Dog': '🐶',
    'Cat': '🐱',
    'Rabbit': '🐰',
    'Bird': '🐦'
  };

  String petName = '';
  int petAge = 0;
  String petType = 'Dog';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Pet Love', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // **Fundo com gradiente rosa escuro para rosa quase preto**
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFB0003A), Color(0xFF1A0010)], // Gradiente do rosa escuro → rosa quase preto
              ),
            ),
          ),
          // Corações animado com Lottie (ainda será feito mudanças)
          for (var position in [
            const Offset(10, 10),
            const Offset(300, 10),
            const Offset(10, 600),
            const Offset(300, 600),
            const Offset(190, 100),
            const Offset(110, 100),
          ])
            Positioned(
              top: position.dy,
              left: position.dx,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Lottie.asset(
                  'assets/heart_animation.json',
                  controller: _animationController,
                  repeat: true,
                ),
              ),
            ),
          // Conteúdo centralizado
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose your Pet Love!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 1.2),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Text(
                          petImages[petType]!,
                          style: const TextStyle(fontSize: 60),
                        ),
                      );
                    },
                    onEnd: () {
                      if (!mounted) return;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Pet Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) {
                        if (!mounted) return;
                        setState(() {
                          petName = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Pet Age',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          if (!mounted) return;
                          petAge = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(          //Será mudado para um DecoratedBox
                    width: 250,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: petType,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (!mounted) return;
                            petType = newValue!;
                          });
                        },
                        items: petImages.keys.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Text(
                                  petImages[value]!,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(width: 10),
                                Text(value, style: const TextStyle(fontSize: 16)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  
                  // Leva para tela do Pet Criado
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetHomeScreen(
                            petName: petName,
                            petAge: petAge,
                            petType: petType, petAnimation: '',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Create Pet Love',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
