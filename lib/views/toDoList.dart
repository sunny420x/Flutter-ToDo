import 'package:bigbotherproject68/controllers/todo.dart';
import 'package:bigbotherproject68/models/todo.dart';
import 'package:bigbotherproject68/views/addToDo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const ToDoListView());
}

class ToDoListView extends StatelessWidget {
  const ToDoListView({super.key});

  @override
  Widget build(BuildContext context) {
    ToDoController todoController = Get.put(ToDoController());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add ToDo.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Obx(() {
            return Column(children: [
              Expanded(
                  child: ListView.builder(
                itemCount: todoController.todoList.length,
                itemBuilder: (context, index) {
                  ToDoModel todo = todoController.todoList[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    // leading: todo.isDone,
                    trailing:
                        IconButton(onPressed: () {todoController.removeToDo(index);}, icon: Icon(Icons.delete)),
                  );
                },
              )),
            ]);
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddToDoView());
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}
