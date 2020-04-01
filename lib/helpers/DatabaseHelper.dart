import 'dart:io';
import 'package:babyfeed/models/Bottle.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "BabyFeedDB.db";
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE bottles (_id INTEGER PRIMARY KEY, quantity INTEGER NOT NULL, datetime TEXT NOT NULL)");
    await db.execute("CREATE TABLE meals (_id INTEGER PRIMARY KEY, quantity INTEGER NOT NULL, datetime TEXT NOT NULL)");
  }

  Future dropDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    deleteDatabase(join(documentsDirectory.path, _databaseName));
    _database = null;
  }

  // Database helper methods:
  Future<int> insertBottle(Bottle bottle) async {
    Database db = await database;
    int id = await db.insert("bottles", bottle.toMap());
    return id;
  }

  Future<int> insertMeal(Bottle meal) async {
    Database db = await database;
    int id = await db.insert("meals", meal.toMap());
    return id;
  }

  Future<List<Bottle>> queryAll(bool isMeal) async {
    Database db = await database;
    String table = "";

    if (isMeal){
      table = "meals";
    } else {
      table = "bottles";
    }

    List<Map> maps = await db.query(table, columns: ["_id", "quantity", "datetime"]);

    if (maps.length > 0) {
      List<Bottle> bottles = new List<Bottle>();
      maps.forEach((bottle){
        bottles.add(Bottle.fromMap(bottle));
      });
      return bottles;
    } else {
      List<Bottle> bottles = new List<Bottle>();
      Bottle fakeBottle = new Bottle();
      fakeBottle.quantity = -1;
      fakeBottle.datetime = DateTime.now();
      bottles.add(fakeBottle);
      return bottles;
    }
  }
}