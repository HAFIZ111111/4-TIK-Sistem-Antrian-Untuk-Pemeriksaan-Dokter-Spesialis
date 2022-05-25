import 'package:flutter/foundation.dart';
import 'package:rpl/layar/class_utama.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DataDokter {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE dokterZA1(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama TEXT,
        spesialis TEXT,
        jw1 TEXT,
        jw2 TEXT,
        antrian1 INTEGER,
        antrian2 INTEGER,
        noAntrian1 INTEGER,
        noAntrian2 INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """ );
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'rpl181.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String nama, String spesialis,
  String jw1,
  String jw2,
  int antrian1,
  int antrian2,
  int noAntrian1,
  int noAntrian2) async {
    final db = await DataDokter.db();

    final data = {
      'nama': nama,
      'spesialis': spesialis,
      'jw1': jw1,
      'jw2': jw2,
      'antrian1': antrian1,
      'antrian2': antrian2,
      'noAntrian1' : noAntrian1,
      'noAntrian2' : noAntrian2,
    };
    final id = await db.insert('dokterZA1', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DataDokter.db();
    return db.query('dokterZA1', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataDokter.db();
    return db.query('dokterZA1', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItemSpesialis(String spesialis) async {
    final db = await DataDokter.db();
    return db.query('dokterZA1', where: "spesialis = ?", whereArgs: [spesialis]);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, 
      String nama, 
      String spesialis,
      String jw1,
      String jw2, 
      int antrian1,
      int antrian2,
       int noAntrian1,
  int noAntrian2
      ) async {
    final db = await DataDokter.db();

    final data = {
      'nama': nama,
      'spesialis': spesialis,
      'jw1': jw1,
      'jw2': jw2,
      'antrian1': antrian1,
      'antrian2': antrian2,
      'noAntrian1' : noAntrian1,
      'noAntrian2' : noAntrian2,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('dokterZA1', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<int> updateAntrian(
      String nama, 
      String spesialis,
      String jw1,
      String jw2, 
      int antrian1,
      int antrian2,
      int noAntrian1,
  int noAntrian2
      ) async {
    final db = await DataDokter.db();

    final data = {
      'nama': nama,
      'spesialis': spesialis,
      'jw1': jw1,
      'jw2': jw2,
      'antrian1': antrian1,
      'antrian2': antrian2,
      'noAntrian1' : noAntrian1,
      'noAntrian2' : noAntrian2,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('dokterZA1', data, where: "nama = ?", whereArgs: [nama]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DataDokter.db();
    try {
      await db.delete("dokterZA1", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}









class DataAntrian {
  static Future<void> createTables1(sql.Database database) async {
    await database.execute("""CREATE TABLE dataAntrian(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        namap TEXT,
        namad TEXT,
        spesialis TEXT,
        jw TEXT,
        pb TEXT,
        no_antrian INTEGER,
        keluhan TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'rpl5.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables1(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
    String namap, 
    String namad,
    String spesialis,
  String jw,
  String pb,
  int no_antrian,
  String keluhan
) async {
    final db = await DataAntrian.db();

    final data = {
      'namap': namap,
      'namad': namad,
      'spesialis': spesialis,
      'jw': jw,
      'pb' : pb,
      'no_antrian': no_antrian,
      'keluhan' : keluhan
    };
    final id = await db.insert('dataAntrian', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DataAntrian.db();
    return db.query('dataAntrian', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataAntrian.db();
    return db.query('dataAntrian', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItemSpesialis(String spesialis) async {
    final db = await DataAntrian.db();
    return db.query('dataAntrian', where: "spesialis = ?", whereArgs: [spesialis]);
  }

  static Future<List<Map<String, dynamic>>> getItemNama(String namap) async {
    final db = await DataAntrian.db();
    return db.query('dataAntrian', where: "namap = ?", whereArgs: [namap]);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, 
      String namap, 
    String namad,
    String spesialis,
  String jw,
  String pb,
  int no_antrian
      ) async {
    final db = await DataAntrian.db();

    final data = {
      'namap': namap,
      'namad': namad,
      'spesialis': spesialis,
      'jw': jw,
      'pb': pb,
      'no_antrian': no_antrian,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('dataAntrian', data, where: "id = ?", whereArgs: [id]);
    return result;
  }




  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DataAntrian.db();
    try {
      await db.delete("dataAntrian", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}






class DataPasien {
  static Future<void> createTables1(sql.Database database) async {
    await database.execute("""CREATE TABLE dataAntrian1(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        username TEXT,
        password TEXT,
        bpjs TEXT,
        book INTEGER,
        email TEXT,
        no_telepon TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'rpl0.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables1(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
    String username, 
    String password,
    String? bpjs,
  int? book,
  String? email,
  String? no_telepon
) async {
    final db = await DataPasien.db();

    final data = {
      'username': username,
      'password': password,
      'bpjs': bpjs,
      'book': book,
      'email' : email,
      'no_telepon': no_telepon,
    };
    final id = await db.insert('dataAntrian1', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItemSpesialis(String spesialis) async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', where: "spesialis = ?", whereArgs: [spesialis]);
  }

  static Future<List<Map<String, dynamic>>> getItemNama(String username) async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', where: "username = ?", whereArgs: [username]);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, 
      String username, 
    String password,
    String? bpjs,
  int? book,
  String? email,
  String? no_telepon
      ) async {
    final db = await DataPasien.db();

    final data = {
      'username': username,
      'password': password,
      'bpjs': bpjs,
      'book': book,
      'email' : email,
      'no_telepon': no_telepon,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('dataAntrian1', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

static Future<int> updateBook(
      String username, 
    String password,
    String? bpjs,
  int? book,
  String? email,
  String? no_telepon
      ) async {
    final db = await DataPasien.db();

    final data = {
      'username': username,
      'password': password,
      'bpjs': bpjs,
      'book': book,
      'email' : email,
      'no_telepon': no_telepon,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update("dataAntrian1", data, where: "username = ?", whereArgs: [username]);
    return result;
  }


  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DataPasien.db();
    try {
      await db.delete("dataAntrian1", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}





class DataNotif {
  static Future<void> createTables1(sql.Database database) async {
    await database.execute("""CREATE TABLE dataAntrian1(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nama TEXT,
        no_antrian INTEGER,
        jw TEXT,
        pb TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'rplAntrian.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables1(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
    String nama, 
    int no_antrian,
    String jw,
  String pb,
) async {
    final db = await DataNotif.db();

    final data = {
      'nama': nama,
      'no_antrian': no_antrian,
      'jw': jw,
      'pb': pb,
    };
    final id = await db.insert('dataAntrian1', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getItemSpesialis(String spesialis) async {
    final db = await DataPasien.db();
    return db.query('dataAntrian1', where: "spesialis = ?", whereArgs: [spesialis]);
  }

  static Future<List<Map<String, dynamic>>> getItemNama(String nama) async {
    final db = await DataNotif.db();
    return db.query('dataAntrian1', where: "nama = ?", whereArgs: [nama]);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, 
      String username, 
    String password,
    String? bpjs,
  int? book,
  String? email,
  String? no_telepon
      ) async {
    final db = await DataPasien.db();

    final data = {
      'username': username,
      'password': password,
      'bpjs': bpjs,
      'book': book,
      'email' : email,
      'no_telepon': no_telepon,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('dataAntrian1', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

static Future<int> updateBook(
      String username, 
    String password,
    String? bpjs,
  int? book,
  String? email,
  String? no_telepon
      ) async {
    final db = await DataPasien.db();

    final data = {
      'username': username,
      'password': password,
      'bpjs': bpjs,
      'book': book,
      'email' : email,
      'no_telepon': no_telepon,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update("dataAntrian1", data, where: "username = ?", whereArgs: [username]);
    return result;
  }


  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DataNotif.db();
    try {
      await db.delete("dataAntrian1", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}