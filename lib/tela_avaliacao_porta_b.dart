// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'tela_avaliacao_porta_c.dart';

class AvaliacaoPortaB extends StatefulWidget {
  static String tag = 'AvaliacaoPortaB';
  _AvaliacaoPortaBState createState() => _AvaliacaoPortaBState();
}

class _AvaliacaoPortaBState extends State<AvaliacaoPortaB> {
  static bool baAlturaPorta, baVaoLivre = false;

  //Maçanetas

  final pbMacanetas = FlatButton(
    child: Text('Maçanetas\n(NBR 9050:2015 - 4.6.6.1)',
        style: TextStyle(color: Colors.black54), textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxMtipo = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Tipo alavanca',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 100mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMacabamentoA = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Acabamento sem arestas',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMacabamentoB = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Acabamento recurvado nas extremidades',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMdistancia = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Distância mínima de 40mm da superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  //Puxadores Verticais

  final pbPuxadoresVerticais = FlatButton(
    child: Text('Puxadores verticais\n(NBR 9050:2015 - 4.6.6.2)',
        style: TextStyle(color: Colors.black54), textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxPvdiametro = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Diâmetro entre 25mm e 45mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPvafastamento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Afastamento de no mínimo 40mm entre o puxador e a superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPvcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 0,30m',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  //Puxadores Horizontais

  final pbPuxadoresHorizontais = FlatButton(
    child: Text('Puxadores horizontais\n(NBR 9050:2015 - 4.6.6.3)',
        style: TextStyle(color: Colors.black54), textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxPhdiametro = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Diâmetro entre 25mm e 45mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPhinstalado = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Instalado no lado interno da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPhcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 0,40m',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPhafastamento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Afastamento de no mínimo 40mm entre o puxador e a superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPhinstalacao = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Instalação à altura entre 0,80m e 1,10m do piso acabado',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbImagemPorta = Hero(
    tag: 'bImagemPorta',
    child: Image.asset('imagens/macanetasEpuxadores.jpg'),
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
                Navigator.of(context).pushNamed(AvaliacaoPortaC.tag);
              },
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sinalização', style: TextStyle(color: Colors.white)),
                  Icon(Icons.keyboard_arrow_right, color: Colors.white)
                ],
              ),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Porta - Puxadores",
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          pbMacanetas,
          pbCheckBoxMtipo,
          pbCheckBoxMcomprimento,
          pbCheckBoxMacabamentoA,
          pbCheckBoxMacabamentoB,
          pbCheckBoxMdistancia,
          SizedBox(height: 8.0),
          pbPuxadoresVerticais,
          pbCheckBoxPvdiametro,
          pbCheckBoxPvafastamento,
          pbCheckBoxPvcomprimento,
          SizedBox(height: 8.0),
          pbPuxadoresHorizontais,
          pbCheckBoxPhdiametro,
          pbCheckBoxPhinstalado,
          pbCheckBoxPhcomprimento,
          pbCheckBoxPhafastamento,
          pbCheckBoxPhinstalacao,
          SizedBox(height: 8.0),
          pbImagemPorta,
          SizedBox(height: 24.0),
          advanceButton
        ],
      )),
    );
  }
}
