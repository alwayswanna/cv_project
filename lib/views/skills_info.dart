import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SkillsInfo {
  var skillsPadding = const EdgeInsets.fromLTRB(30, 10, 30, 10);

  Widget buildSkillsInfo(Map<String, int> skills) {
    var responsiveGridColl = <ResponsiveGridCol>[];
    skills.forEach((key, value) {
      buildSkill(responsiveGridColl, key, value);
    });

    return Padding(
        padding: skillsPadding,
        child: ResponsiveGridRow(children: responsiveGridColl));
  }

  void buildSkill(List<ResponsiveGridCol> layout, String skillName, int mark) {
    layout.add(ResponsiveGridCol(
        md: 6,
        child: Row(
          children: [
            Icon(Icons.star, color: getColor(mark, 1)),
            Icon(Icons.star, color: getColor(mark, 2)),
            Icon(Icons.star, color: getColor(mark, 3)),
            Icon(Icons.star, color: getColor(mark, 4)),
            Icon(Icons.star, color: getColor(mark, 5)),
            Text(skillName)
          ],
        )));
  }

  Color getColor(int mark, int index){
    return mark >= index ? Colors.black : Colors.indigo;
  }
}
