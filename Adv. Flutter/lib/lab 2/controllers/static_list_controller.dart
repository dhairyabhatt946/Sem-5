import 'package:project1/utils/import_export.dart';

class StaticListController {
  StaticListModel model = StaticListModel();

  List<dynamic> get list => model.list;
  void addUserToList(map) => model.addUserToList(map);
  void editUserInList(index, map) => model.editUserInList(index, map);
  void deleteUserFromList(index) => model.deleteUserFromList(index);
  void toggleFavoriteUser(index) => model.toggleFavoriteUser(index);
}