class PersonalData {
  final String personalData;
  final String yearOfExperience;
  final Map<String, int> skills;
  final List<dynamic> workExperience;
  final SocialLinks socialLinks;

  PersonalData({
        required this.personalData,
        required this.yearOfExperience,
        required this.skills,
        required this.workExperience,
        required this.socialLinks
  });

  PersonalData.fromJson(Map<String, dynamic> json)
      : personalData = json['personal-data'],
        yearOfExperience = json['year-of-experience'],
        skills = Map.castFrom(json['skills']),
        socialLinks = SocialLinks.fromJson(json['social-links']),
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

class SocialLinks {
  final String facebook;
  final String linkedIn;
  final String habrCareer;

  SocialLinks({
    required this.facebook,
    required this.linkedIn,
    required this.habrCareer,
  });

  SocialLinks.fromJson(Map<String, dynamic> json)
      : facebook = json['facebook'],
        linkedIn = json['linkedIn'],
        habrCareer = json['habrCareer'];
}
