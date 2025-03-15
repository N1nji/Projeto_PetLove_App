import 'package:flutter/material.dart';

class PetCreationScreen extends StatefulWidget {
  const PetCreationScreen({super.key});

  @override
  PetCreationScreenState createState() => PetCreationScreenState();
}

class PetCreationScreenState extends State<PetCreationScreen> {
  String petName = '';
  int petAge = 0;
  String petType = 'Dog'; // Tipo inicial

  final Map<String, String> petImages = {
    'Dog': '🐶',
    'Cat': '🐱',
    'Rabbit': '🐰',
    'Bird': '🐦'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Pet with Pet Love', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.pink.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Espaço entre AppBar e título
              const Text(
                'Choose your Pet Love!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 99, 17, 44)),
              ),
              const SizedBox(height: 20),

              // Animação do ícone do pet
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
                  setState(() {}); // Reinicia a animação para um loop infinito
                },
              ),

              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Pet Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {
                    petName = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Pet Age',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    petAge = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 10),
              Container(
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

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Pet Created: $petName, Age: $petAge, Type: $petType');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Create PetLove',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
