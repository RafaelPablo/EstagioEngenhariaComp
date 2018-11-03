// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/tela_cadastro_conta.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_acessibilidade/tela_sobre.dart';
import 'tela_lista_imoveis.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
String _email, _senha;
SharedPreferences sharedPreferences;

class Login extends StatefulWidget {
  //Future<String> _message = Future<String>.value('');
  static String tag = 'login';
  _LoginState createState() => _LoginState();
}

Future<String> _SignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print("Acesso Google: $user");

  return '$user';
}

Future<String> _SignInWithEmail() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final FirebaseUser user =
      await _auth.signInWithEmailAndPassword(email: _email, password: _senha);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print("Acesso E-mail: $user");
  return 'signInWithGoogle succeeded: $user';
}

class _LoginState extends State<Login> {
  TextEditingController emailC = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final infoLabel = FlatButton(
      child: Text('Avaliação de Acessibilidade',
          style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator.of(context).pushNamed(About.tag);
      },
    );

    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('imagens/acessibilidadeONU.jpg'),
      ),
    );

    final email = TextFormField(
        controller: emailC,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (value) => _email = value);

    final password = TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Senha',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (value) => _senha = value);

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(ListaImoveis.tag);
              },
              //  onPressed: _SignInWithEmail,
              color: Colors.lightBlueAccent,
              child: Text('Acessar', style: TextStyle(color: Colors.white)),
            )));

    final loginGooButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
//            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: _SignInWithGoogle,
              color: Colors.lightBlueAccent,
              child: Text('Acessar com Google',
                  style: TextStyle(color: Colors.white)),
            )));

    final createLabel = FlatButton(
      child: Text('Criar conta', style: TextStyle(color: Colors.black54)),
      onPressed: () {
        Navigator.of(context).pushNamed(Conta.tag);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          infoLabel,
          logo,
          SizedBox(height: 48.0),
          email,
          SizedBox(height: 8.0),
          password,
          SizedBox(height: 8.0),
          loginButton,
          SizedBox(height: 8.0),
          loginGooButton,
          createLabel
        ],
      )),
    );
  }
}