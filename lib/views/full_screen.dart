import 'package:cv_project/models/personal_data.dart';
import 'package:cv_project/views/about_info.dart';
import 'package:cv_project/views/experience_info.dart';
import 'package:cv_project/views/main_info.dart';
import 'package:cv_project/views/skills_info.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

const avatarUrl =
    "https://hsto.org/getpro/moikrug/uploads/user/100/052/676/1/avatar/000117cb159cbe326b28ae495f61f705.jpg";

class FullScreenWidget {
  var titleTextStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  var titlePadding = const EdgeInsets.fromLTRB(50, 10, 0, 0);

  Widget fullScreenView(
    PersonalData dataPreview,
    double scale,
  ) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ResponsiveGridRow(children: buildLayout(dataPreview, scale)));
  }

  List<ResponsiveGridCol> buildLayout(PersonalData dataPreview, double scale) {
    var layout = <ResponsiveGridCol>[];
    layout.add(ResponsiveGridCol(
        md: 6,
        child: Image.network(
            width: 400,
            height: 400,
            alignment: Alignment.center,
            avatarUrl,
            colorBlendMode: BlendMode.darken)));
    layout.add(ResponsiveGridCol(
        md: 6, child: MainInfoAndContactsWidget().mainInfoWidget(dataPreview)));
    layout.add(ResponsiveGridCol(
        md: 12,
        child: Padding(
            padding: titlePadding,
            child: Text("About:", style: titleTextStyle))));
    layout.add(ResponsiveGridCol(
        md: 12, child: AboutInfo().buildAboutInfo(dataPreview.personalData)));
    layout.add(ResponsiveGridCol(
        md: 12,
        child: Padding(
            padding: titlePadding,
            child: Text("Skills:", style: titleTextStyle))));
    layout.add(ResponsiveGridCol(
        md: 12, child: SkillsInfo().buildSkillsInfo(dataPreview.skills)));
    layout.add(ResponsiveGridCol(
        md: 12,
        child: Padding(
            padding: titlePadding,
            child: Text("Experience:", style: titleTextStyle))));
    layout.add(ResponsiveGridCol(
        md: 12, child: ExperienceInfo().buildExperienceWidget(dataPreview.workExperience as List<WorkExperience>)));
    return layout;
  }
}
