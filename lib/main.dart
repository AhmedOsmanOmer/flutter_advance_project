import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/core/di/dependency_injection.dart';
import 'package:flutter_advance/core/routing/app_router.dart';
import 'package:flutter_advance/doc_app.dart';
import 'firebase_options.dart';
void main() async{
  setupGetIt();
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
