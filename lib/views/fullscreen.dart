import 'package:cv_project/models/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class FullScreenWidget {
  Widget fullScreenView(
    BuildContext context,
    PersonalData dataPreview,
    double scale,
  ) {
    return ResponsiveGridRow(children: buildLayout(dataPreview, scale));
  }

  List<ResponsiveGridCol> buildLayout(PersonalData dataPreview, double scale) {
    var layout = <ResponsiveGridCol>[];
    layout.add(ResponsiveGridCol(
      xl: 12,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
          child: Text(
            'About:',
            style: TextStyle(
                color: Colors.black,
                fontSize: 50 * scale,
                fontFamily: "Inconsolata"),
          )),
    ));
    layout.add(
      ResponsiveGridCol(
          md: 6,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
              child: Text(dataPreview.personalData,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30 * scale,
                      fontFamily: "Inconsolata")))),
    );
    layout.add(
      ResponsiveGridCol(
          md: 6,
          child: Image.network(
              width: 400,
              height: 400,
              alignment: Alignment.topCenter,
              "https://avatars.githubusercontent.com/u/62200674?v=4",
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              colorBlendMode: BlendMode.modulate)),
    );
    layout.add(ResponsiveGridCol(
      xl: 12,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
          child: Text(
            'Skills:',
            style: TextStyle(
                color: Colors.black,
                fontSize: 50 * scale,
                fontFamily: "Inconsolata"),
          )),
    ));
    for (var skill in dataPreview.skills.entries) {
      layout.add(ResponsiveGridCol(
          md: 12,
          lg: 6,
          child: buildProfessionalSkills(skill.key, skill.value, scale)));
    }

    layout.add(ResponsiveGridCol(
      xl: 12,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 10, 10),
          child: Text(
            'Work experience:',
            style: TextStyle(
                color: Colors.black,
                fontSize: 50 * scale,
                fontFamily: "Inconsolata"),
          )),
    ));

    for (var experience in dataPreview.workExperience) {
      layout.add(ResponsiveGridCol(
          md: 12, xs: 12, child: buildExperience(experience, scale)));
    }

    layout.add(ResponsiveGridCol(
        child: const Padding(padding: EdgeInsets.fromLTRB(30, 20, 10, 10))));

    return layout;
  }

  Widget buildProfessionalSkills(String skillName, int count, double scale) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            child: Column(
              children: [
                Text(
                  skillName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30 * scale,
                      fontFamily: "Inconsolata"),
                )
              ],
            )),
        Column(
          children: [
            Icon(Icons.star, size: 30 * scale, color: generateColor(0, count))
          ],
        ),
        Column(
          children: [
            Icon(Icons.star, size: 30 * scale, color: generateColor(1, count))
          ],
        ),
        Column(
          children: [
            Icon(Icons.star, size: 30 * scale, color: generateColor(2, count))
          ],
        ),
        Column(
          children: [
            Icon(Icons.star, size: 30 * scale, color: generateColor(3, count))
          ],
        ),
        Column(
          children: [
            Icon(Icons.star, size: 30 * scale, color: generateColor(4, count))
          ],
        )
      ],
    );
  }

  Widget buildExperience(WorkExperience workExperience, double scale) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
        child: Table(border: TableBorder.all(color: Colors.black), children: [
          TableRow(
            children: [
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Center(
                    child: Text(
                      workExperience.period,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30 * scale,
                          fontFamily: "Inconsolata"),
                    ),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    workExperience.company,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30 * scale,
                        fontFamily: "Inconsolata"),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    workExperience.responsibilities,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30 * scale,
                        fontFamily: "Inconsolata"),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    workExperience.skills,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30 * scale,
                        fontFamily: "Inconsolata"),
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    workExperience.job,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30 * scale,
                        fontFamily: "Inconsolata"),
                  ))
            ],
          )
        ]));
  }

  Color generateColor(int position, int count) {
    return position < count ? Colors.black : Colors.greenAccent;
  }
}
