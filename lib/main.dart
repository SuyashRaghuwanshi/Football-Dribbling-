import 'package:flutter/material.dart';
import 'package:football/Screens/login_screen.dart';
import 'package:football/services.dart/mongodb_service.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
  // Initialize MongoDB connection
  await MongoDBService.connect();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Football',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignupScreen(),
    );
  }
}
