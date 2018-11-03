// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/tela_sobre.dart';
import 'package:app_acessibilidade/tela_login.dart';
import 'tela_lista_imoveis.dart';
import 'tela_lista_sanitarios.dart';
import 'tela_cadastro_conta.dart';
import 'tela_cadastro_imovel.dart';
import 'tela_cadastro_sanitario.dart';
import 'tela_editar_imovel.dart';
import 'tela_editar_sanitario.dart';
import 'tela_principal_avaliacao.dart';
import 'tela_principal_avaliacao_sanitario.dart';
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
    ListaImoveis.tag: (context) => ListaImoveis(),
    ListaSanitarios.tag: (context) => ListaSanitarios(),
    Conta.tag: (context) => Conta(),
    CadastroImovel.tag: (context) => CadastroImovel(),
    CadastroSanitario.tag: (context) => CadastroSanitario(),
    About.tag: (context) => About(),
    EditarImovel.tag: (context) => EditarImovel(),
    EditarSanitario.tag: (context) => EditarSanitario(),
    PrincipalAvaliacao.tag: (context) => PrincipalAvaliacao(),
    PrincipalAvaliacaoSanitario.tag: (context) => PrincipalAvaliacaoSanitario(),
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
