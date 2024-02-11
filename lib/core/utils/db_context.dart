import 'package:fitfuel/core/constants/db_name.dart';
import 'package:fitfuel/core/constants/db_tables.dart';
import 'package:sqflite/sqflite.dart';

class DbContext {
  static final DbContext instance = DbContext._init();
  static Database? _database;

  DbContext._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb(DbNames.fitfuelApp);
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath$filePath";
    //databaseFactory.deleteDatabase(path);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // const String textType = 'TEXT NOT NULL';
    const String textTypeNullable = 'TEXT';
    //const String boolType = 'BOOLEAN NOT NULL';
    const String integerType = 'INTEGER NOT NULL';

    await db.execute('''
          CREATE TABLE ${DbTables.savedclubs} (
            ${ClubFields.id} $idType,
            ${ClubFields.clubName} $textTypeNullable,
            ${ClubFields.address} $textTypeNullable,
            ${ClubFields.openTime} $textTypeNullable,
            ${ClubFields.closeTime} $textTypeNullable, 
            ${ClubFields.clubCordinates} $textTypeNullable,
            ${ClubFields.maxMembersAtTime} $integerType,
            ${ClubFields.currentMembers} $integerType,
            ${ClubFields.images} $textTypeNullable,
            ${ClubFields.subscriptionPlans} $textTypeNullable,
            ${ClubFields.isSaved} $textTypeNullable
          )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
