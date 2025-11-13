import 'package:flutter/foundation.dart';
import 'package:fitbitter/fitbitter.dart';

class FitbitService extends ChangeNotifier {
  
  static const String _fitbitClientID = '23TPCG';
  static const String _fitbitClientSecret = 'e6856fd92b790928c93b2b1f82d45897';

  static const String _redirectUri = 'freya://auth';
  static const String _callbackUrlScheme = 'freya';

  String _logMessage = 'Noch nicht verbunden.';
  String _steps = '...';
  bool _isLoading = false;

  String get logMessage => _logMessage;
  String get steps => _steps;
  bool get isLoading => _isLoading;

  Future<void> authorizeAndFetch() async {
    if (_isLoading) return;

    _isLoading = true;
    _logMessage = 'Autorisierung wird geprüft...';
    notifyListeners();

    try {
      FitbitCredentials? credentials = await FitbitConnector.authorize(
        clientID: _fitbitClientID,
        clientSecret: _fitbitClientSecret,
        redirectUri: _redirectUri,
        callbackUrlScheme: _callbackUrlScheme,
      );

      if (credentials != null) {
        _logMessage = 'Erfolgreich autorisiert. Rufe Schritte ab...';
        notifyListeners();

        FitbitActivityTimeseriesDataManager activityManager =
            FitbitActivityTimeseriesDataManager(
          clientID: _fitbitClientID,
          clientSecret: _fitbitClientSecret,
        );

        final url = FitbitActivityTimeseriesAPIURL.dayWithResource(
          date: DateTime.now(),
          fitbitCredentials: credentials, 
          
          resource: Resource.steps, 
        );

        final stepsData = await activityManager.fetch(url)
            as List<FitbitActivityTimeseriesData>;

        if (stepsData.isNotEmpty) {
          _steps = stepsData.first.value?.toString() ?? 'k.A.';
          _logMessage = 'Daten erfolgreich abgerufen.';
        } else {
          _logMessage = 'Keine Schrittdaten für heute gefunden.';
          _steps = '0';
        }
      } else {
        _logMessage = 'Autorisierung fehlgeschlagen oder abgebrochen.';
        _steps = '...';
      }
    } catch (e) {
      _logMessage = 'Fehler: ${e.toString()}';
      _steps = 'Fehler';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}