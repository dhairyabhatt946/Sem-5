import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(Page2(), transition: Transition.fadeIn),
          child: Text('Fade In to Page 2'),
        ),
      ),
    );
  }
}
