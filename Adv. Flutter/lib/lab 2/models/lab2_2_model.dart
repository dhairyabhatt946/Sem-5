import 'package:project1/utils/import_export.dart';

class Lab22Model {
  String? nameValidator(String name) {
    if(name.isNotEmpty) {
      return null;
    }
    return "Please Enter Name";
  }
  String? emailValidator(String email) {
    if(email.isNotEmpty) {
      return null;
    }
    return "Please Enter Email";
  }
  String? phoneValidator(String phone) {
    if(phone.isNotEmpty) {
      return null;
    }
    return "Please Enter Number";
  }
  String? passValidator(String pass) {
    if(pass.isNotEmpty) {
      return null;
    }
    return "Please Enter Password";
  }
  String? confirmPassValidator(String confirmPass) {
    if(confirmPass.isNotEmpty) {
      return null;
    }
    return "Please Enter Confirm Password";
  }
}