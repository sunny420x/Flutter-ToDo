import 'package:bigbotherproject68/views/toDoList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar('สมัครสมาชิกสำเร็จ', 'ท่านสามารถเข้าสู่ระบบโดยใช้อีเมล์และรหัสผ่านนี้ได้เลย!');
    } catch (e) {
      Get.snackbar("ไม่สามารถสมัครสมาชิกได้!", e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('เข้าสู่ระบบสำเร็จ!', '');
      Get.offAll(ToDoListView());
    } catch (e) {
      Get.snackbar("ไม่สามารถเข้าสู่ระบบได้", e.toString());
    }
  }
}