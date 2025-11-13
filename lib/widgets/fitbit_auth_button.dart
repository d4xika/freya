import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/fitbit_service.dart';
import 'big_button.dart';                  

class FitbitAuthButton extends StatelessWidget {
  const FitbitAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FitbitService(),
      
      child: Consumer<FitbitService>(
        builder: (context, fitbitService, child) {
          
          return Column(
            children: [
              BigButton(
                text: fitbitService.isLoading
                    ? 'Verbinde...'
                    : 'Fitbit verbinden',
                
                onPressed: fitbitService.isLoading
                    ? null 
                    : () {
                        fitbitService.authorizeAndFetch();
                      },
              ),

              const SizedBox(height: 20),

              if (fitbitService.isLoading)
                const CircularProgressIndicator()
              else
                Column(
                  children: [
                    Text(
                      fitbitService.logMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    if (fitbitService.steps != '...' && fitbitService.steps != 'Fehler')
                      Text(
                        'Schritte heute: ${fitbitService.steps}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}