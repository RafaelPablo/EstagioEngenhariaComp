// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade

class Imovel {
  String _identificacaoImovel;
  String _emailResponsavel;
  String _logradouro;
  String _numero;
  String _bairro;
  String _cidade;
  String _uf;
  String _cep;
  String _tipo;
  String _obs;
  int _idImovel;

  Imovel(
      this._idImovel,
      this._identificacaoImovel,
      this._emailResponsavel,
      this._logradouro,
      this._numero,
      this._bairro,
      this._cidade,
      this._uf,
      this._cep,
      this._tipo,
      this._obs);

  Imovel.map(dynamic obj) {
    this._idImovel = obj['idImovel'];
    this._identificacaoImovel = obj['identificacaoImovel'];
    this._emailResponsavel = obj['emailResponsavel'];
    this._logradouro = obj['logradouro'];
    this._numero = obj['numero'];
    this._bairro = obj['bairro'];
    this._cidade = obj['cidade'];
    this._uf = obj['uf'];
    this._cep = obj['cep'];
    this._tipo = obj['tipo'];
    this._obs = obj['obs'];
  }

  String get identificacao => _identificacaoImovel;
  String get emailResponsavel => _emailResponsavel;
  String get logradouro => _logradouro;
  String get numero => _numero;
  String get bairro => _bairro;
  String get cidade => _cidade;
  String get uf => _uf;
  String get cep => _cep;
  String get tipo => _tipo;
  String get obs => _obs;
  int get idImovel => _idImovel;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["identificacaoImovel"] = _identificacaoImovel;
    map["emailResponsavel"] = _emailResponsavel;
    map["logradouro"] = _logradouro;
    map["numero"] = _numero;
    map["bairro"] = _bairro;
    map["cidade"] = _cidade;
    map["uf"] = _uf;
    map["cep"] = _cep;
    map["tipo"] = _tipo;
    map["obs"] = _obs;
    map["idImovel"] = _idImovel;

    if (idImovel != null) {
      map["idImovel"] = _idImovel;
    }
    return map;
  }

  Imovel.fromMap(Map<String, dynamic> map) {
    this._identificacaoImovel = map["identificacaoImovel"];
    this._emailResponsavel = map["emailResponsavel"];
    this._logradouro = map["logradouro"];
    this._numero = map["numero"];
    this._bairro = map["bairro"];
    this._cidade = map["cidade"];
    this._uf = map["uf"];
    this._cep = map["cep"];
    this._tipo = map["tipo"];
    this._obs = map["obs"];
    this._idImovel = map["idImovel"];
  }
}
