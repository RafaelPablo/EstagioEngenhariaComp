// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/tela_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Conta extends StatefulWidget {
  static String tag = 'Conta';
  _ContaState createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  String _registro, _nome, _email, _senha, _telefone;
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
        onSaved: (String val) {
          _nome = val;
        });

    final registro = TextFormField(
        autofocus: false,
        initialValue: '',
        decoration: InputDecoration(
            hintText: 'Registro no conselho de classe',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _registro = val;
        });

    final telefone = TextFormField(
        autofocus: false,
        initialValue: '',
        decoration: InputDecoration(
            hintText: 'Telefone',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _telefone = val;
        });

    final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _email = val;
        });

    final password = TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Senha',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _senha = val;
        });

    void _criarConta() {
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference =
            Firestore.instance.collection('avaliador');

        await reference.add({
          "Chave": null,
          "Nome": "$_nome",
          "Email": "$_email",
          "Senha": "$_senha",
          "Registro": "$_registro",
          "Telefone": "$_telefone"
        });
      });
      Navigator.of(context).pushNamed(Login.tag);
    }

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
                _criarConta();
                new CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent);
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
          registro,
          SizedBox(height: 8.0),
          name,
          SizedBox(height: 8.0),
          telefone,
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
