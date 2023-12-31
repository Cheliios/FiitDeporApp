import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, email TEXT)');
    await db.insert('register', {
      'user_dni': 'John Doe',
      'user_nickname': 'Jhonylagenteestamuyloca',
      'user_password': '12345678',
      'user_name': 'Jhon',
      'user_lastname': 'Papita',
      'user_edad': '30',
      'user_genero': 'masculino',
      'user_pais': 'Arequipa',
      'user_mail': 'john.doe@example.com'
    });
  }
}
