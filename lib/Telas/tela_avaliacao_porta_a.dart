// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'tela_avaliacao_porta_b.dart';

class AvaliacaoPortaA extends StatefulWidget {
  static String tag = 'AvaliacaoPortaA';
  _AvaliacaoPortaAState createState() => _AvaliacaoPortaAState();
}

class _AvaliacaoPortaAState extends State<AvaliacaoPortaA> {
  static bool baAlturaPorta, baVaoLivre = false;

  final descriptionLabel = FlatButton(
    child: Text('Características',
        style: TextStyle(fontSize: 16.0, color: Colors.black54)),
    onPressed: () {},
  );

  final paCheckBoxAlturaPorta = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Possui altura de 2,10m.\n (NBR 9050:2015 - 6.11.2.4)',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final paAlturaPorta = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outra altura?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final paCheckBoxVaoLivrePorta = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Vão livre de 0,80m (também para porta sanfonada).\n (NBR 9050:2015 - 6.11.2.4)',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final paVaoLivrePorta = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro vão livre?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 2.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final paCheckBoxTravamentoPorta = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Travamento da porta deve atender os princípios do desenho universal.\n (NBR 9050:2015 - 7.5-h e 4.6.8)',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final paCheckBoxRevestimentoInferiorPorta = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Há revestimento resistente a impactos na parte inferior, no lado oposto ao lado da abertura, até a altura de 0,40m a partir do piso.\n (NBR 9050:2015 - 6.11.2.6)',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final paImagemPorta = Hero(
    tag: 'aImagemPorta',
    child: Image.asset('imagens/portaComRevestimentoEpuxadorHorizontal.jpg'),
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
                Navigator.of(context).pushNamed(AvaliacaoPortaB.tag);
              },
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Puxadores', style: TextStyle(color: Colors.white)),
                  Icon(Icons.keyboard_arrow_right, color: Colors.white)
                ],
              ),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Porta - Dimensão e maçanetas",
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
            paCheckBoxAlturaPorta,
            paAlturaPorta,
            SizedBox(height: 8.0),
            paCheckBoxVaoLivrePorta,
            paVaoLivrePorta,
            SizedBox(height: 8.0),
            paCheckBoxTravamentoPorta,
            SizedBox(height: 8.0),
            paCheckBoxRevestimentoInferiorPorta,
            SizedBox(height: 8.0),
            paImagemPorta,
            SizedBox(height: 24.0),
            advanceButton,
          ],
        ),
      ),
    );
  }
}
