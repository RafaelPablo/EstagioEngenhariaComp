// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade

class Conta {
  String _email;
  String _senha;
  int _idConta;

  Conta(this._idConta, this._email, this._senha);

  Conta.map(dynamic obj) {
    this._idConta = obj['idConta'];
    this._email = obj['email'];
    this._senha = obj['senha'];
  }

  String get email => _email;
  String get nome => _senha;
  int get idConta => _idConta;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = _email;
    map["senha"] = _senha;
    map["idConta"] = _idConta;

    if (idConta != null) {
      map["idConta"] = _idConta;
    }
    return map;
  }

  Conta.fromMap(Map<String, dynamic> map) {
    this._email = map["email"];
    this._senha = map["senha"];
    this._idConta = map["idConta"];
  }
}
