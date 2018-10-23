// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/login_screen.dart';

class About extends StatelessWidget {
  static String tag = 'about';

  @override
  Widget build(BuildContext context) {
    final acessibilidade = Hero(
      tag: 'acessibilidade',
      child: Padding(
        padding: EdgeInsets.all(36.0),
        child: CircleAvatar(
          radius: 48.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('imagens/acessibilidadeONU.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Sobre',
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.',
          style: TextStyle(fontSize: 14.0, color: Colors.white)),
    );

    final backButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(Login.tag);
              },
              child: Text('Voltar',
                  style: TextStyle(color: Colors.lightBlueAccent)),
            )));

    final rights = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Todos os direitos reservados.',
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );

    final body = Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]),
        ),
        child: Column(children: <Widget>[
          acessibilidade,
          welcome,
          lorem,
          backButton,
          rights
        ]));

    return new Scaffold(
      body: body,
    );
  }
}
