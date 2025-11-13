import 'package:flutter/material.dart';
import '../widgets/fitbit_auth_button.dart'; 
import '../constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              'Hey Gurl!',
              style: AppTextStyles.appBarTitle,
            ),
            SizedBox(height: 30),
            FitbitAuthButton(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
