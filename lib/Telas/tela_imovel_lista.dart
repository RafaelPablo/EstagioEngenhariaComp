/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
//part of acessibilidade_app;
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Telas/tela_principal.dart';
import 'package:app_acessibilidade/Telas/tela_avaliador_cadastro.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_cadastro.dart';
import 'package:app_acessibilidade/Classes/Imovel.dart';
import 'package:app_acessibilidade/Servicos/database.dart';

class ListaImoveis extends StatefulWidget {
  static String tag = 'ListaImoveis';
  _ListaImoveisState createState() => _ListaImoveisState();
}

class _ListaImoveisState extends State<ListaImoveis> {
//  Future getImoveis() async {
//    var firestore = Firestore.instance;
//    QuerySnapshot qn = await firestore.collection("Imovel").getDocuments();
//    return qn.documents;
//  }
  var db = new dbDatabase();
  List _imoveis;

  Future getImoveis() async {
    _imoveis = await db.getAllImovels();
    for (int i = 0; i < _imoveis?.length ?? 0; i++) {
      Imovel imovel = Imovel.map(_imoveis[i]);
    }
    return _imoveis;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Imóveis',
        home: Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.lightBlueAccent,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title: new Text("Imóveis", style: TextStyle(color: Colors.white)),
            ),
            drawer: new Drawer(
              child: new ListView(
                primary: false,
                children: <Widget>[
                  new DrawerHeader(
                    child: new Center(
                      child: new Text(
                        "Menu",
                        // style: themeData.textTheme.title,
                      ),
                    ),
                  ),
                  new ListTile(
                    title: const Text('Avaliador', textAlign: TextAlign.right),
                    trailing: const Icon(Icons.assignment_ind),
                    onTap: () async {
                      Navigator.of(context).pushNamed(AvaliadorCadastro.tag);
                    },
                  ),
                  new ListTile(
                    title: const Text('Logout', textAlign: TextAlign.right),
                    trailing: const Icon(Icons.exit_to_app),
                    onTap: () async {
                      //await signOutWithGoogle();
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                  ),
                ],
              ),
            ),
            body: Center(
                child: FutureBuilder(
                    future: getImoveis(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return new CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent);
                      } else {
                        return ListView.builder(
                            itemCount: _imoveis?.length ?? 0,
                            itemBuilder: (_, int position) {
                              return ListTile(
                                title: Text(
                                  Imovel.fromMap(_imoveis[position])
                                          .identificacao ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.blue,
                                  ),
                                ),
                                subtitle: Text(
                                  "${Imovel.fromMap(_imoveis[position]).logradouro}, ${Imovel.fromMap(_imoveis[position]).numero}" ??
                                      '',
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
                                        'Imóvel',
                                        style: TextStyle(
                                          fontSize: 14.0,
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
                  //Navigator.of(context).pushNamed(Principal.tag);
                  Navigator.of(context).pushNamed(CadastroImovel.tag);
                })));
  }
}
