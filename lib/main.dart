import 'package:bigbotherproject68/views/login.dart';
import 'package:bigbotherproject68/views/toDoList.dart';
import 'package:bigbotherproject68/widgets/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "Flutter ToDo", home: LoginView(), debugShowCheckedModeBanner: false,);
  }
}
