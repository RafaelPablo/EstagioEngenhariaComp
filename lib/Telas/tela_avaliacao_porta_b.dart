/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class AvaliacaoPortaB extends StatefulWidget {
  static String tag = 'AvaliacaoPortaB';
  _AvaliacaoPortaBState createState() => _AvaliacaoPortaBState();
}

class _AvaliacaoPortaBState extends State<AvaliacaoPortaB> {
  static bool baAlturaPorta, baVaoLivre = false;

  //Maçanetas

  final pbMacanetas = FlatButton(
    child: Text('Maçanetas\n(NBR 9050:2015 - 4.6.6.1)',
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
        textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxMtipo = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Tipo alavanca',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 100mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMcomprimento = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro comprimento?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbCheckBoxMacabamentoA = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Acabamento sem arestas',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMacabamentoB = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Acabamento recurvado nas extremidades',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxMdistancia = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Distância mínima de 40mm da superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMdistancia = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outra distância?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  //Puxadores Verticais

  final pbPuxadoresVerticais = FlatButton(
    child: Text('Puxadores verticais\n(NBR 9050:2015 - 4.6.6.2)',
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
        textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxPvdiametro = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Diâmetro entre 25mm e 45mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMdiametro = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro diâmetro?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbCheckBoxPvafastamento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Afastamento de no mínimo 40mm entre o puxador e a superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPvcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 0,30m',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMcomprimentoV = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro comprimento?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  //Puxadores Horizontais

  final pbPuxadoresHorizontais = FlatButton(
    child: Text('Puxadores horizontais\n(NBR 9050:2015 - 4.6.6.3)',
        style: TextStyle(fontSize: 16.0, color: Colors.black54),
        textAlign: TextAlign.center),
    onPressed: () {},
  );

  final pbCheckBoxPhdiametro = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Diâmetro entre 25mm e 45mm',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMdiametroH = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro diâmetro?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbCheckBoxPhinstalado = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Instalado no lado interno da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbCheckBoxPhcomprimento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Comprimento mínimo de 0,40m',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMcomprimentoH = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro comprimento?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbCheckBoxPhafastamento = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text(
          'Afastamento de no mínimo 40mm entre o puxador e a superfície da porta',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMafastamento = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outro afastamento?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbCheckBoxPhinstalacao = CheckboxListTile(
      value: true,
      onChanged: null,
      title: Text('Instalação à altura entre 0,80m e 1,10m do piso acabado',
          style: TextStyle(fontSize: 14.0, color: Colors.black54)));

  final pbMinstalacao = TextFormField(
    autofocus: false,
    initialValue: '',
    decoration: InputDecoration(
        hintText: 'Outra altura?',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
  );

  final pbImagemPorta = Hero(
    tag: 'bImagemPorta',
    child: Image.asset('imagens/macanetasEpuxadores.jpg'),
  );

  @override
  Widget build(BuildContext context) {
    final advanceButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(AvaliacaoPortaC.tag);
              },
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sinalização', style: TextStyle(color: Colors.white)),
                  Icon(Icons.keyboard_arrow_right, color: Colors.white)
                ],
              ),
            )));

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: new Text("Porta - Puxadores",
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          pbMacanetas,
          pbCheckBoxMtipo,
          pbCheckBoxMcomprimento,
          pbMcomprimento,
          pbCheckBoxMacabamentoA,
          pbCheckBoxMacabamentoB,
          pbCheckBoxMdistancia,
          pbMdistancia,
          SizedBox(height: 20.0),
          pbPuxadoresVerticais,
          pbCheckBoxPvdiametro,
          pbMdiametro,
          pbCheckBoxPvafastamento,
          pbCheckBoxPvcomprimento,
          pbMcomprimentoV,
          SizedBox(height: 20.0),
          pbPuxadoresHorizontais,
          pbCheckBoxPhdiametro,
          pbMdiametroH,
          pbCheckBoxPhinstalado,
          pbCheckBoxPhcomprimento,
          pbMcomprimentoH,
          pbCheckBoxPhafastamento,
          pbMafastamento,
          pbCheckBoxPhinstalacao,
          pbMinstalacao,
          SizedBox(height: 8.0),
          pbImagemPorta,
          SizedBox(height: 24.0),
          advanceButton
        ],
      )),
    );
  }
}
