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
  final List<String> responsibilities;

  WorkExperience(
      {required this.company,
      required this.period,
      required this.job,
      required this.responsibilities});

  WorkExperience.fromJson(Map<String, dynamic> json)
      : company = json['company'],
        period = json['period'],
        job = json['job'],
        responsibilities = List<String>.from(json['responsibilities']);
}

class SocialLinks {
  final String facebook;
  final String linkedIn;
  final String habrCareer;
  final String github;
  final String email;

  SocialLinks(
      {required this.facebook,
      required this.linkedIn,
      required this.habrCareer,
      required this.github,
      required this.email});

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
  final String position;
  final String birthDate;
  final String currentLocation;
  final String education;
  final String addition;
  final String photoLink;

  MainInfo(
      {required this.birthDate,
      required this.firstName,
      required this.lastName,
      required this.position,
      required this.currentLocation,
      required this.education,
      required this.addition,
      required this.photoLink});

  MainInfo.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        position = json['position'],
        birthDate = json['birthDate'],
        education = json['education'],
        currentLocation = json['currentLocation'],
        addition = json['addition'],
        photoLink = json['photoLink'];
}
