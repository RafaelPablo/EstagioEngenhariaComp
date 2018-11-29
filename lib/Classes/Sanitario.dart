/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */

class Sanitario {
  String _identificacaoSanitario;
  String _localizacao;
  String _tipoEntrada;
  String _tipoSanitario;
  int _idSanitario;

  Sanitario(
    this._idSanitario,
    this._identificacaoSanitario,
    this._localizacao,
    this._tipoEntrada,
    this._tipoSanitario,
  );

  Sanitario.map(dynamic obj) {
    this._idSanitario = obj['idSanitario'];
    this._identificacaoSanitario = obj['identificacao'];
    this._localizacao = obj['localizacao'];
    this._tipoEntrada = obj['tipoEntrada'];
    this._tipoSanitario = obj['tipoSanitario'];
  }

  String get tipoSanitario => _tipoSanitario;
  String get tipoEntrada => _tipoEntrada;
  String get localizacao => _localizacao;
  String get identificacao => _identificacaoSanitario;
  int get idSanitario => _idSanitario;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["identificacao"] = _identificacaoSanitario;
    map["localizacao"] = _localizacao;
    map["tipoEntrada"] = _tipoEntrada;
    map["tipoSanitario"] = _tipoSanitario;
    map["idSanitario"] = _idSanitario;

    if (idSanitario != null) {
      map["idSanitario"] = _idSanitario;
    }
    return map;
  }

  Sanitario.fromMap(Map<String, dynamic> map) {
    this._identificacaoSanitario = map["_identificacaoSanitario"];
    this._localizacao = map["localizacao"];
    this._tipoEntrada = map["tipoEntrada"];
    this._tipoSanitario = map["tipoSanitario"];
    this._idSanitario = map["idSanitario"];
  }
}
