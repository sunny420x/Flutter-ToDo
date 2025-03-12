import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bigbotherproject68/controllers/auth.dart';
import 'package:bigbotherproject68/views/register.dart';
import 'package:bigbotherproject68/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(label: 'Email', controller: emailController),
            AppTextField(label: 'Password', controller: passwordController, hideText: true),
            ElevatedButton(
              onPressed: () async {
                // validate email
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar('Error', 'อีเมล์ไม่ถูกต้อง');
                  return;
                }
                // validate password
                if (passwordController.text.length < 6) {
                  Get.snackbar(
                    'Error',
                    'รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร',
                  );
                  return;
                }
                await authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(RegisterView());
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}