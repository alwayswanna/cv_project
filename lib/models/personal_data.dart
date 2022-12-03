class PersonalData {
  final String personalData;
  final String yearOfExperience;
  final Map<String, int> skills;
  final List<dynamic> workExperience;

  PersonalData({
        required this.personalData,
        required this.yearOfExperience,
        required this.skills,
        required this.workExperience
  });

  PersonalData.fromJson(Map<String, dynamic> json)
      : personalData = json['personal-data'],
        yearOfExperience = json['year-of-experience'],
        skills = Map.castFrom(json['skills']),
        workExperience = List<dynamic>.from(json['work-experience'])
            .map((key) => WorkExperience.fromJson(key))
            .toList();
}

class WorkExperience {
  final String company;
  final String responsibilities;
  final String period;
  final String job;
  final String skills;

  WorkExperience({
      required this.company,
      required this.responsibilities,
      required this.period,
      required this.job,
      required this.skills
  });

  WorkExperience.fromJson(Map<String, dynamic> json)
      : company = json['company'],
        responsibilities = json['responsibilities'],
        period = json['period'],
        job = json['job'],
        skills = json['skills'];
}
