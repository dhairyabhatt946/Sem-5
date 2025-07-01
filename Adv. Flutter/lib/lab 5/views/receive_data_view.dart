import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return Scaffold(
      body: Center(
        child: Text('$data'),
      ),
    );
  }
}
