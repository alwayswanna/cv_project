class PersonalData {
  final String personalData;
  final Map<String, int> skills;
  final List<dynamic> workExperience;
  final SocialLinks socialLinks;
  final MainInfo mainInfo;

  PersonalData(
      {required this.personalData,
      required this.skills,
      required this.workExperience,
      required this.socialLinks,
      required this.mainInfo});

  PersonalData.fromJson(Map<String, dynamic> json)
      : personalData = json['personal-data'],
        skills = Map.castFrom(json['skills']),
        mainInfo = MainInfo.fromJson(json['mainInfo']),
        socialLinks = SocialLinks.fromJson(json['social-links']),
        workExperience = List<dynamic>.from(json['work-experience'])
            .map((key) => WorkExperience.fromJson(key))
            .toList();
}

class WorkExperience {
  final String company;
  final String period;
  final String job;
  final String skills;

  WorkExperience(
      {required this.company,
      required this.period,
      required this.job,
      required this.skills});

  WorkExperience.fromJson(Map<String, dynamic> json)
      : company = json['company'],
        period = json['period'],
        job = json['job'],
        skills = json['skills'];
}

class SocialLinks {
  final String facebook;
  final String linkedIn;
  final String habrCareer;
  final String github;
  final String email;

  SocialLinks({
    required this.facebook,
    required this.linkedIn,
    required this.habrCareer,
    required this.github,
    required this.email
  });

  SocialLinks.fromJson(Map<String, dynamic> json)
      : facebook = json['facebook'],
        linkedIn = json['linkedIn'],
        habrCareer = json['habrCareer'],
        github = json['github'],
        email = json['email'];
}

class MainInfo {
  final String firstName;
  final String lastName;
  final String birthDate;
  final String currentLocation;
  final String experience;
  final String addition;

  MainInfo(
      {required this.birthDate,
      required this.firstName,
      required this.lastName,
      required this.currentLocation,
      required this.experience,
      required this.addition});

  MainInfo.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        birthDate = json['birthDate'],
        currentLocation = json['currentLocation'],
        experience = json['experience'],
        addition = json['addition'];
}
