import 'package:project1/utils/import_export.dart';

class Lab22Controller {
  Lab22Model model = Lab22Model();

  String? nameValidator(String name) => model.nameValidator(name);
  String? emailValidator(String email) => model.emailValidator(email);
  String? phoneValidator(String phone) => model.phoneValidator(phone);
  String? passValidator(String pass) => model.passValidator(pass);
  String? confirmPassValidator(String confirmPass) => model.confirmPassValidator(confirmPass);
}