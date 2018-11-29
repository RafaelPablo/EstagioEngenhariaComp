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
//import 'package:app_acessibilidade/Classes/Conta.dart';
//
//class dbConta {
//  static final dbConta _instance = new dbConta.internal();
//
//  factory dbConta() => _instance;
//
//  final String tableConta = "contaTable";
//  final String columnId = "id";
//  final String columnEmail = "email";
//  final String columnSenha = "senha";
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
//  dbConta.internal();
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
//        "CREATE TABLE $tableConta($columnId INTEGER PRIMARY KEY, $columnEmail TEXT,"
//        "$columnSenha TEXT)");
//  }
//
//  Future<int> saveConta(Conta conta) async {
//    var dbClient = await db;
//    int res = await dbClient.insert("$tableConta", conta.toMap());
//
//    return res;
//  }
//
//  Future<List> getAllContas() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM $tableConta");
//
//    return result.toList();
//  }
//
//  Future<int> getCountContas() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableConta"));
//  }
//
//  Future<Conta> getConta(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient
//        .rawQuery("SELECT * FROM $tableConta WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return new Conta.fromMap(result.first);
//  }
//
//  Future<int> deleteConta(int id) async {
//    var dbClient = await db;
//
//    return await dbClient
//        .delete(tableConta, where: "$columnId = ?", whereArgs: [id]);
//  }
//
//  Future<int> updateConta(Conta conta) async {
//    var dbClient = await db;
//    return await dbClient.update(tableConta, conta.toMap(),
//        where: "$columnId = ?", whereArgs: [conta.id]);
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//}
