// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'acount.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  static String tag = 'login';
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _senha;
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

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      validator: (value) =>
          value.isEmpty ? 'O e-mail deve ser preenchido' : null,
      onSaved: (value) => _email = value,
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      validator: (value) =>
          value.isEmpty ? 'A senha deve ser preenchida' : null,
      onSaved: (value) => _senha = value,
      decoration: InputDecoration(
          labelText: 'Senha',
          hintText: 'Senha',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final formKey = new GlobalKey<FormState>();

    bool validarLogar() {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    void validarEnviar() async {
      if (validarLogar()) {
        try {
          FirebaseUser user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _senha);
          print('Acessou, id: ${user.uid}');
        } catch (e) {
          print('Erro: $e');
        }
      }
    }

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: validarEnviar,
              //Navigator.of(context).pushNamed(HomePage.tag);
              color: Colors.lightBlueAccent,
              child: Text('Acessar', style: TextStyle(color: Colors.white)),
            )));

    final createLabel = FlatButton(
      child: Text('Criar conta', style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator.of(context).pushNamed(Acount.tag);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          logo,
          SizedBox(height: 48.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 24.0),
          loginButton,
          createLabel
        ],
      )),
    );
  }
}
