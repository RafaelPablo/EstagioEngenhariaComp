// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
part of acessibilidade_app;

class Avaliador {
  final String chave;
  String nome;
  String registro;
  String telefone;
  bool completed;

  Avaliador({
    @required this.chave,
    @required this.nome,
    @required this.registro,
    @required this.telefone,
    this.completed = false,
  })  : assert(chave != null && chave.isNotEmpty),
        assert(nome != null && nome.isNotEmpty),
        assert(registro != null && registro.isNotEmpty),
        assert(telefone != null && telefone.isNotEmpty),
        assert(completed != null);

  Avaliador.fromMap(Map<String, dynamic> data)
      : this(
            chave: data['chave'],
            nome: data['nome'],
            registro: data['registro'],
            telefone: data['telefone'],
            completed: data['completed'] ?? false);

  Map<String, dynamic> toMap() => {
        'chave': this.chave,
        'nome': this.nome,
        'registro': this.registro,
        'telefone': this.telefone,
      };
}
