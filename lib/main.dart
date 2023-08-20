import 'dart:convert';

import 'package:cv_project/models/personal_data.dart';
import 'package:cv_project/views/full_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  PersonalData? previewData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: AppBar(
              backgroundColor: Colors.indigo,
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0,
            )),
        body: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                      horizontal: BorderSide.none)),
              child: SizedBox(
                  width: 800,
                  height: 1200,
                  child: SingleChildScrollView(child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > 600) {
                      return FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/data/main-data.json'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return FullScreenWidget().fullScreenView(
                                  PersonalData.fromJson(
                                      jsonDecode(snapshot.data!)),
                                  1.0);
                            }
                          });
                    } else {
                      return FutureBuilder(
                          future: DefaultAssetBundle.of(context)
                              .loadString('assets/data/main-data.json'),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else {
                              return FullScreenWidget().fullScreenView(
                                  PersonalData.fromJson(
                                      jsonDecode(snapshot.data!)),
                                  0.5);
                            }
                          });
                    }
                  }))),
            )));
  }
}
