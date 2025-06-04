import 'package:flutter/material.dart';
import '../data/personal_data.dart';

Widget buildExperienceSection(PersonalData data) {
  var experience = [
    const Text(
      'Experience',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 20),
  ];

  for(var point in data.workExperience) {
    experience.add(_buildExperienceItem(point.job, point.company, point.period, point.responsibilities));
    experience.add(const Divider(height: 40));
  }

  return Container(
    constraints: const BoxConstraints(minHeight: 600),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: experience,
    ),
  );
}

Widget _buildExperienceItem(
    String position, String company, String period, List<String> duties) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        position,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        company,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[600],
        ),
      ),
      const SizedBox(height: 5),
      Text(
        period,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[500],
          fontStyle: FontStyle.italic,
        ),
      ),
      const SizedBox(height: 10),
      ...duties.map((duty) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 4, right: 8),
              child: Icon(
                Icons.circle,
                size: 8,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Text(
                duty,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      )),
    ],
  );
}