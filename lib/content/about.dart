import 'package:cv_project/data/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildAboutSection(PersonalData data) {
  return Container(
    constraints: const BoxConstraints(minHeight: 600),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                data.mainInfo.photoLink,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.mainInfo.lastName} ${data.mainInfo.firstName}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data.mainInfo.position,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data.personalData,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildInfoChip(Icons.cake, 'Date of birth: ${data.mainInfo.birthDate}'),
                      _buildInfoChip(Icons.location_on, 'Location: ${data.mainInfo.currentLocation}'),
                      _buildInfoChip(Icons.school, 'Education: ${data.mainInfo.education}'),
                      _buildInfoChip(Icons.info_outline, 'Addition: ${data.mainInfo.addition}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildInfoChip(IconData icon, String text) {
  return Chip(
    avatar: Icon(icon, size: 18),
    label: Text(text),
    backgroundColor: Colors.blue[50],
  );
}
