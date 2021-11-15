import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/screens/cameras_screen.dart';

class FlutterForWebApp extends StatelessWidget {
  const FlutterForWebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (_) => const CamerasScreen(),
      },
    );
  }
}
