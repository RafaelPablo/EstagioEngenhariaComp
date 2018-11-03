// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/tela_login.dart';

class EditarSanitario extends StatefulWidget {
  static String tag = 'EditarSanitario';
  _EditarSanitarioState createState() => _EditarSanitarioState();
}

class _EditarSanitarioState extends State<EditarSanitario> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('imagens/acessibilidadeONU.jpg'),
      ),
    );

    final descriptionLabel = FlatButton(
      child: Text('Editar Sanitário', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final identificacao = TextFormField(
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'Identificação',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final localizacao = TextFormField(
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'Localização',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final tipoEntrada = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Tipo de entrada',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final tipoSanitario = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Tipo do sanitário',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final createButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
//            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(Login.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Salvar', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Adicionar sanitário",
            style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          SizedBox(height: 48.0),
          descriptionLabel,
          SizedBox(height: 8.0),
          identificacao,
          SizedBox(height: 8.0),
          localizacao,
          SizedBox(height: 8.0),
          tipoEntrada,
          SizedBox(height: 8.0),
          tipoSanitario,
          SizedBox(height: 24.0),
          createButton
        ],
      )),
    );
  }
}
