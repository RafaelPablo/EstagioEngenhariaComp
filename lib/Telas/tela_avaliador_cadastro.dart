/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class AvaliadorCadastro extends StatefulWidget {
  static String tag = 'Avaliador';
  _AvaliadorCadastroState createState() => _AvaliadorCadastroState();
}

class _AvaliadorCadastroState extends State<AvaliadorCadastro> {
  String _registro, _nome, _telefone;
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
      child:
          Text('Cadastrar avaliador', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final name = TextFormField(
        autofocus: false,
        initialValue: '',
        decoration: InputDecoration(
            hintText: 'Nome',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _nome = val;
        });

    final registro = TextFormField(
        autofocus: false,
        initialValue: '',
        decoration: InputDecoration(
            hintText: 'Registro no conselho de classe',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _registro = val;
        });

    final telefone = TextFormField(
        autofocus: false,
        initialValue: '',
        decoration: InputDecoration(
            hintText: 'Telefone',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onSaved: (String val) {
          _telefone = val;
        });

    void _criarConta() {
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference =
            Firestore.instance.collection('avaliador');

        await reference.add({
          "Chave": null,
          "Nome": "$_nome",
          "Registro": "$_registro",
          "Telefone": "$_telefone"
        });
      });
      Navigator.of(context).pushNamed(Principal.tag);
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
              onPressed: () {
                _criarConta();
                new CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent);
              },
              color: Colors.lightBlueAccent,
              child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Cadastrar avaliador",
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
          registro,
          SizedBox(height: 8.0),
          name,
          SizedBox(height: 8.0),
          telefone,
          SizedBox(height: 24.0),
          createButton
        ],
      )),
    );
  }
}
