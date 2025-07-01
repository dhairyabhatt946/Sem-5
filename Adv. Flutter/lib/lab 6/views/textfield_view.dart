import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/textfield_controller.dart';

class TextFieldView extends StatelessWidget {
  final controller = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.name.value = value,
            ),
            Obx(() => Text("Typed: ${controller.name}"))
          ],
        ),
      ),
    );
  }
}
