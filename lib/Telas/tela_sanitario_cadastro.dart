/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
//part of acessibilidade_app;
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Servicos/database.dart';
import 'package:app_acessibilidade/Classes/Sanitario.dart';

class CadastroSanitario extends StatefulWidget {
  static String tag = 'CadastroSanitario';
  _CadastroSanitarioState createState() => _CadastroSanitarioState();
}

class _CadastroSanitarioState extends State<CadastroSanitario> {
  var db = new dbDatabase();
  var tipoSanitarioC = new TextEditingController();
  var tipoEntradaC = new TextEditingController();
  var localizacaoC = new TextEditingController();
  var identificacaoC = new TextEditingController();

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
      child:
          Text('Adicionar Sanitário', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final identificacao = TextFormField(
      autofocus: false,
      controller: identificacaoC,
      decoration: InputDecoration(
          hintText: 'Identificação',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final localizacao = TextField(
      //autofocus: false,
      controller: localizacaoC,
      decoration: InputDecoration(
          hintText: 'Localização',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//      onChanged(value){
//        this.localizacaoC = value;
//    },
    );

    final tipoEntrada = TextFormField(
      autofocus: false,
      controller: tipoEntradaC,
      decoration: InputDecoration(
          hintText: 'Tipo de entrada',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final tipoSanitario = TextFormField(
      autofocus: false,
      controller: tipoSanitarioC,
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
              onPressed: _createSanitario,
              color: Colors.lightBlueAccent,
              child: Text('Adicionar sanitário',
                  style: TextStyle(color: Colors.white)),
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

  Future _createSanitario() async {
    int savedSanitario = await db.saveSanitario(new Sanitario(
        1,
        identificacaoC.text,
        localizacaoC.text,
        tipoEntradaC.text,
        tipoSanitarioC.text));

    print("Sanitario salvo $savedSanitario");
  }
}
