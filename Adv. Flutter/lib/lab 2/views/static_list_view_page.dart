import '../../utils/import_export.dart';

class StaticListViewPage extends StatefulWidget {
  const StaticListViewPage({super.key});

  @override
  State<StaticListViewPage> createState() => _StaticListViewPageState();
}

class _StaticListViewPageState extends State<StaticListViewPage> {
  StaticListController controller = StaticListController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Page'),
      ),
      body: controller.list.isEmpty? Center(child: Text('No User Found'),)
      : Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
          itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              nameController.text = controller.list[index][NAME];
              showBottomSheet(true, index: index, map: controller.list[index]);
            },
            title: Text(controller.list[index][NAME]),
            trailing: SizedBox(
              width: 96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {
                    controller.toggleFavoriteUser(index);
                    setState(() {

                    });
                  },
                      icon: Icon(controller.list[index][IS_FAVORITE] ? Icons.favorite : Icons.favorite_border)),
                  IconButton(onPressed: () {
                    controller.deleteUserFromList(index);
                    setState(() {

                    });
                  }, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showBottomSheet(false);
      }, child: Icon(Icons.add),),
    );
  }
  
  Widget? showBottomSheet(bool isEditing, {index, map}) {
    showModalBottomSheet(context: context, builder: (context) {
      return Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              if(isEditing) {
                map[NAME] = nameController.text;
                controller.editUserInList(index, map);
              }
              else {
                Map<String, dynamic> map = {};
                map[NAME] = nameController.text.toString();
                map[IS_FAVORITE] = false;
                controller.addUserToList(map);
              }
              Navigator.pop(context);
              nameController.clear();
              setState(() {

              });
            }, child: Text('Save'))
          ],
        ),
      );
    },);
  }
}
