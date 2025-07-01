import 'package:project1/lab%203/database/my_database.dart';
import 'package:project1/lab%203/models/db_user_model.dart';

class DbUserController {
  DbUserModel _model = DbUserModel();
  MyDatabase _myDatabase = MyDatabase();

  List<Map<String, dynamic>> get list => _model.list;

  Future<List<Map<String, dynamic>>> getUsers() => _myDatabase.getUsers();

  Future<void> addUser(Map<String, dynamic> user) => _myDatabase.addUser(user);

  Future<void> updateUser(int index, Map<String, dynamic> user) => _myDatabase.updateUser(index, user);

  Future<void> deleteUser(int index) => _myDatabase.deleteUser(index);

  String? nameValidator(String? value) {
    if(value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  String? cityValidator(String? value) {
    if(value == null || value.isEmpty) {
      return 'Please select city';
    }
    return null;
  }

  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select gender';
    }
    return null;
  }

}