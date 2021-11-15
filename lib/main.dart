import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/app.dart';
import 'package:flutter_for_web_no_easy_way/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locator.init();
  runApp(const FlutterForWebApp());
}
