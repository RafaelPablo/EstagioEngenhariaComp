// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'home_page.dart';

class Acount extends StatefulWidget {
  @override
  static String tag = 'acount';
  _AcountState createState() => _AcountState();
}

class _AcountState extends State<Acount> {
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
      child: Text('Criar conta', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final name = TextFormField(
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'Nome',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Senha',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final createButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(HomePage.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Criar Conta', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Criar conta", style: TextStyle(color: Colors.white)),
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
          name,
          SizedBox(height: 8.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 24.0),
          createButton
        ],
      )),
    );
  }
}
