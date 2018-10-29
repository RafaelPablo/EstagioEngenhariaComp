// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tela_principal_avaliacao.dart';
import 'tela_cadastro_obra.dart';

class ListaObras extends StatefulWidget {
  static String tag = 'ListaObras';
  _ListaObrasState createState() => _ListaObrasState();
}

//final obraReference = FirebaseDatabase.instance.reference().child('obra');

class _ListaObrasState extends State<ListaObras> {
//  StreamSubscription<Event> _onAdicionarObra;
//  StreamSubscription<Event> _onAlterarObra;
//
//  @override
//  void initState() {
//    super.initState();
//    obras = new List();
//    _onAdicionarObra = obraReference.onChildAdded.listen(_onObraAdicionar);
//    _onAlterarObra = obraReference.onChildChanged.listen(_onObraAtualizar);
//  }

//  @override
//  void dispose() {
//    _onAdicionarObra.cancel();
//    _onAlterarObra.cancel();
//    super.dispose();
//  }

//  void _onTapItem(BuildContext context, Building obra) {
//    Scaffold.of(context).showSnackBar(new SnackBar(
//        content:
//            new Text(obra.identificacao.toString() + ' - ' + obra.logradouro)));
//  }

  Future getObras() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("Obra").getDocuments();

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Obras',
        home: Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.lightBlueAccent,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title: new Text("Obras", style: TextStyle(color: Colors.white)),
            ),
            body: Center(
                child: FutureBuilder(
                    future: getObras(),
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
                                  snapshot.data[index].data["Endereco"],
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
                                        'Obra',
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
                  Navigator.of(context).pushNamed(PrincipalAvaliacao.tag);
                })));
  }
}

//          child: ListView.builder(
//              //itemCount: obras.length,
//              padding: const EdgeInsets.all(15.0),
//              itemBuilder: (context, position) {
//                return Column(
//                  children: <Widget>[
//                    Divider(height: 5.0),
//                    ListTile(
//                      title: Text(
//                      //  '${obras[position].identificacao}',
//                        style: TextStyle(
//                          fontSize: 22.0,
//                          color: Colors.blue,
//                        ),
//                      ),
//                      subtitle: Text(
//                       // '${obras[position].logradouro}, ${obras[position].numero}\n'
//                        //    '${obras[position].cidade} - ${obras[position].estado}',
//                        style: new TextStyle(
//                          fontSize: 18.0,
//                          fontStyle: FontStyle.italic,
//                        ),
//                      ),
//                      leading: Column(
//                        children: <Widget>[
//                          CircleAvatar(
//                            backgroundColor: Colors.blueAccent,
//                            radius: 30.0,
//                            child: Text(
//                              'Obra ${obras[position].chave}',
//                              style: TextStyle(
//                                fontSize: 14.0,
//                                color: Colors.white,
//                              ),
//                            ),
//                          ),
//                          IconButton(
//                            icon: const Icon(Icons.remove_circle_outline),
//                            },
//                          ),
//                        ],
//                      ),
//                      onTap: () => _onTapItem(context, obras[position]),
//                    ),
//                  ],
//                );
//    floatingActionButton: FloatingActionButton(
//    child: Icon(Icons.add),
//    onPressed: () {
//      Navigator.of(context).pushNamed(CadastroObra.tag);
//    }
//      ),
//    )
//    );

//  void _onObraAdicionar(Event event) {
//    setState(() {
//      obras.add(new Building.fromSnapshot(event.snapshot));
//    });
//  }

//  void _onObraAtualizar(Event event) {
//    var oldNoteValue = obras.singleWhere((note) => note.id == event.snapshot.key);
//    setState(() {
//      obras[obras.indexOf(oldNoteValue)] = new Building.fromSnapshot(event.snapshot);
//    });
//  }

//  void _deletarObra(BuildContext context, Building obra int position) async {
//    await obraReference.child(obra.id).remove().then((_) {
//      setState(() {
//        obras.removeAt(position);
//      });
//    });
//  }

//  void _navigavarParaObra(BuildContext context, Building obra) async {
//    await Navigator.push(
//    context,
//      //MaterialPageRoute(builder: (context) => CadastroObra()),
//    );
//  }
