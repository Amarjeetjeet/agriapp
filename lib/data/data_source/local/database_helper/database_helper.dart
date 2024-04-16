import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _tableName = "cart_products";

  static Future<void> initDb() async {
    if (_database != null) {
      return;
    }
    try {
      var databasesPath = await getDatabasesPath();
      String path = p.join(databasesPath, "cart.db");
      _database =
          await openDatabase(path, version: _version, onCreate: (db, version) {
        debugPrint('Create a new one');
        var createTable = "CREATE TABLE $_tableName("
            "productId INTEGER PRIMARY KEY,"
            "productName STRING,"
            "productImage STRING,"
            "regularPrice REAL,"
            "discountedPrice REAL,"
            "quantity INTEGER)";
        debugPrint('query $createTable');
        return db.execute(createTable);
      });
    } catch (e) {
      debugPrint("error");
      debugPrint(e.toString());
    }
  }

  Future<void> addItemToCart({
    required int productId,
    required String productImage,
    required String productName,
    required String discountedPrice,
    required String regularPrice,
  }) async {
    await _database?.insert(
      _tableName,
      {
        'productId': productId,
        'productImage': productImage,
        'productName': productName,
        'discountedPrice': discountedPrice,
        'regularPrice': regularPrice,
        'quantity': 1
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> incrementQuantity(int id) async {
    await _database?.rawUpdate(
      'UPDATE $_tableName SET quantity = quantity + 1 WHERE productId = ?',
      [id],
    );
  }

  Future<void> decrementQuantity(int id) async {
    int currentQuantity = await getProductQuantity(id);
    if (currentQuantity == 1) {
      await deleteItem(id);
    } else {
      await _database?.rawUpdate(
        'UPDATE $_tableName SET quantity = quantity - 1 WHERE productId = ?',
        [id],
      );
    }
  }

  Future<void> deleteItem(int id) async {
    await _database?.delete(
      _tableName,
      where: 'productId = ?',
      whereArgs: [id],
    );
  }

  Future<int> getProductQuantity(int id) async {
    List<Map<String, dynamic>> result = await _database!
        .rawQuery('SELECT quantity FROM $_tableName WHERE productId = ?', [id]);
    if (result.isNotEmpty) {
      return result.first['quantity'] as int;
    } else {
      return 0; // Assuming the default quantity is 0 if the product is not found
    }
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    return await _database!.query(_tableName);
  }

  static Future<void> clearCart() async {
    await _database?.delete(_tableName);
  }
}
