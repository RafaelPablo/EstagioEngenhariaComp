// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/tela_sobre.dart';
import 'package:app_acessibilidade/tela_login.dart';
import 'tela_lista_obras.dart';
import 'tela_cadastro_conta.dart';
import 'tela_cadastro_obra.dart';
import 'tela_editar_obra.dart';
import 'tela_principal_avaliacao.dart';
import 'tela_avaliacao_porta_a.dart';
import 'tela_avaliacao_porta_b.dart';
import 'tela_avaliacao_porta_c.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    ListaObras.tag: (context) => ListaObras(),
    Conta.tag: (context) => Conta(),
    CadastroObra.tag: (context) => CadastroObra(),
    About.tag: (context) => About(),
    EditarObra.tag: (context) => EditarObra(),
    PrincipalAvaliacao.tag: (context) => PrincipalAvaliacao(),
    AvaliacaoPortaA.tag: (context) => AvaliacaoPortaA(),
    AvaliacaoPortaB.tag: (context) => AvaliacaoPortaB(),
    AvaliacaoPortaC.tag: (context) => AvaliacaoPortaC()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliação de acessibilidade',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Login(),
      routes: routes,
    );
  }
}
