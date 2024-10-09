import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // final databaseDirecotry = await getDatabasesPath();
    // final path = join(databaseDirecotry, 'patitas.db');

    // print('path $path');

    final data = openDatabase(
      'assets/database/patitas.db',
      version: 1,
    );
    return await data;
  }
}
