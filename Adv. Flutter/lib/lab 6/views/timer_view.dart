import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/timer_controller.dart';

class TimerView extends StatelessWidget {
  final controller = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time Left: ${controller.seconds}"),
            ElevatedButton(onPressed: controller.startTimer, child: Text("Start")),
          ],
        )),
      ),
    );
  }
}
