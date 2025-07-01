import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'second_view.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(SecondView()),
          child: Text('Go to Second'),
        ),
      ),
    );
  }
}
