import 'package:project1/lab%203/models/user_model.dart';

class UserController {
  UserModel _model = UserModel();

  List<String> get list => _model.list;

  void addUserToList(String name) => _model.addUserToList(name);

  void editUserInList(int index, String name) => _model.editUserInList(index, name);

  void deleteUserFromList(int index) => _model.deleteUserFromList(index);

  String? nameValidator(value) {
    if(value == null) {
      return 'Please enter name';
    }
    return null;
  }
}