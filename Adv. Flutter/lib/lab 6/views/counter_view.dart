import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CounterController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Count: ${controller.count}"),
              ElevatedButton(onPressed: () => controller.increment(), child: Text('Increment'))
            ],
          ),
        );
      },),
    );
  }
}
