import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bigbotherproject68/controllers/auth.dart';
import 'package:bigbotherproject68/widgets/app_text_field.dart';

class RegisterView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(label: 'Email', controller: emailController),
            AppTextField(label: 'Password', controller: passwordController, hideText: true),
            AppTextField(label: 'Confirm Password', controller: confirmPasswordController, hideText: true),
            ElevatedButton(
              onPressed: () {
                // validate email
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar('Error', 'อีเมล์ไม่ถูกต้อง!');
                  return;
                }
                // validate password
                if (passwordController.text.length < 6) {
                  Get.snackbar('Error', 'รหัสผ่านต้องยาวอย่างน้อย 6 ตัวอักษร');
                  return;
                }
                // validate confirm password
                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar('Error', 'รหัสผ่านไม่ตรงกัน');
                  return;
                }
                authController.register(emailController.text, passwordController.text);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}