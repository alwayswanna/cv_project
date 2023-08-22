import 'package:flutter/material.dart';

class AboutInfo {
  var aboutPadding = const EdgeInsets.fromLTRB(30, 10, 30, 10);
  var fontStyle = const TextStyle(fontStyle: FontStyle.italic, fontSize: 15);

  Widget buildAboutInfo(String textAbout) {
    return Padding(
        padding: aboutPadding, child: Text(textAbout, style: fontStyle));
  }
}
