import 'package:bigbotherproject68/views/toDoList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "Flutter ToDo", home: ToDoListView(), debugShowCheckedModeBanner: false,);
  }
}
