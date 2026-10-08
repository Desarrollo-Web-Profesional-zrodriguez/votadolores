import 'package:flutter/material.dart';
import 'presentation/votacion_screen.dart';

void main() => runApp(const VotaDoloresApp());

class VotaDoloresApp extends StatelessWidget {
  const VotaDoloresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vota Dolores Hidalgo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const VotacionScreen(),
    );
  }
}
