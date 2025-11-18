import 'package:flutter/material.dart';
import 'package:freya/constants/styles.dart';
import 'package:freya/widgets/article_list_item.dart';
import '/constants/colors.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  static const List<Map<String, String>> mockArticles = [
    {
      'title': 'Title 1',
      'summary': 'Summary of the first article',
    },
    {
      'title': 'Title 2',
      'summary': 'Summary of the second article',
    },
    {
      'title': 'Title 3',
      'summary': 'Summary of the third article',
    },
    {
      'title': 'Title 4',
      'summary': 'Summary of the fourth article',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: Text(
                'Insights',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                print("Navigate to 'Find help' screen");
              },
              icon: const Icon(Icons.medical_services_outlined, size: 24),
              label: Text(
                'Find help',
                style: AppTextStyles.buttonText,
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 3.0,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: mockArticles.length,
                itemBuilder: (context, index) {
                  final article = mockArticles[index];
                  return ArticleListItem(
                    title: article['title']!,
                    summary: article['summary']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
