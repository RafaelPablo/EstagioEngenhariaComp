// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
library dependencias;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'package:app_acessibilidade/Telas/tela_sobre.dart';
part 'package:app_acessibilidade/Telas/tela_login.dart';
part 'package:app_acessibilidade/Telas/tela_lista_imoveis.dart';
part 'package:app_acessibilidade/Telas/tela_lista_sanitarios.dart';
part 'package:app_acessibilidade/Telas/tela_cadastro_conta.dart';
part 'package:app_acessibilidade/Telas/tela_cadastro_imovel.dart';
part 'package:app_acessibilidade/Telas/tela_cadastro_sanitario.dart';
part 'package:app_acessibilidade/Telas/tela_editar_imovel.dart';
part 'package:app_acessibilidade/Telas/tela_editar_sanitario.dart';
part 'package:app_acessibilidade/Telas/tela_principal_avaliacao.dart';
part 'package:app_acessibilidade/Telas/tela_principal_avaliacao_sanitario.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_a.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_b.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_c.dart';

class Dependencias extends StatelessWidget {
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
