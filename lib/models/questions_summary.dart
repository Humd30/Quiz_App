import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView (
        child: Column(
          children: summaryData.asMap().entries.map((entry) {
            final index = entry.key; // Correct sequential numbering
            final data = entry.value;
        
            return Row(
              children: [
                Text((index + 1).toString()), // Now displays 1,2,3,4 correctly
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'].toString()),
                      const SizedBox(height: 5),
                      Text(data['user_answer'].toString()),
                      Text(data['user_answer'].toString()),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}