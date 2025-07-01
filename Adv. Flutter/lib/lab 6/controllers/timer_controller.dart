import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var seconds = 10.obs;

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        timer.cancel();
      }
    });
  }
}
