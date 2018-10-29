// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'tela_principal_avaliacao.dart';

class AvaliacaoPortaC extends StatefulWidget {
  static String tag = 'AvaliacaoPortaC';
  _AvaliacaoPortaCState createState() => _AvaliacaoPortaCState();
}

class _AvaliacaoPortaCState extends State<AvaliacaoPortaC> {
  final descriptionLabel = FlatButton(
    child: Text('NBR 9050:2015 - 5.3.5.3',
        style: TextStyle(color: Colors.black54)),
    onPressed: () {},
  );

  final pcCheckBoxSanitarioFeminino = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Sanitário feminino acessível',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pcImagemSanitarioFeminino = Hero(
    tag: 'aImagemSanitarioFeminino',
    child: Image.asset('imagens/sanitarioFemininoAcessivel.png',
        fit: BoxFit.scaleDown),
  );

  final pcCheckBoxSanitarioMasculino = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Sanitário masculino acessível',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pcImagemSanitarioMasculino = Hero(
    tag: 'aImagemSanitarioMasculino',
    child: Image.asset('imagens/sanitarioMasculinoAcessivel.png',
        fit: BoxFit.scaleDown),
  );

  final pcCheckBoxSanitarioFamiliar = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Sanitário familiar acessível',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pcImagemSanitarioFamiliar = Hero(
    tag: 'aImagemSanitarioFamiliar',
    child: Image.asset('imagens/sanitarioFamiliarAcessivel.png',
        fit: BoxFit.scaleDown),
  );

  @override
  Widget build(BuildContext context) {
    final advanceButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(PrincipalAvaliacao.tag);
              },
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ambiente', style: TextStyle(color: Colors.white)),
                  Icon(Icons.keyboard_arrow_right, color: Colors.white)
                ],
              ),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Porta - Sinalização",
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          descriptionLabel,
          SizedBox(height: 8.0),
          pcCheckBoxSanitarioFeminino,
          pcImagemSanitarioFeminino,
          SizedBox(height: 8.0),
          pcCheckBoxSanitarioMasculino,
          pcImagemSanitarioMasculino,
          SizedBox(height: 8.0),
          pcCheckBoxSanitarioFamiliar,
          pcImagemSanitarioFamiliar,
          SizedBox(height: 24.0),
          advanceButton
        ],
      )),
    );
  }
}
