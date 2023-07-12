import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/screen/Authentication/SIgnup.dart';
import 'package:test/screen/home/home.dart';
import 'package:test/screen/Authentication/Authentication.dart';
import 'package:test/provider/fetchDataProvider.dart';
import 'package:test/sharepref/SharePref.dart';

import 'database/UserModel.dart';
import 'database/HiveProvider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // runApp(MaterialApp(
  //   home: TestApp(),
  // ));
  await Hive.initFlutter();
  await Hive.openBox('hive_local_db');
  runApp(MultiProvider(providers: [
    ListenableProvider<fetchDataProvider>(create: (_) => fetchDataProvider()),
    ListenableProvider<HiveProvider>(
        create: (_) => HiveProvider())
  ], child: const TestApp()));
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => HiveProvider(),
  //     create: (context) => fetchDataProvider(),
  //
  //     child: TestApp(),
  //   ),
  // );
}

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent
      ),
     home: homepresentationview()
    );
  }
}

