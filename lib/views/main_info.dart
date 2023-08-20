import 'package:cv_project/models/personal_data.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainInfoAndContactsWidget {
  var mainBackTextStyle = const TextStyle(
      color: Colors.grey, fontSize: 15, fontStyle: FontStyle.italic);
  var mainTextStyle = const TextStyle(color: Colors.black, fontSize: 15);
  var titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
  var paddingMainText = const EdgeInsets.fromLTRB(0, 0, 0, 5);

  Widget mainInfoWidget(PersonalData personalData) {
    return ResponsiveGridRow(children: buildMainInfoData(personalData));
  }

  List<ResponsiveGridCol> buildMainInfoData(PersonalData personalData) {
    var layout = <ResponsiveGridCol>[];
    addToLayoutMainInfo(layout, personalData.mainInfo);

    layout.add(ResponsiveGridCol(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(100, 20, 100, 10),
      child: Text("Contacts:", style: titleTextStyle),
    )));

    addToLayoutContactsInfo(layout, personalData.socialLinks);

    return layout;
  }

  void addToLayoutMainInfo(List<ResponsiveGridCol> layout, MainInfo mainInfo) {
    addToLayout(layout, buildValue("Name:", mainInfo.firstName));
    addToLayout(layout, buildValue("Last name:", mainInfo.lastName));
    var birthDate = mainInfo.birthDate;
    addToLayout(layout, buildValue("Birth date:", birthDate));
    var date =
        DateTime.now().difference(DateTime.parse(birthDate)).inDays ~/ 365;
    addToLayout(layout, buildValue("Age:", date.toString()));
    addToLayout(
        layout, buildValue("Current location", mainInfo.currentLocation));
    var experience =
        (DateTime.now().difference(DateTime.parse(mainInfo.experience)).inDays /
                365)
            .toStringAsFixed(1);
    addToLayout(layout, buildValue("Experience:", "$experience -years"));
    addToLayout(layout, buildValue("Addition:", mainInfo.addition));
  }

  void addToLayoutContactsInfo(
      List<ResponsiveGridCol> layout, SocialLinks contactInfo) {
    addToLayoutWithImage(
        layout, 'assets/images/habr.png', contactInfo.habrCareer);
    addToLayoutWithImage(
        layout, 'assets/images/linkedin.png', contactInfo.linkedIn);
    addToLayoutWithImage(
        layout, 'assets/images/facebook.png', contactInfo.facebook);
    addToLayoutWithImage(
        layout, 'assets/images/github.png', contactInfo.github);
    addToLayoutWithImage(layout, 'assets/images/email.png', contactInfo.email);
  }

  MapEntry<Padding, Padding> buildValue(String key, String value) {
    return MapEntry(
        Padding(
            padding: paddingMainText,
            child: Text(key, style: mainBackTextStyle)),
        Padding(
            padding: paddingMainText,
            child: Text(value, style: mainTextStyle)));
  }

  void addToLayout(
      List<ResponsiveGridCol> layout, MapEntry<Padding, Padding> toAdd) {
    layout.add(ResponsiveGridCol(md: 6, child: toAdd.key));
    layout.add(ResponsiveGridCol(md: 6, child: toAdd.value));
  }

  void addToLayoutWithImage(
      List<ResponsiveGridCol> layout, String iconPath, String data) {
    layout.add(ResponsiveGridCol(
        md: 2,
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: paddingMainText,
                child: Image.asset(
                  iconPath,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.scaleDown,
                )))));
    layout.add(ResponsiveGridCol(
        md: 10,
        child: Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
                onTap: () => launchUrlString(data),
                child: Padding(
                    padding: paddingMainText,
                    child: Text(data, style: mainTextStyle))))));
  }
}
