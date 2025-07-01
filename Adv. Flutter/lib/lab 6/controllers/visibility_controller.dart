import 'package:get/get.dart';

class VisibilityController extends GetxController {
  var isVisible = false.obs;

  void toggleVisibility() => isVisible.toggle();
}
