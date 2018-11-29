/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
//part of acessibilidade_app;
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Telas/tela_sanitario_cadastro.dart';

class Lista extends StatefulWidget {
  static String tag = 'Lista';
  @override
  _ListaState createState() => new _ListaState();
}

class _ListaState extends State<Lista> {
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
                                      child: Icon(Icons.accessible),
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
                  Navigator.of(context).pushNamed(CadastroSanitario.tag);
                })));
  }
}
