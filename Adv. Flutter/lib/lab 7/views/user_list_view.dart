import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/lab%207/controllers/user_controller.dart';

class UserListView extends StatelessWidget {
  UserListView({super.key});

  UserController userController = Get.put(UserController());
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List View Page'),
        actions: [
          IconButton(onPressed: () {
            showModalSheet(context, false);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        return userController.list.isEmpty ? Center(child: Text("No User Found"),) : ListView.builder(
          itemCount: userController.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userController.list[index].name!),
              onTap: () {
                showModalSheet(context, true, idx: index);
              },
              trailing: Wrap(
                spacing: 8,
                children: [
                  IconButton(onPressed: () {
                    userController.toggleFavorite(index);
                  }, icon: Icon(userController.list[index].isFavorite! ? Icons.favorite: Icons.favorite_border)),
                  IconButton(onPressed: () {
                    userController.deleteUserFromList(index);
                  }, icon: Icon(Icons.delete)),
                ],
              ),
            );
          },
        );
      },)
    );
  }

  void showModalSheet(BuildContext context, bool isEditing, {int? idx}) {
    showModalBottomSheet(context: context, builder: (context) {
      if(isEditing) {
        nameController.text = userController.list[idx!].name!;
      }
      return Column(
        children: [
          TextField(controller: nameController,),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            if(isEditing) {
              userController.editUserInList(idx!, nameController.text, userController.list[idx].isFavorite!);
            }
            else {
              userController.addUserToList(nameController.text);
            }
            nameController.clear();
            Navigator.pop(context);
          }, child: Text("Save"))
        ],
      );
    },);
  }
}
