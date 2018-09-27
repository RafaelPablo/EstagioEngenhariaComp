// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'login.dart';
import 'home_page.dart';
import 'acount.dart';
import 'building.dart';
import 'about.dart';

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    HomePage.tag: (context) => HomePage(),
    Acount.tag: (context) => Acount(),
    Building.tag: (context) => Building(),
    About.tag: (context) => About()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avaliação de acessibilidade',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Login(),
      routes: routes,
    );
  }
}
