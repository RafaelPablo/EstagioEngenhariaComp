// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'tela_avaliacao_porta_a.dart';
import 'tela_cadastro_sanitario.dart';
import 'dart:async';

class PrincipalAvaliacaoSanitario extends StatefulWidget {
  static String tag = 'PrincipalAvaliacaoSanitario';
  _PrincipalAvaliacaoSanitarioState createState() =>
      _PrincipalAvaliacaoSanitarioState();
}

class _PrincipalAvaliacaoSanitarioState
    extends State<PrincipalAvaliacaoSanitario> {
  final logo = Hero(
    tag: 'logo',
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 28.0,
      child: Image.asset('imagens/acessibilidadeONU.jpg'),
    ),
  );

  final opcaoLabel = FlatButton(
    child:
        Text('Selecione para avaliar', style: TextStyle(color: Colors.black54)),
    onPressed: () {
      // Navigator.of(context).pushNamed(Conta.tag);
    },
  );

  Future<Null> _mensagemAlerta() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Avaliação de acessibilidade'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Essa funcionalidade ainda está em desenvolvimento.'),
                Text('Aguarde uma nova versão...'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final portaButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(AvaliacaoPortaA.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Porta', style: TextStyle(color: Colors.white)),
            )));

    final ambienteButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _mensagemAlerta,
              color: Colors.lightBlueAccent,
              child: Text('Ambiente', style: TextStyle(color: Colors.white)),
            )));

    final acessoriosButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _mensagemAlerta,
              color: Colors.lightBlueAccent,
              child: Text('Acessórios', style: TextStyle(color: Colors.white)),
            )));

    final resultadoButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlue.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _mensagemAlerta,
              color: Colors.lightBlue,
              child: Text('Resultado', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: new Text("Avaliar sanitário",
              style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(CadastroSanitario.tag);
              },
            ),
          ]),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          SizedBox(height: 2.0),
          opcaoLabel,
          SizedBox(height: 2.0),
          portaButton,
          SizedBox(height: 2.0),
          acessoriosButton,
          SizedBox(height: 2.0),
          ambienteButton,
          SizedBox(height: 2.0),
          resultadoButton
        ],
      )),
    );
  }
}
