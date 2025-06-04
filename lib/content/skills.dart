import 'package:flutter/material.dart';

import '../data/personal_data.dart';

Widget buildSkillsSection(PersonalData data) {
  List<Widget> skills = <Widget>[];

  data.skills.forEach((key, val) {
    skills.add(_buildSkillCard(key, val));
  });

  return Container(
    constraints: const BoxConstraints(minHeight: 600),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'My professional skills and technologies that I use in my work:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills,
        ),
      ],
    ),
  );
}

Widget _buildSkillCard(String skill, int percent) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            skill,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percent / 100,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue[400]!),
                ),
                Center(
                  child: Text(
                    '$percent%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
