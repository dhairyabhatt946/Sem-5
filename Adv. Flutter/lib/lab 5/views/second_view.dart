import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Back'),
        ),
      ),
    );
  }
}
