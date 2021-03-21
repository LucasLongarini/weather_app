import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/services/db_service.dart';
import 'package:sqflite/sqflite.dart';

import '../base_model.dart';

abstract class BaseProvider<T extends BaseModel> {
  @protected
  Database db;
  final tableName;
  final T model;
  
  // TODO: fix this. Passing an empty instance is redundant but the only way that works so far
  BaseProvider({@required this.tableName, @required this.model}) {
    db = GetIt.I.get<DBService>().database;
  }

  Future<bool> create(T model) async {
    try {
      await db.insert(tableName, model.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> delete(T model) async {
    try {
      await db.delete(tableName, where: 'id = ?', whereArgs: [model.id]);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteById(int id) async {
    try {
      await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<T> get(int id) async {
    try {
      List<Map> results =
          await db.query(tableName, where: 'id = ?', whereArgs: [id]);
      if (results.length > 0) {
        return model.fromMap(results.first);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<List<T>> getAll() async {
    try {
      List<Map> results = await db.query(tableName);
      if (results.length > 0) {
        var list = results.map((result) {
          return model.fromMap(result) as T;
        }).toList();
        return list;
      }
      return null;
    } catch (Exception) {
      return null;
    }
  }

  Future<bool> update(T model) async {
    try {
      await db.update(tableName, model.toMap(),
          where: 'id = ?', whereArgs: [model.id]);
      return true;
    } catch (_) {
      return false;
    }
  }
}
