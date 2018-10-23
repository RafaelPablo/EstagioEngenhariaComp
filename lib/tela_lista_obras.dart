// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Classes/building.dart';
import 'building_screen.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  @override
  static String tag = 'homepage';
  _HomePageState createState() => _HomePageState();
}

final obraReference = FirebaseDatabase.instance.reference().child('obra');

class _HomePageState extends State<HomePage> {
  List<Building> obras;
  StreamSubscription<Event> _onAdicionarObra;
  StreamSubscription<Event> _onAlterarObra;

  @override
  void initState() {
    super.initState();
    obras = new List();
    _onAdicionarObra = obraReference.onChildAdded.listen(_onObraAdicionar);
    _onAlterarObra = obraReference.onChildChanged.listen(_onObraAtualizar);
  }

  @override
  void dispose() {
    _onAdicionarObra.cancel();
    _onAlterarObra.cancel();
    super.dispose();
  }

  void _onTapItem(BuildContext context, Building obra) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content:
            new Text(obra.identificacao.toString() + ' - ' + obra.logradouro)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obras',
      home: Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: new Text("Obras", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: obras.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${obras[position].identificacao}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text(
                        '${obras[position].logradouro}, ${obras[position].numero}\n'
                            '${obras[position].cidade} - ${obras[position].estado}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 30.0,
                            child: Text(
                              'Obra ${obras[position].chave}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
//                          IconButton(
//                            icon: const Icon(Icons.remove_circle_outline),
//                            },
//                          ),
                        ],
                      ),
                      onTap: () => _onTapItem(context, obras[position]),
                    ),
                  ],
                );
              }),
        ),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => _criarNovaObra(context),
      ),
    )
    );
  }

  void _onObraAdicionar(Event event) {
    setState(() {
      obras.add(new Building.fromSnapshot(event.snapshot));
    });
  }

  void _onObraAtualizar(Event event) {
    var oldNoteValue = obras.singleWhere((note) => note.id == event.snapshot.key);
    setState(() {
      obras[obras.indexOf(oldNoteValue)] = new Building.fromSnapshot(event.snapshot);
    });
  }

  void _deletarObra(BuildContext context, Building obra int position) async {
    await obraReference.child(obra.id).remove().then((_) {
      setState(() {
        obras.removeAt(position);
      });
    });
  }

  void _navigavarParaObra(BuildContext context, Building obra) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuildingScreen(obra)),
    );
  }

  void _criarNovaObra(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuildingScreen(Building(null, null, null, '', '', '', '', '', '', '', '', ''))),
    );
  }
}
