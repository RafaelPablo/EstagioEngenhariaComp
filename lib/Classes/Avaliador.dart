// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade

class Avaliador {
  String _numeroRegistro;
  String _nome;
  String _telefone;
  int _idAvaliador;

  Avaliador(
      this._idAvaliador, this._numeroRegistro, this._nome, this._telefone);

  Avaliador.map(dynamic obj) {
    this._idAvaliador = obj['idAvaliador'];
    this._numeroRegistro = obj['numeroRegistro'];
    this._nome = obj['nome'];
    this._telefone = obj['telefone'];
  }

  String get numeroRegistro => _numeroRegistro;
  String get nome => _nome;
  String get telefone => _telefone;
  int get idAvaliador => _idAvaliador;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["numeroRegistro"] = _numeroRegistro;
    map["nome"] = _nome;
    map["telefone"] = _telefone;
    map["idAvaliador"] = _idAvaliador;

    if (idAvaliador != null) {
      map["idAvaliador"] = _idAvaliador;
    }
    return map;
  }

  Avaliador.fromMap(Map<String, dynamic> map) {
    this._numeroRegistro = map["numeroRegistro"];
    this._nome = map["nome"];
    this._telefone = map["telefone"];
    this._idAvaliador = map["idAvaliador"];
  }
}
