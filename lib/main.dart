import 'package:flutter/material.dart';
import 'package:freya/widgets/big_button.dart';
import 'constants/app_bar.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: const CustomAppBar(title: 'FREYA'),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Hey Gurl!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 70), 
              BigButton(text: 'Login'), 
              SizedBox(height: 24),
              BigButton(text: 'Register'),
            ],
          ), 
        ),
    ),
));

