import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recogenie_task/core/di/di.dart';
import 'package:recogenie_task/firebase_options.dart';
import 'package:recogenie_task/my_app.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
