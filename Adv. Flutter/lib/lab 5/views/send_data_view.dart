import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'receive_data_view.dart';

class SendDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(ReceiveDataView(), arguments: "Hello from First"),
          child: Text('Send Data'),
        ),
      ),
    );
  }
}
