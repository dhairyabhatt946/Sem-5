import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project1/utils/import_export.dart';

class SnackbarViewPage extends StatefulWidget {
  const SnackbarViewPage({super.key});

  @override
  State<SnackbarViewPage> createState() => _SnackbarViewPage();
}

class _SnackbarViewPage extends State<SnackbarViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snack bar View Page"),
      ),
      body: Center(
        child: ElevatedButton(child: Text("Click me"),
          onPressed: () {
            Get.showSnackbar(
              GetSnackBar(
                title: "This is title",
              message: "This a snack bar message",
              duration: Duration(seconds: 3),
            )
            );
          },
        ),
      ),
    );
  }
}