import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:project1/utils/import_export.dart';

class BottomSheetViewPage extends StatefulWidget {
  const BottomSheetViewPage({super.key});

  @override
  State<BottomSheetViewPage> createState() => _BottomSheetViewPageState();
}

class _BottomSheetViewPageState extends State<BottomSheetViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet View Page"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Get.bottomSheet(
            enterBottomSheetDuration: Duration(seconds: 5),
            exitBottomSheetDuration: Duration(seconds: 5),
            BottomSheet(onClosing: () {

            }, builder: (context) {
              return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Item ${index + 1}"),
                      );
                    },
                  );
            },)
            
          ).then(
            (value) {
              Get.showSnackbar(
              GetSnackBar(
                title: "This is title",
              message: "This a snackbar message",
              duration: Duration(seconds: 3),
            )
            );
            },
          );
        }, child: Text("Click me")),
      ),
    );
  }
}