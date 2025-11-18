import 'package:flutter/material.dart';
import 'package:freya/constants/styles.dart';
import '/constants/colors.dart';
import '/widgets/big_button.dart';
import '/widgets/input_field.dart';


class ArticleListItem extends StatelessWidget {
  final String title;
  final String summary;

  const ArticleListItem({
    super.key,
    required this.title,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5, 
      margin: const EdgeInsets.only(top: 16.0), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey.shade200, width: 1.0),
      ),
      child: InkWell( 
        onTap: () {
          //später dann dass man den gesamten Artikel öffnen kann
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                summary,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[700],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}