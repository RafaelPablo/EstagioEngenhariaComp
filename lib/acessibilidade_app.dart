// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
library acessibilidade_app;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
//import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

part 'package:app_acessibilidade/Telas/_tela_sanitario_lista.dart';
part 'package:app_acessibilidade/Telas/tela_sobre.dart';
part 'package:app_acessibilidade/Telas/tela_login.dart';
part 'package:app_acessibilidade/Telas/tela_laudo.dart';
part 'package:app_acessibilidade/Telas/tela_conta_cadastro.dart';
part 'package:app_acessibilidade/Telas/tela_imovel_cadastro.dart';
part 'package:app_acessibilidade/Telas/tela_imovel_editar.dart';
part 'package:app_acessibilidade/Telas/tela_imovel_lista.dart';
part 'package:app_acessibilidade/Telas/tela_principal.dart';
part 'package:app_acessibilidade/Telas/tela_sanitario_principal.dart';
part 'package:app_acessibilidade/Telas/tela_sanitario_cadastro.dart';
part 'package:app_acessibilidade/Telas/tela_sanitario_editar.dart';
part 'package:app_acessibilidade/Telas/tela_sanitarios_lista.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_a.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_b.dart';
part 'package:app_acessibilidade/Telas/tela_avaliacao_porta_c.dart';
part 'package:app_acessibilidade/Telas/tela_avaliador_cadastro.dart';
part 'package:app_acessibilidade/Telas/tela_avaliador_editar.dart';

part 'package:app_acessibilidade/Classes/Sanitario.dart';
part 'package:app_acessibilidade/Classes/Avaliador.dart';

part 'package:app_acessibilidade/Servicos/sanitario_armazenar.dart';
part 'package:app_acessibilidade/Servicos/autenticacao.dart';
part 'package:app_acessibilidade/Servicos/enviar_email.dart';

part 'package:app_acessibilidade/Widgets/sanitario_header.dart';
part 'package:app_acessibilidade/Widgets/sanitario_widget.dart';
part 'package:app_acessibilidade/Widgets/indicador_carregamento.dart';

class Acessibilidade_app extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    Lista.tag: (context) => Lista(),
    Laudo.tag: (context) => Laudo(),
    ListaImoveis.tag: (context) => ListaImoveis(),
    ListaSanitarios.tag: (context) => ListaSanitarios(),
    Conta.tag: (context) => Conta(),
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
