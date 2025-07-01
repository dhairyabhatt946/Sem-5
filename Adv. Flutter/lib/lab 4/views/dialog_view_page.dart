import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1/utils/import_export.dart';

class DialogViewPage extends StatefulWidget {
  const DialogViewPage({super.key});

  @override
  State<DialogViewPage> createState() => _DialogViewPageState();
}

class _DialogViewPageState extends State<DialogViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog View Page'),
      ),
      body: Center(
        child: ElevatedButton(child: Text("Click to open Dialog Box"),
          onPressed: () {
            Get.defaultDialog(
              title: 'Alert!!',
              middleText: 'This is an alert message',
              onConfirm: () {
                Get.back();
              },
              onCancel: () {
                Get.back();
              },
            );
          },
        ),
      ),
    );
  }
}
