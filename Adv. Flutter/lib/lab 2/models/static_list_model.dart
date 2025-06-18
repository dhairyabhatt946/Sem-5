import 'package:project1/utils/import_export.dart';

class StaticListModel {
  List<dynamic> _list = [];

  List<dynamic> get list => _list;

  void addUserToList(map) {
    list.add(map);
  }

  void editUserInList(index, map) {
    list[index] = map;
  }

  void deleteUserFromList(index) {
    list.removeAt(index);
  }

  void toggleFavoriteUser(index) {
    list[index][IS_FAVORITE] = !list[index][IS_FAVORITE];
  }
}