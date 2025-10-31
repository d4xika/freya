import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/widgets/big_button.dart';
import '/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // InputField für Email
            InputField(
              label: 'Email:',
              hint: 'Enter your email address',
              controller: _emailController,
            ),

            // InputField für Password
            InputField(
              label: 'Password:',
              hint: 'Enter your password',
              controller: _passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 20),

            // BigButton Login
            BigButton(
              text: 'Login',
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
