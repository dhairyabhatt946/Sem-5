import 'package:flutter/material.dart';
import 'package:project1/lab%203/controllers/user_controller.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  UserController _controller = UserController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List View Page'),
        actions: [
          IconButton(onPressed: () {
            showSheet(isEditing: false);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: _controller.list.isEmpty ? Center(child: Text('No User Found'),) :
      ListView.builder(
        itemCount: _controller.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showSheet(isEditing: true, index: index);
            },
            title: Text(_controller.list[index]),
            trailing: IconButton(onPressed: () {
              _controller.deleteUserFromList(index);
              setState(() {

              });
            }, icon: Icon(Icons.delete)),
          );
        },
      ),
    );
  }

  void showSheet({required bool isEditing, int? index}) {
    if(isEditing) {
      _nameController.text = _controller.list[index!];
    }
    showModalBottomSheet(context: context, builder: (context) {
      return Column(
        children: [
          TextFormField(
            controller: _nameController,
            validator: (value) => _controller.nameValidator(value),
          ),
          ElevatedButton(onPressed: () {
            if(isEditing) {
              _controller.editUserInList(index!, _nameController.text);
            }
            else {
              _controller.addUserToList(_nameController.text);
            }
            _nameController.clear();
            Navigator.pop(context);
            setState(() {
              
            });
          }, child: Text('Save'))
        ],
      );
    },);
  }
}
