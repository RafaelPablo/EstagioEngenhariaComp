///* Copyright 2018 Rafael Pablo. All rights reserved.
//*  Use of this source code is governed by a BSD-style license that can be
//*  found in the LICENSE file.
//*  Rafael Pablo Massocato
//*  Estágio Engenharia de Computação 2018
//*  Aplicativo para avaliação de acessibilidade */
//import 'dart:io';
//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:app_acessibilidade/Classes/Sanitario.dart';
//
//class dbSanitario {
//  static final dbSanitario _instance = new dbSanitario.internal();
//
//  factory dbSanitario() => _instance;
//
//  final String tableSanitario = "sanitarioTable";
//  final String columnId = "id";
//  final String columnIdentificacao = "identificacao";
//  final String columnLocalizacao = "localizacao";
//  final String columnTipoEntrada = "tipoEntrada";
//  final String columnTipoSanitario = "tipoSanitario";
//
//  static Database _db;
//
//  Future<Database> get db async {
//    if (_db != null) {
//      return _db;
//    }
//    _db = await initDb();
//
//    return _db;
//  }
//
//  dbSanitario.internal();
//
//  initDb() async {
//    Directory documentDirectory = await getApplicationDocumentsDirectory();
//    String path = join(documentDirectory.path, "maindb.db");
//
//    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
//    return ourDb;
//  }
//
//  void _onCreate(Database db, int newVersion) async {
//    await db.execute(
//        "CREATE TABLE $tableSanitario($columnId INTEGER PRIMARY KEY, $columnIdentificacao TEXT,"
//        "$columnLocalizacao TEXT, $columnTipoEntrada TEXT, $columnTipoSanitario TEXT)");
//  }
//
//  Future<int> saveSanitario(Sanitario sanitario) async {
//    var dbClient = await db;
//    int res = await dbClient.insert("$tableSanitario", sanitario.toMap());
//
//    return res;
//  }
//
//  Future<List> getAllSanitarios() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM $tableSanitario");
//
//    return result.toList();
//  }
//
//  Future<int> getCountSanitarios() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableSanitario"));
//  }
//
//  Future<Sanitario> getSanitario(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient
//        .rawQuery("SELECT * FROM $tableSanitario WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return new Sanitario.fromMap(result.first);
//  }
//
//  Future<int> deleteSanitario(int id) async {
//    var dbClient = await db;
//
//    return await dbClient
//        .delete(tableSanitario, where: "$columnId = ?", whereArgs: [id]);
//  }
//
//  Future<int> updateSanitario(Sanitario sanitario) async {
//    var dbClient = await db;
//    return await dbClient.update(tableSanitario, sanitario.toMap(),
//        where: "$columnId = ?", whereArgs: [sanitario.id]);
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//}
