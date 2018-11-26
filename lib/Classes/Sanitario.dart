/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class Sanitario {
  final String id;
  String identificacao;
  String localizacao;
  String tipoEntrada;
  String tipoSanitario;
  bool completed;

  Sanitario({
    @required this.id,
    @required this.identificacao,
    @required this.localizacao,
    @required this.tipoEntrada,
    @required this.tipoSanitario,
    this.completed = false,
  })  : assert(id != null && id.isNotEmpty),
        assert(identificacao != null && identificacao.isNotEmpty),
        assert(localizacao != null && localizacao.isNotEmpty),
        assert(tipoEntrada != null && tipoEntrada.isNotEmpty),
        assert(tipoSanitario != null && tipoSanitario.isNotEmpty),
        assert(completed != null);

  Sanitario.fromMap(Map<String, dynamic> data)
      : this(
            id: data['id'],
            identificacao: data['identificacao'],
            localizacao: data['localizacao'],
            tipoEntrada: data['tipoEntrada'],
            tipoSanitario: data['tipoSanitario'],
            completed: data['completed'] ?? false);

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'identificacao': this.identificacao,
        'localizacao': this.localizacao,
        'tipoEntrada': this.tipoEntrada,
        'tipoSanitario': this.tipoSanitario,
      };
}
