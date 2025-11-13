import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'widgets/big_button.dart';
import 'constants/app_bar.dart';
import 'screens/fhir_patient_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FREYA',
      theme: ThemeData(
        primaryColor: const Color(0xFFD2B7E5),
        scaffoldBackgroundColor: const Color.fromARGB(255, 251, 239, 248),
      ),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'FREYA'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Hey Gurl!',
              style: TextStyle(fontSize: 24),
            ),

            BigButton(
              text: 'FHIR Demo',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FhirPatientScreen()),
                );
              },
            ),

            const SizedBox(height: 24),

            BigButton(
              text: 'Login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),

            const SizedBox(height: 24),

            BigButton(
            text: 'Register',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
             },
           ),
          ],       
        ),
      ),
    );
  }
}