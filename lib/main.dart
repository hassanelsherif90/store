import 'package:flutter/material.dart';
import 'package:store/screen/home_screen.dart';
import 'package:store/screen/update_update_screen.dart';

void main() {
  runApp(const StroreApp());
}

class StroreApp extends StatelessWidget {
  const StroreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
