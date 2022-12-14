import 'dart:convert';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:cv_project/models/personal_data.dart';
import 'package:cv_project/views/fullscreen.dart';
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
      home: const MyHomePage(title: 'Abakshin Gleb', job: 'Java Developer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.job});

  final String title;
  final String job;

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
            preferredSize: const Size.fromHeight(120.0),
            child: AppBar(
              backgroundColor: Colors.black,
              toolbarHeight: 120.0,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(),
              centerTitle: true,
              elevation: 0,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: "Inconsolata",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.job,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Inconsolata",
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return AnimateGradient(
                  primaryBegin: Alignment.topLeft,
                  primaryEnd: Alignment.bottomLeft,
                  secondaryBegin: Alignment.bottomLeft,
                  secondaryEnd: Alignment.topRight,
                  primaryColors: const [
                    Colors.green,
                    Colors.greenAccent,
                    Colors.white,
                  ],
                  secondaryColors: const [
                    Colors.white,
                    Colors.blueAccent,
                    Colors.blue,
                  ],
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/data/main-data.json'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        } else {
                          return FullScreenWidget()
                              .fullScreenView(context, PersonalData.fromJson(jsonDecode(snapshot.data!)), 1.0);
                        }
                      }));
            } else {
              return AnimateGradient(
                  primaryBegin: Alignment.topLeft,
                  primaryEnd: Alignment.bottomLeft,
                  secondaryBegin: Alignment.bottomLeft,
                  secondaryEnd: Alignment.topRight,
                  primaryColors: const [
                    Colors.green,
                    Colors.greenAccent,
                    Colors.white,
                  ],
                  secondaryColors: const [
                    Colors.white,
                    Colors.blueAccent,
                    Colors.blue,
                  ],
                  child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/data/main-data.json'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        } else {
                          return FullScreenWidget()
                              .fullScreenView(context, PersonalData.fromJson(jsonDecode(snapshot.data!)), 0.5);
                        }
                      }));
            }
          },
        )));
  }
}
