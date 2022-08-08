import 'package:flutter/material.dart';
import 'package:simplechat/routes.dart';

import 'features/login/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: const SplashScreen(),
    );
  }
}
