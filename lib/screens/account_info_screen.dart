import 'package:flutter/material.dart';
import 'package:freya/widgets/date_picker.dart';
import '../widgets/input_field.dart';
import '../widgets/section_title.dart';
import '../widgets/medication_card.dart';
import '../widgets/big_button.dart';
import '../constants/app_bar.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController accountInfoController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController cycleLengthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    accountInfoController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    cycleLengthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Account Info'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountInfoSection(),
            _buildLastPeriodSection(),
            _buildPersonalInfoSection(),
            _buildMedicationSection(),

            const SizedBox(height: 32),
            BigButton(text: "Save", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfoSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionTitle(title: "Account Info"),
      TextField(
        readOnly: true,
        controller: accountInfoController,
        decoration: InputDecoration(
          hintText: "-",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );

  Widget _buildLastPeriodSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionTitle(title: "Last Period"),
      DatePickerField(label: "Start Date", controller: startDateController),
      DatePickerField(label: "End Date", controller: endDateController),
      InputField(
        label: "Cycle Length",
        hint: "z. B. 28 days",
        controller: cycleLengthController,
      ),
    ],
  );

  Widget _buildPersonalInfoSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionTitle(title: "Personal Info"),
      InputField(
        label: "Height (cm)",
        hint: "z. B. 170",
        controller: heightController,
      ),
      InputField(
        label: "Weight (kg)",
        hint: "z. B. 60",
        controller: weightController,
      ),
    ],
  );

  Widget _buildMedicationSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      SectionTitle(title: "Medication"),
      MedicationCard(),
    ],
  );
}
