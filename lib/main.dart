import 'package:flutter/material.dart';
import 'package:ott_photo_play/view/login/login_view.dart';
import 'package:ott_photo_play/view/main_tab/main_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'OTT Photo Play',
      theme: ThemeData(
        fontFamily: "Gotham",
        useMaterial3: true,
      ),
      home:  MainTabView(),
    );
  }
}

