import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool hideText;

  const AppTextField({
    super.key, 
    required this.label, 
    required this.controller, 
    this.hideText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // ทำให้ widget ข้างในเรียงชิดด้านซ้าย
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        Text(label),
        SizedBox(height: 8),
        // input
        TextField(
          controller: controller,
          obscureText: hideText
        ),
        SizedBox(height: 16),
      ],
    );
  }
}