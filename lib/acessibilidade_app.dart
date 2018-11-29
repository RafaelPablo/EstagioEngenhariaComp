// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
library acessibilidade_app;

import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import 'package:app_acessibilidade/Telas/tela_sobre.dart';
import 'package:app_acessibilidade/Telas/tela_login.dart';
import 'package:app_acessibilidade/Telas/tela_laudo.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_lista.dart';
import 'package:app_acessibilidade/Telas/tela_conta_cadastro.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_cadastro.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_editar.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_lista.dart';
import 'package:app_acessibilidade/Telas/tela_principal.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_principal.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_cadastro.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_editar.dart';
import 'package:app_acessibilidade/Telas/tela_avaliacao_porta_a.dart';
import 'package:app_acessibilidade/Telas/tela_avaliacao_porta_b.dart';
import 'package:app_acessibilidade/Telas/tela_avaliacao_porta_c.dart';
import 'package:app_acessibilidade/Telas/tela_avaliador_cadastro.dart';
import 'package:app_acessibilidade/Telas/tela_avaliador_editar.dart';

class Acessibilidade_app extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    Laudo.tag: (context) => Laudo(),
    ListaImoveis.tag: (context) => ListaImoveis(),
    ListaSanitarios.tag: (context) => ListaSanitarios(),
    CadastroConta.tag: (context) => CadastroConta(),
    CadastroImovel.tag: (context) => CadastroImovel(),
    CadastroSanitario.tag: (context) => CadastroSanitario(),
    About.tag: (context) => About(),
    EditarImovel.tag: (context) => EditarImovel(),
    EditarSanitario.tag: (context) => EditarSanitario(),
    Principal.tag: (context) => Principal(),
    PrincipalAvaliacaoSanitario.tag: (context) => PrincipalAvaliacaoSanitario(),
    AvaliacaoPortaA.tag: (context) => AvaliacaoPortaA(),
    AvaliacaoPortaB.tag: (context) => AvaliacaoPortaB(),
    AvaliacaoPortaC.tag: (context) => AvaliacaoPortaC(),
    AvaliadorCadastro.tag: (context) => AvaliadorCadastro(),
    AvaliadorEditar.tag: (context) => AvaliadorEditar(),
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
