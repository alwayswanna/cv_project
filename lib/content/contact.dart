import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/personal_data.dart';

Widget buildContactsSection(PersonalData data) {
  return Container(
    constraints: const BoxConstraints(minHeight: 400),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contacts',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Contact me in any way convenient for you:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),
        _buildContactItem(Icons.email, 'Email', data.socialLinks.email,
            'mailto:${data.socialLinks.email}'),
        _buildContactItem(Icons.link, 'LinkedIn', data.socialLinks.linkedIn,
            'https://${data.socialLinks.linkedIn}'),
        _buildContactItem(Icons.code, 'GitHub', data.socialLinks.github,
            'https://${data.socialLinks.github}'),
        _buildContactItem(Icons.web, 'Habr', data.socialLinks.habrCareer,
            'https://${data.socialLinks.habrCareer}'),
        _buildContactItem(Icons.facebook, 'Facebook', data.socialLinks.facebook,
            'https://${data.socialLinks.facebook}')
      ],
    ),
  );
}

Widget _buildContactItem(
    IconData icon, String label, String value, String url) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        }
      },
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}