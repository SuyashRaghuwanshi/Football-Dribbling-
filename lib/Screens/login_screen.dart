import 'package:flutter/material.dart';
import 'package:football/Screens/homepage.dart';
import 'package:football/constants/colors.dart';
import 'package:football/services.dart/mongodb_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and Password cannot be empty")),
      );
      return;
    }
    try {
      final existingUser =
          await MongoDBService.usersCollection.findOne({'email': email});
      if (existingUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email already exists")),
        );
        return;
      }
      final result = await MongoDBService.usersCollection.insertOne({
        'email': email,
        'password': password,
      });
      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup successful!")),
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Homepage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Failed to sign up: ${result.writeError?.errmsg}")),
        );
      }
    } catch (e) {
      print("Error during signup: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred during signup")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: AppColor.gradientFirst,
        title: Text(
          'Signup',
          style: TextStyle(color: AppColor.secondPageTitleColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColor.homePageIcons),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gradientSecond),
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: AppColor.homePageIcons),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gradientSecond),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.gradientFirst,
                foregroundColor: AppColor.homePageContainerTextBig,
              ),
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
