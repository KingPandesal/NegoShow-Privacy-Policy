import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase is template-ready but not tied to any project.
  // The per-platform configuration is expected to be added by:
  //   flutterfire configure
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter Inator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: const AppRouter().onGenerateRoute,
    );
  }
}

