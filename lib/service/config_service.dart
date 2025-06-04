import 'dart:convert';
import 'package:cv_project/data/personal_data.dart';
import 'package:flutter/services.dart';

class ConfigService {

  static Future<PersonalData> loadConfiguration() async {
    final String jsonString = await rootBundle.loadString('assets/data/main-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return PersonalData.fromJson(jsonResponse);
  }
}