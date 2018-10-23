// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Rafael Pablo Massocato
// Engenharia de Computação 2018
// Aplicativo para avaliação de acessibilidade
import 'package:flutter/material.dart';
import 'package:app_acessibilidade/Classes/building.dart';
import 'package:firebase_database/firebase_database.dart';

List _estados = ["SC", "RS", "PR", "SP", "RJ"];

List<DropdownMenuItem<String>> _dropDownMenuItems;
String _currentUF = _dropDownMenuItems[0].value;

class BuildingScreen extends StatefulWidget {
  final Building building;
  BuildingScreen(this.building);
  @override
  static String tag = 'building_screen';

  _BuildingScreenState createState() => _BuildingScreenState();
}

final obraReference = FirebaseDatabase.instance.reference().child('obra');

class _BuildingScreenState extends State<BuildingScreen> {
  @override
  TextEditingController _identificacaoController,
      _logradouroController,
      _numeroController,
      _bairroController,
      _cidadeController,
      _cepController,
      _ufController,
      _tipoController,
      _obsController;

  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getDropDownMenuItems() {
      List<DropdownMenuItem<String>> items = new List();
      for (String estado in _estados) {
        // here we are creating the drop down menu items, you can customize the item right here
        // but I'll just use a simple text for this
        items.add(new DropdownMenuItem(value: estado, child: new Text(estado)));
      }
      return items;
    }

    @override
    void initState() {
      super.initState();

      _identificacaoController =
          new TextEditingController(text: widget.building.identificacao);
      _logradouroController =
          new TextEditingController(text: widget.building.logradouro);
      _numeroController =
          new TextEditingController(text: widget.building.numero);
      _bairroController =
          new TextEditingController(text: widget.building.bairro);
      _cidadeController =
          new TextEditingController(text: widget.building.cidade);
      _ufController = new TextEditingController(text: widget.building.estado);
      _cepController = new TextEditingController(text: widget.building.cep);
      _tipoController = new TextEditingController(text: widget.building.tipo);
      _obsController = new TextEditingController(text: widget.building.obs);

      void changedDropDownItem(String selectedCity) {
        print("Estado selecionado: $selectedCity, recarregando a interface");
        setState(() {
          _currentUF = selectedCity;
        });
      }

      final logo = Hero(
        tag: 'logo',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('imagens/acessibilidadeONU.jpg'),
        ),
      );

      final descriptionLabel = FlatButton(
        child: Text('Registrar Obra', style: TextStyle(color: Colors.black54)),
        onPressed: () {},
      );

      final identificacao = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _identificacaoController,
        decoration: InputDecoration(
            hintText: 'Identificação',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final logradouro = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _logradouroController,
        decoration: InputDecoration(
            hintText: 'Logradouro',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final numero = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _numeroController,
        decoration: InputDecoration(
            hintText: 'Número',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final bairro = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _bairroController,
        decoration: InputDecoration(
            hintText: 'Bairro',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final cidade = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _cidadeController,
        decoration: InputDecoration(
            hintText: 'Cidade',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

/*    final uf = DropdownButton(
      value: _currentUF,
      items: _dropDownMenuItems,
      onChanged: changedDropDownItem,
    );*/

      final uf = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _ufController,
        decoration: InputDecoration(
            hintText: 'Estado',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final cep = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _cepController,
        decoration: InputDecoration(
            hintText: 'CEP',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final tipo = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _tipoController,
        decoration: InputDecoration(
            hintText: 'Tipo',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final obs = TextFormField(
        autofocus: false,
        initialValue: '',
        controller: _obsController,
        decoration: InputDecoration(
            hintText: 'Obs',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );

      final createButton = Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.lightBlueAccent.shade100,
//            elevation: 5.0,
              child: MaterialButton(
                minWidth: 200.0,
                height: 42.0,
                child: (widget.building.id != null)
                    ? Text('Alterar', style: TextStyle(color: Colors.white))
                    : Text('Registrar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (widget.building.id != null) {
                    obraReference.child(widget.building.id).set({
                      'identificacao': _identificacaoController.text,
                      'logradouro': _logradouroController.text,
                      'numero': _numeroController,
                      'bairro': _bairroController,
                      'cidade': _cidadeController,
                      'estado': _ufController,
                      'cep': _cepController,
                      'tipo': _tipoController,
                      'obs': _obsController
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    obraReference.push().set({
                      'identificacao': _identificacaoController.text,
                      'logradouro': _logradouroController.text,
                      'numero': _numeroController,
                      'bairro': _bairroController,
                      'cidade': _cidadeController,
                      'estado': _ufController,
                      'cep': _cepController,
                      'tipo': _tipoController,
                      'obs': _obsController
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                color: Colors.lightBlueAccent,
              )));

      Widget build(BuildContext context) {
        return Scaffold(
          appBar: new AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: new Text("Registrar obra",
                style: TextStyle(color: Colors.white)),
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
    }
  }
}
