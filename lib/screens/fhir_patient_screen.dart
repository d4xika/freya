import 'package:flutter/material.dart';
import 'package:fhir_r5/fhir_r5.dart';
import 'package:freya/constants/app_bar.dart'; 
import '/services/fhir_service.dart'; 

class FhirPatientScreen extends StatefulWidget {
  const FhirPatientScreen({super.key});

  @override
  State<FhirPatientScreen> createState() => _FhirPatientScreenState();
}

class _FhirPatientScreenState extends State<FhirPatientScreen> {
  late final FhirService _fhirService;

  bool _isLoading = true;
  List<Patient> _patients = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _fhirService = FhirService();
    _fetchPatients();
  }

  Future<void> _fetchPatients() async {
    try {
      final patients = await _fhirService.getPatientsByName('Katja');
      setState(() {
        _patients = patients;
        _isLoading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  String _getPatientName(Patient patient) {
    final name = patient.name?.firstOrNull;
    if (name == null) {
      return 'Unbekannter Name';
    }
    final given = name.given?.join(' ') ?? '';
    final family = name.family ?? '';
    return '$given $family'.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'FHIR Demo (Katja)'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Text(
          'Fehler beim Laden:\n$_error',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (_patients.isEmpty) {
      return Center(
        child: Text(
          'Keine Patienten mit dem Namen "Katja" gefunden.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: _patients.length,
      itemBuilder: (context, index) {
        final patient = _patients[index];
        final patientName = _getPatientName(patient);

        return ListTile(
          title: Text(patientName),
          subtitle: Text('ID: ${patient.id?.toString() ?? 'Keine ID'}'),
        );
      },
    );
  }
}