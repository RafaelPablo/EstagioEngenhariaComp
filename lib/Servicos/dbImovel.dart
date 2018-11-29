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
//import 'package:app_acessibilidade/Classes/Imovel.dart';
//import 'package:app_acessibilidade/Servicos/dbConta.dart';
//
//class dbImovel {
//  static final dbImovel _instance = new dbImovel.internal();
//
//  factory dbImovel() => _instance;
//
//  final String tableImovel = "imovelTable";
//  final String columnId = "id";
//  final String columnIdentificacao = "identificacao";
//  final String columnEmailResponsavel = "EmailResponsavel";
//  final String columnLogradouro = "logradouro";
//  final String columnNumero = "numero";
//  final String columnBairro = "bairro";
//  final String columnCidade = "cidade";
//  final String columnUf = "uf";
//  final String columnCep = "cep";
//  final String columnTipo = "tipo";
//  final String columnObs = "obs";
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
//  dbImovel.internal();
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
//        "CREATE TABLE $tableImovel($columnId INTEGER PRIMARY KEY, $columnIdentificacao TEXT,"
//        "$columnEmailResponsavel TEXT, $columnLogradouro TEXT, $columnNumero TEXT,"
//        "$columnLogradouro TEXT, $columnNumero TEXT, $columnBairro TEXT,"
//        "$columnCidade TEXT, $columnUf TEXT, $columnCep TEXT,"
//        "$columnTipo TEXT, $columnObs TEXT)");
//  }
//
//  Future<int> saveImovel(Imovel imovel) async {
//    var dbClient = await db;
//    int res = await dbClient.insert("$tableImovel", imovel.toMap());
//
//    return res;
//  }
//
//  Future<List> getAllImovels() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM $tableImovel");
//
//    return result.toList();
//  }
//
//  Future<int> getCountImovels() async {
//    var dbClient = await db;
//    return Sqflite.firstIntValue(
//        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableImovel"));
//  }
//
//  Future<Imovel> getImovel(int id) async {
//    var dbClient = await db;
//
//    var result = await dbClient
//        .rawQuery("SELECT * FROM $tableImovel WHERE $columnId = $id");
//    if (result.length == 0) return null;
//    return new Imovel.fromMap(result.first);
//  }
//
//  Future<int> deleteImovel(int id) async {
//    var dbClient = await db;
//
//    return await dbClient
//        .delete(tableImovel, where: "$columnId = ?", whereArgs: [id]);
//  }
//
//  Future<int> updateImovel(Imovel imovel) async {
//    var dbClient = await db;
//    return await dbClient.update(tableImovel, imovel.toMap(),
//        where: "$columnId = ?", whereArgs: [imovel.id]);
//  }
//
//  Future close() async {
//    var dbClient = await db;
//    return dbClient.close();
//  }
//}
