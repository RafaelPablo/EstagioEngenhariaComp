/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Servicos/database.dart';
import 'package:app_acessibilidade/Classes/Imovel.dart';
import 'package:app_acessibilidade/Telas/tela_imovel_lista.dart';

class CadastroImovel extends StatefulWidget {
  static String tag = 'CadastroImovel';
  _CadastroImovelState createState() => _CadastroImovelState();
}

class _CadastroImovelState extends State<CadastroImovel> {
  var db = new dbDatabase();
  String _identificacao,
      _emailResponsavel,
      _logradouro,
      _numero,
      _bairro,
      _cidade,
      _estado,
      _uf,
      _cep,
      _tipo,
      _obs;

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
      child: Text('Registrar Imóvel', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final identificacao = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Identificação',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _identificacao = val;
        });

    final emailResponsavel = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Email do responsável',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _emailResponsavel = val;
        });

    final logradouro = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Logradouro',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _logradouro = val;
        });

    final numero = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Número',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _numero = val;
        });

    final bairro = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Bairro',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _bairro = val;
        });

    final cidade = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Cidade',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _cidade = val;
        });

    final uf = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Estado',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _estado = val;
        });

    final cep = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'CEP',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _cep = val;
        });

    final tipo = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Tipo',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _tipo = val;
        });

    final obs = TextFormField(
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Obs',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _obs = val;
        });

    void _criarImovel() {
      new CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent);
      _createImovel();
      Navigator.of(context).pushNamed(ListaImoveis.tag);
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
              onPressed: _criarImovel,
              color: Colors.lightBlueAccent,
              child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title:
            new Text("Registrar imóvel", style: TextStyle(color: Colors.white)),
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
          identificacao,
          SizedBox(height: 8.0),
          emailResponsavel,
          SizedBox(height: 8.0),
          logradouro,
          SizedBox(height: 8.0),
          numero,
          SizedBox(height: 8.0),
          bairro,
          SizedBox(height: 8.0),
          cidade,
          SizedBox(height: 8.0),
          uf,
          SizedBox(height: 8.0),
          cep,
          SizedBox(height: 8.0),
          tipo,
          SizedBox(height: 8.0),
          obs,
          SizedBox(height: 24.0),
          createButton
        ],
      )),
    );
  }

  Future _createImovel() async {
    int quantidadeImoveis = await db.getCountImovels();
    if (quantidadeImoveis = null) quantidadeImoveis = 0;

    int savedImovel = await db.saveImovel(new Imovel(
        quantidadeImoveis + 1,
        _identificacao,
        _emailResponsavel,
        _logradouro,
        _numero,
        _bairro,
        _cidade,
        _uf,
        _cep,
        _tipo,
        _obs));

    print("Imovel salvo $savedImovel");
  }
}
