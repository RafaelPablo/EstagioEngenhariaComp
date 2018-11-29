/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app_acessibilidade/Classes/Conta.dart';
import 'package:app_acessibilidade/Classes/Imovel.dart';
import 'package:app_acessibilidade/Classes/Avaliador.dart';
import 'package:app_acessibilidade/Classes/Sanitario.dart';

class dbDatabase {
  static final dbDatabase _instance = new dbDatabase.internal();

  factory dbDatabase() => _instance;

  final String tableConta = "contaTable";
  final String columnIdConta = "idConta";
  final String columnEmail = "email";
  final String columnSenha = "senha";

  final String tableImovel = "imovelTable";
  final String columnIdImovel = "idImovel";
  final String columnIdentificacaoImovel = "identificacaoImovel";
  final String columnEmailResponsavel = "EmailResponsavel";
  final String columnLogradouro = "logradouro";
  final String columnNumero = "numero";
  final String columnBairro = "bairro";
  final String columnCidade = "cidade";
  final String columnUf = "uf";
  final String columnCep = "cep";
  final String columnTipo = "tipo";
  final String columnObs = "obs";

  final String tableAvaliador = "AvaliadorTable";
  final String columnIdAvaliador = "idAvaliador";
  final String columnNumeroRegistro = "numeroRegistro";
  final String columnNome = "nome";
  final String columnTelefone = "telefone";

  final String tableSanitario = "sanitarioTable";
  final String columnIdSanitario = "idSanitario";
  final String columnIdentificacaoSanitario = "identificacaoSanitario";
  final String columnLocalizacao = "localizacao";
  final String columnTipoEntrada = "tipoEntrada";
  final String columnTipoSanitario = "tipoSanitario";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  dbDatabase.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "maindb.db");

    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    await ourDb.rawInsert(
        'insert into imovelTable(columnIdImovel, columnIdentificacaoImovel, '
        'columnEmailResponsavel, columnLogradouro, columnNumero,'
        'columnBairro, columnCidade, columnUf,'
        'columnCep, columnTipo, columnObs) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [1, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j']);

    return ourDb;
  }

  void _onCreate(Database db, int newVersion) async {
//    await db.execute(
//        "CREATE TABLE $tableConta($columnIdConta INTEGER PRIMARY KEY, $columnEmail TEXT,"
//        "$columnSenha TEXT)");

    await db.execute(
        "CREATE TABLE $tableImovel($columnIdImovel INTEGER PRIMARY KEY, $columnIdentificacaoImovel TEXT,"
        "$columnEmailResponsavel TEXT, $columnLogradouro TEXT, $columnNumero TEXT,"
        "$columnBairro TEXT, $columnCidade TEXT, $columnUf TEXT,"
        "$columnCep TEXT, $columnTipo TEXT, $columnObs TEXT)");

//    await db.execute(
//        "CREATE TABLE $tableAvaliador($columnIdAvaliador INTEGER PRIMARY KEY, $columnNumeroRegistro TEXT,"
//        "$columnNome TEXT, $columnTelefone TEXT)");

//    await db.execute(
//        "CREATE TABLE $tableSanitario($columnIdSanitario INTEGER PRIMARY KEY, $columnIdentificacaoSanitario TEXT,"
//        "$columnLocalizacao TEXT, $columnTipoEntrada TEXT, $columnTipoSanitario TEXT)");
  }

  Future<int> saveConta(Conta conta) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableConta", conta.toMap());

    return res;
  }

  Future<List> getAllContas() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableConta");

    return result.toList();
  }

  Future<int> getCountContas() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableConta"));
  }

  Future<Conta> getConta(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableConta WHERE $columnIdConta = $id");
    if (result.length == 0) return null;
    return new Conta.fromMap(result.first);
  }

  Future<int> deleteConta(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableConta, where: "$columnIdConta = ?", whereArgs: [id]);
  }

  Future<int> updateConta(Conta conta) async {
    var dbClient = await db;
    return await dbClient.update(tableConta, conta.toMap(),
        where: "$columnIdConta = ?", whereArgs: [conta.idConta]);
  }

  Future<int> saveImovel(Imovel imovel) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableImovel", imovel.toMap());

    return res;
  }

  Future<List> getAllImovels() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableImovel");

    return result.toList();
  }

  Future<int> getCountImovels() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableImovel"));
  }

  Future<Imovel> getImovel(int id) async {
    var dbClient = await db;

    var result = await dbClient
        .rawQuery("SELECT * FROM $tableImovel WHERE $columnIdImovel = $id");
    if (result.length == 0) return null;
    return new Imovel.fromMap(result.first);
  }

  Future<int> deleteImovel(int id) async {
    var dbClient = await db;

    return await dbClient
        .delete(tableImovel, where: "$columnIdImovel = ?", whereArgs: [id]);
  }

  Future<int> updateImovel(Imovel imovel) async {
    var dbClient = await db;
    return await dbClient.update(tableImovel, imovel.toMap(),
        where: "$columnIdImovel = ?", whereArgs: [imovel.idImovel]);
  }

  Future<int> saveAvaliador(Avaliador avaliador) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableAvaliador", avaliador.toMap());

    return res;
  }

  Future<List> getAllAvaliadors() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableAvaliador");

    return result.toList();
  }

  Future<int> getCountAvaliadors() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableAvaliador"));
  }

  Future<Avaliador> getAvaliador(int id) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableAvaliador WHERE $columnIdAvaliador = $id");
    if (result.length == 0) return null;
    return new Avaliador.fromMap(result.first);
  }

  Future<int> deleteAvaliador(int id) async {
    var dbClient = await db;

    return await dbClient.delete(tableAvaliador,
        where: "$columnIdAvaliador = ?", whereArgs: [id]);
  }

  Future<int> updateAvaliador(Avaliador avaliador) async {
    var dbClient = await db;
    return await dbClient.update(tableAvaliador, avaliador.toMap(),
        where: "$columnIdAvaliador = ?", whereArgs: [avaliador.idAvaliador]);
  }

  Future<int> saveSanitario(Sanitario sanitario) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableSanitario", sanitario.toMap());

    return res;
  }

  Future<List> getAllSanitarios() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableSanitario");

    return result.toList();
  }

  Future<int> getCountSanitarios() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableSanitario"));
  }

  Future<Sanitario> getSanitario(int id) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableSanitario WHERE $columnIdSanitario = $id");
    if (result.length == 0) return null;
    return new Sanitario.fromMap(result.first);
  }

  Future<int> deleteSanitario(int id) async {
    var dbClient = await db;

    return await dbClient.delete(tableSanitario,
        where: "$columnIdSanitario = ?", whereArgs: [id]);
  }

  Future<int> updateSanitario(Sanitario sanitario) async {
    var dbClient = await db;
    return await dbClient.update(tableSanitario, sanitario.toMap(),
        where: "$columnIdSanitario = ?", whereArgs: [sanitario.idSanitario]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
