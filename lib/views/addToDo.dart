import 'package:bigbotherproject68/controllers/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const AddToDoView());
}

class AddToDoView extends StatelessWidget {
  const AddToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    ToDoController todoController = Get.put(ToDoController());
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'เพิ่มสิ่งที่ต้องทำ | Add ToDo',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
              child: Padding(padding: EdgeInsets.all(10), child: Column(children: [
              Text("หัวข้อ:"),
              TextField(controller: titleController),
              Padding(padding: EdgeInsets.all(10), child: 
              Column(children: [
                Text("เนื้อหา:"),
                TextField(controller: subtitleController),
              ])),
              Padding(padding: EdgeInsets.all(10), child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) return;
                  todoController.addToDo(
                    titleController.text,
                    subtitleController.text,
                  );
                  Get.back();
                },
                child: Text("เพิ่มสิ่งที่ต้องทำ"),
              ))
            ],
          )))),
    );
  }
}
