import 'package:flutter/material.dart';
import '/constants/colors.dart';
import '/widgets/big_button.dart';
import '/widgets/input_field.dart'; 
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Registration',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              // Name
              InputField(
                label: 'Name:',
                hint: 'Enter your name',
                controller: _nameController,
              ),

              // Email
              InputField(
                label: 'Email:',
                hint: 'Enter your email address',
                controller: _emailController,
              ),

              // Birthdate
              InputField(
                label: 'Birthdate:',
                hint: 'DD/MM/YYYY',
                controller: _birthdateController,
              ),

              // Password
              InputField(
                label: 'Password:',
                hint: 'Enter your password',
                controller: _passwordController,
                obscureText: true,
              ),

              // Confirm Password
              InputField(
                label: 'Confirm Password:',
                hint: 'Confirm your password',
                controller: _confirmPasswordController,
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // BigButton Register
              BigButton(
                text: 'Register',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );  
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
