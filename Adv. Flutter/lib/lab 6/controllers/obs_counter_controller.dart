import 'package:get/get.dart';

class ObsCounterController extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}
