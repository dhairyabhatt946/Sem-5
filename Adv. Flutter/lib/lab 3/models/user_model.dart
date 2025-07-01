class UserModel {
  List<String> _list = [];

  List<String> get list => _list;

  void addUserToList(String name) {
    _list.add(name);
  }

  void editUserInList(int index, String name) {
    _list[index] = name;
  }

  void deleteUserFromList(int index) {
    _list.removeAt(index);
  }
}