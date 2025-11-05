import 'package:fhir_r5/fhir_r5.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FhirService {
  final String _baseUrl = 'https://hapi.fhir.org/baseR5';

  Future<List<Patient>> getPatientsByName(String name) async {
    final uri = Uri.parse('$_baseUrl/Patient?name=$name&_format=json');

    try {
      final resp = await http.Client().get(uri).timeout(
        const Duration(seconds: 10),
      );

      if (resp.statusCode == 200) {
        final jsonMap = jsonDecode(resp.body) as Map<String, dynamic>;

        final resource = Bundle.fromJson(jsonMap);

        final List<Patient> patients = [];

        if (resource.entry != null) {
          for (var entry in resource.entry!) {
            if (entry.resource is Patient) {
              patients.add(entry.resource as Patient);
            }
          }
        }
        
        return patients;
        
      } else {
        throw Exception('Fehler beim Laden der Patienten: ${resp.statusCode}');
      }
    } catch (e) {
      throw Exception('Netzwerkfehler: $e');
    }
  }
}