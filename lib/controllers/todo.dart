import 'package:bigbotherproject68/controllers/auth.dart';
import 'package:bigbotherproject68/models/todo.dart';
import 'package:bigbotherproject68/services/storage_service.dart';
import 'package:bigbotherproject68/core/constants.dart';
import 'package:get/get.dart';

class ToDoController extends GetxController {
  var todoList = <ToDoModel>[].obs;
  StorageService storageService = StorageService();
  AuthController authController = Get.put(AuthController());

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchTodos();
  }

  Future<void> addToDo(String title, String description) async {
    try {
      String? uid = authController.user.value?.uid;
      if(uid == null) {
        print("โปรดเข้าสู่ระบบก่อนเพื่อดำเนินการต่อ"); 
        return;
      }

      ToDoModel newTodo = ToDoModel(uid: uid, title: title, description: description);
      String docId = await storageService.write(
        AppKey.todoList, 
        newTodo.toJSON(),
      );
      newTodo.docId = docId;
      todoList.add(newTodo);
      todoList.refresh();
    } catch (e) {
      print("ToDo Controller Error on addToDo: $e");
    }
  }

  Future<void> removeToDo(String docId) async {
    try {
      await storageService.delete(AppKey.todoList, docId);
      todoList.removeWhere((e) => e.docId == docId);
      todoList.refresh();
    } catch (e) {
      print("ToDo Controller Error on removeToDo: $e");
    }
  }

  Future<void> toggleTodo(String docId, bool isDone) async {
    try {
      ToDoModel todo = todoList.firstWhere((e) => e.docId == docId);
      todo.isDone = isDone;
      await storageService.update(AppKey.todoList, docId, todo.toJSON());
      todoList.refresh();
    } catch (e) {
      print("ToDo Controller Error on toggleTodo: $e");
    }
  }

  Future<void> fetchTodos() async {
    var todos = await storageService.read(AppKey.todoList, uid: authController.user.value?.uid);
    todoList.value = todos.map((e) => ToDoModel.fromJSON(e)).toList();
  }
}
