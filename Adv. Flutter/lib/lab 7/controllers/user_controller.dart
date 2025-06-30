import 'package:get/get.dart';
import 'package:project1/lab%207/models/user_model.dart';

class UserController extends GetxController {
  List<UserModel> list = <UserModel>[].obs;

  void addUserToList(String name) {
    list.add(UserModel(name: name, isFavorite: false));
  }

  void editUserInList(int idx, String name, bool isFavorite) {
    list[idx] = UserModel(name: name, isFavorite: isFavorite);
  }

  void toggleFavorite(int idx) {
    final currentUser = list[idx];
    list[idx] = UserModel(
      name: currentUser.name,
      isFavorite: !currentUser.isFavorite!,
    );
  }

  void deleteUserFromList(int idx) {
    list.removeAt(idx);
  }
}