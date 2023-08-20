import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../models/personal_data.dart';

class ExperienceInfo {
  var experienceInfoPadding = const EdgeInsets.fromLTRB(30, 20, 10, 10);
  var mainBackTextStyle = const TextStyle(
      color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic);
  var mainTextStyle = const TextStyle(color: Colors.black, fontSize: 15);

  Widget buildExperienceWidget(List<WorkExperience> workExperience) {
    return Padding(
        padding: experienceInfoPadding,
        child: ResponsiveGridRow(children: buildWidget(workExperience)));
  }

  List<ResponsiveGridCol> buildWidget(List<WorkExperience> workExperience) {
    var layout = <ResponsiveGridCol>[];
    layout.add(ResponsiveGridCol(
        md: 12,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                  md: 2, child: Text("Period", style: mainBackTextStyle)),
              ResponsiveGridCol(
                  md: 2, child: Text("Company", style: mainBackTextStyle)),
              ResponsiveGridCol(
                  md: 4, child: Text("Position", style: mainBackTextStyle)),
              ResponsiveGridCol(
                  md: 4, child: Text("Skills", style: mainBackTextStyle))
            ]))));
    for (var element in workExperience) {
      layout.add(ResponsiveGridCol(
          md: 12,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(md: 2, child: Text(element.period, style: mainTextStyle)),
              ResponsiveGridCol(md: 2, child: Text(element.company, style: mainTextStyle)),
              ResponsiveGridCol(md: 4, child: Text(element.job, style: mainTextStyle)),
              ResponsiveGridCol(md: 4, child: Text(element.skills, style: mainTextStyle))
            ]),
          )));
      layout.add(ResponsiveGridCol(
          md: 12,
          child: Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide.none, horizontal: BorderSide())),
          )));
    }
    return layout;
  }
}
