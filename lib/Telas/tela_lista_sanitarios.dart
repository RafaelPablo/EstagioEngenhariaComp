// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tela_principal_avaliacao_sanitario.dart';
import 'tela_cadastro_imovel.dart';

class ListaSanitarios extends StatefulWidget {
  static String tag = 'ListaSanitarios';
  _ListaSanitariosState createState() => _ListaSanitariosState();
}

class _ListaSanitariosState extends State<ListaSanitarios> {
  Stream<QuerySnapshot> list({int limit, int offset}) {
    Stream<QuerySnapshot> snapshots =
        todoCollection.where('uid', isEqualTo: this.user.uid).snapshots;
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  Future getSanitarios() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("Sanitario").getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sanitários',
        home: Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.lightBlueAccent,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title:
                  new Text("Sanitários", style: TextStyle(color: Colors.white)),
            ),
            body: Center(
                child: FutureBuilder(
                    future: getSanitarios(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return new CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent);
                      } else {
                        return ListView.builder(
                            //itemCount: snapshot.data.lenght,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  snapshot.data[index].data["Identificacao"],
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.data[index].data["Localizacao"],
                                  style: new TextStyle(
                                    fontSize: 18.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
//                                onTap: () {
//                                  Navigator.of(context)
//                                      .pushNamed(PrincipalAvaliacao.tag);
//                                },
                                leading: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      radius: 30.0,
                                      child: Text(
                                        'Sanitário',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                          Icons.remove_circle_outline),
                                      onPressed: () {},
                                      //onTap: () => _onTapItem(context, obras[position]),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    })),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.lightBlueAccent,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(PrincipalAvaliacaoSanitario.tag);
                })));
  }
}
