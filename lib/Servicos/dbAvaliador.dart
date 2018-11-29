///* Copyright 2018 Rafael Pablo. All rights reserved.
//*  Use of this source code is governed by a BSD-style license that can be
//*  found in the LICENSE file.
//*  Rafael Pablo Massocato
//*  Estágio Engenharia de Computação 2018
//*  Aplicativo para avaliação de acessibilidade */
//
//import 'dart:io';
//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:app_acessibilidade/Classes/Avaliador.dart';
//
//class dbAvaliador {
//  static final dbAvaliador _instance = new dbAvaliador.internal();
//
//  factory dbAvaliador() => _instance;
//
//  final String tableAvaliador = "AvaliadorTable";
//  final String columnId = "id";
//  final String columnNumeroRegistro = "numeroRegistro";
//  final String columnNome = "nome";
//  final String columnTelefone = "telefone";
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
//  dbAvaliador.internal();
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
//        "CREATE TABLE $tableAvaliador($columnId INTEGER PRIMARY KEY, $columnNumeroRegistro TEXT,"
//        "$columnNome TEXT, $columnTelefone TEXT)");
//  }
//
//  Future<int> saveAvaliador(Avaliador avaliador) async {
//    var dbClient = await db;
//    int res = await dbClient.insert("$tableAvaliador", avaliador.toMap());
//
//    return res;
//  }
//
//  Future<List> getAllAvaliadors() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM $tableAvaliador");
//
//    return result.toList();
//  }
//
//  Future<int> getCountAvaliadors() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableAvaliador"));
//  }
//
//  Future<Avaliador> getAvaliador(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient
//        .rawQuery("SELECT * FROM $tableAvaliador WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return new Avaliador.fromMap(result.first);
//  }
//
//  Future<int> deleteAvaliador(int id) async {
//    var dbClient = await db;
//
//    return await dbClient
//        .delete(tableAvaliador, where: "$columnId = ?", whereArgs: [id]);
//  }
//
//  Future<int> updateAvaliador(Avaliador avaliador) async {
//    var dbClient = await db;
//    return await dbClient.update(tableAvaliador, avaliador.toMap(),
//        where: "$columnId = ?", whereArgs: [avaliador.id]);
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//}
