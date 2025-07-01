import 'package:flutter/material.dart';
import 'package:project1/lab%203/controllers/db_user_controller.dart';

class DbUserListView extends StatefulWidget {
  const DbUserListView({super.key});

  @override
  State<DbUserListView> createState() => _DbUserListViewState();
}

class _DbUserListViewState extends State<DbUserListView> {
  DbUserController _controller = DbUserController();
  TextEditingController _nameController = TextEditingController();
  String _selectedCity = '';
  String _selectedGender = '';
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeList();
  }

  Future<void> initializeList() async {
    _controller.list.addAll(await _controller.getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List View Page'),
        actions: [
          IconButton(onPressed: () {
            showBottomSheet(isEditing: false);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: _controller.list.isEmpty ? Center(child: Text('No User Found'),) :
        ListView.builder(
          itemCount: _controller.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showBottomSheet(isEditing: true, index: index);
              },
              title: Text(_controller.list[index]['Name']),
              subtitle: Row(
                children: [
                  Text('City:- ${_controller.list[index]['City']}'),
                  SizedBox(width: 5,),
                  Text('Gender:- ${_controller.list[index]['Gender']}'),
                ],
              ),
              trailing: IconButton(onPressed: () async {
                _controller.deleteUser(_controller.list[index]['UID']);
                _controller.list.clear();
                _controller.list.addAll(await _controller.getUsers());
                setState(() {

                });
              }, icon: Icon(Icons.delete)),
            );
          },
        ),
    );
  }

  void showBottomSheet({required bool isEditing, int? index}) {
    if(isEditing) {
      _nameController.text = _controller.list[index!]['Name'];
      _selectedCity = _controller.list[index]['City'];
      _selectedGender = _controller.list[index]['Gender'];
    }
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height*.85,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  validator: (value) => _controller.nameValidator(value),
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _controller.cityValidator(value),
                  value: _selectedCity.isEmpty ? null : _selectedCity,
                  hint: Text('Select City'),
                  items: [
                    DropdownMenuItem(value: 'Junagadh', child: Text('Junagadh')),
                    DropdownMenuItem(value: 'Rajkot', child: Text('Rajkot')),
                    DropdownMenuItem(value: 'Ahmedabad', child: Text('Ahmedabad')),
                    DropdownMenuItem(value: 'Vadodara', child: Text('Vadodara')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value!;
                    });
                  },
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
                    ListTile(
                      title: Text('Male'),
                      leading: Radio<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Female'),
                      leading: Radio<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () async {
                  if(_key.currentState!.validate()) {
                    if(_controller.genderValidator(_selectedGender) == null) {
                      if(isEditing) {
                        Map<String, dynamic> user = {};
                        user['Name'] = _nameController.text;
                        user['City'] = _selectedCity;
                        user['Gender'] = _selectedGender;
                        _controller.updateUser(_controller.list[index!]['UID'], user);
                      }
                      else {
                        Map<String, dynamic> user = {};
                        user['Name'] = _nameController.text;
                        user['City'] = _selectedCity;
                        user['Gender'] = _selectedGender;
                        _controller.addUser(user);
                      }
                      _nameController.clear();
                      _selectedCity = '';
                      _selectedGender = '';
                      _controller.list.clear();
                      _controller.list.addAll(await _controller.getUsers());
                      Navigator.pop(context);
                      setState(() {

                      });
                    }
                  }
                }, child: Text('Save'))
              ],
            ),
          ),
        ),
      );
    },);
  }
}
