import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_keppri/screens/AnamnesisStep2%20.dart';
import 'package:prueba_keppri/screens/confirmation_screen.dart';

import 'providers/provider_state.dart';
import 'screens/AnamnesisStep1.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderState())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/step1',
      routes: {
        '/step1': (context) => const Anamnesisstep1(),
        '/step2': (context) => const Anamnesisstep2(),
        '/confirmation': (context) => const ConfirmationScreen()
      },
    );
  }
}