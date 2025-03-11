import 'package:bigbotherproject68/models/todo.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  var todoList = <ToDoModel>[].obs;

  void addToDo(String title, String description) {
    todoList.add(ToDoModel(title: title, description: description));
  }

  void removeToDo(int index) {
    todoList.removeAt(index);
  }

  void toggleTodo(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    todoList.refresh();
  }
}
