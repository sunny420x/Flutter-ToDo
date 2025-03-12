import 'package:bigbotherproject68/controllers/auth.dart';
import 'package:bigbotherproject68/controllers/todo.dart';
import 'package:bigbotherproject68/models/todo.dart';
import 'package:bigbotherproject68/views/addToDo.dart';
import 'package:bigbotherproject68/views/login.dart';
import 'package:bigbotherproject68/widgets/todo_tile.dart';
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
    AuthController authController = Get.put(AuthController());

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'รายการสิ่งที่ต้องทำ | ToDo',
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
                    return TodoTile(
                    todo: todoController.todoList[index],
                    onToggle: () => todoController.toggleTodo(
                      todo.docId,
                      !todo.isDone,
                    ),
                    onDelete: () {
                      todoController.removeToDo(todo.docId);
                      Get.snackbar(
                        'ลบ Todo แล้ว!',
                        'ลบ "${todo.title}" สำเร็จ',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  );
                },
              )),
            ]);
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if(authController.user.value?.uid != null) {
                Get.to(AddToDoView()); 
              } else {
                Get.to(LoginView());
              }
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}
