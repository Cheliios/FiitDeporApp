import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserModel {

  Future<Database> openMyDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE IF NOT EXISTS users (
          id INTEGER PRIMARY KEY,
          user_mail TEXT,
          user_password TEXT
        )
      ''');
    });
  }

}
