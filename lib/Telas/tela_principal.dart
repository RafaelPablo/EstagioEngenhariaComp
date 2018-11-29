/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
//part of acessibilidade_app;
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_lista.dart';
import 'package:app_acessibilidade/Telas/tela_laudo.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_editar.dart';

class Principal extends StatefulWidget {
  static String tag = 'PrincipalAvaliacao';
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
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
    final acessoButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _mensagemAlerta,
              color: Colors.lightBlueAccent,
              child: Text('Acesso', style: TextStyle(color: Colors.white)),
            )));

    final sanitarioButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(ListaSanitarios.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Sanitários', style: TextStyle(color: Colors.white)),
            )));

    final resultadoButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlue.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(Laudo.tag);
              },
              color: Colors.lightBlue,
              child: Text('Resultado', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title:
              new Text("Avaliar imóvel", style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(EditarImovel.tag);
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
          acessoButton,
          SizedBox(height: 2.0),
          sanitarioButton,
          SizedBox(height: 2.0),
          resultadoButton,
          SizedBox(height: 2.0),
        ],
      )),
    );
  }
}
