import 'package:flutter/material.dart';
import '../screens/tracking_overview_screen.dart';
import '../widgets/fitbit_auth_button.dart';
import '../constants/styles.dart';
import '../widgets/big_button.dart';
import '../screens/account_info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.grey.shade600,
              ),
              onPressed: () {

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const AccountInfoScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Hey Gurl!',
              style: AppTextStyles.appBarTitle,
            ),
            const SizedBox(height: 30),
            FitbitAuthButton(),

            const SizedBox(height: 50),

            BigButton(
              text: 'Tracking',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const TrackingOverviewScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}