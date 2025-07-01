import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static MyDatabase _instance = MyDatabase._internal();
  static Database? _database;

  MyDatabase._internal();

  factory MyDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'MyDatabase.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE TBL_USER(UID INTEGER PRIMARY KEY AUTOINCREMENT, '
          'Name TEXT NOT NULL, '
            'City TEXT NOT NULL, '
            'Gender TEXT NOT NULL) '
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database _db = await database;
    List<Map<String, dynamic>> _list = await _db.query('TBL_USER');
    return _list;
  }

  Future<void> addUser(Map<String, dynamic> user) async {
    Database _db = await database;
    await _db.insert('TBL_USER', user);
  }

  Future<void> updateUser(int index, Map<String, dynamic> user) async {
    Database _db = await database;
    await _db.update('TBL_USER', user, where: 'UID = ?', whereArgs: [index]);
  }

  Future<void> deleteUser(int index) async {
    Database _db = await database;
    await _db.delete('TBL_USER', where: 'UID = ?', whereArgs: [index]);
  }
}