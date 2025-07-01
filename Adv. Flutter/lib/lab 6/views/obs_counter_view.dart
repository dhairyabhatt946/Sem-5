import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/obs_counter_controller.dart';

class ObsCounterView extends StatelessWidget {
  final controller = Get.put(ObsCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${controller.count}"),
            ElevatedButton(onPressed: controller.increment, child: Text('Increment')),
          ],
        )),
      ),
    );
  }
}
