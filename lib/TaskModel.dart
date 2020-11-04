import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class AlertModel{
  final hour;
  final minutes;
  int id;

  AlertModel({this.hour, this.minutes, this.id});

  Map<String, dynamic> toMap(){
    return{
      'hour': hour,
      'minutes': minutes,
    };
  }
}

class AlertOptions{
  AlertOptions() {
    initDataBase();
  }
  Database db;
  Future<void> initDataBase() async{
    db = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE alert(hour INTEGER, minutes INTEGER, id INTEGER PRIMARY KEY AUTOINCREMENT)"
        );
      },
      version: 1
    );
  }

  Future<void> insertAlert(AlertModel alert) async{
    await db.insert('alert', alert.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AlertModel>> alerts() async{
    List<Map<String, dynamic>> Maps = await db.query('alert');

    return List.generate(Maps.length, (index) {
      return AlertModel(
        id: Maps[index]['id'],
        minutes: Maps[index]['minutes'],
        hour: Maps[index]['hour'],
      );
    });
  }

  Future<void> deleteAlert(int id) async{
    await db.delete(
      'alerts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}