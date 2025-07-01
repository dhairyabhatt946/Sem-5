import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/visibility_controller.dart';

class VisibilityView extends StatelessWidget {
  final controller = Get.put(VisibilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: controller.isVisible.value,
              child: Text("Hello, I’m visible!"),
            ),
            ElevatedButton(
              onPressed: controller.toggleVisibility,
              child: Text("Toggle"),
            ),
          ],
        )),
      ),
    );
  }
}
