import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  Future<Database> _initDatabase() async
  {
    String path = join(await getDatabasesPath(),'user_database.db');
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }
  Future<void> _onCreate(Database db,int version )async {
    await db.execute('Create tables');
  }
  Future<int> insertUser(Map<String,dynamic> row )async{
    Database db = await instance.database;
    return await db.insert('table_name',row);
  }
  Future<List<Map<String,dynamic>>> queryUsers() async {
    Database db = await instance.database;
    return await db.query('table_name');
  }
  Future<List<Map<String,dynamic>>> querySingleUser(String email,String password) async {
    Database db = await instance.database;
    return await db.query('table_name',where: 'email =? AND password =?',whereArgs: [email,password]);
  }
  Future<int> insertItems(Map<String,dynamic> row )async{
    Database db = await instance.database;
    return await db.insert('table_name',row);
  }
  Future<List<Map<String,dynamic>>> queryItems() async {
    Database db = await instance.database;
    return await db.query('table_name');
  }
  Future<int> deleteItems(int fId )async{
    Database db = await instance.database;
    return await db.delete('table_name',where: 'id =?',whereArgs: [fId]);
  }
  Future<int> insertHist(Map<String,dynamic> row )async{
    Database db = await instance.database;
    return await db.insert('table_name',row);
  }
  Future<List<Map<String,dynamic>>> queryHist() async {
    Database db = await instance.database;
    return await db.query('table_name');
  }
  Future<int> deleteHist(int fId )async{
    Database db = await instance.database;
    return await db.delete('table_name',where: 'id =?',whereArgs: [fId]);
  }
}