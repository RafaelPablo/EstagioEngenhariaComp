/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class Laudo extends StatelessWidget {
  static String tag = 'laudo';
  @override
  Widget build(BuildContext context) {
    final pdf = new PDFDocument();
    final page = new PDFPage(pdf, pageFormat: PDFPageFormat.letter);
    final g = page.getGraphics();
    final font = new PDFFont(pdf);

    g.setColor(new PDFColor(0.0, 1.0, 1.0));
    g.drawRect(50.0, 30.0, 100.0, 50.0);
    g.fillPath();

    g.setColor(new PDFColor(0.3, 0.3, 0.3));
    g.drawString(
        font, 12.0, "Resultado da avaliação!", 5.0 * PDFPageFormat.mm, 300.0);

    // var file = new File('file.pdf');
    // file.writeAsBytesSync(pdf.save());

    final logo = Hero(
      tag: 'logo',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('imagens/acessibilidadeONU.jpg'),
      ),
    );

    final titulo = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Resultado da avaliação',
          style: TextStyle(color: Colors.black54)),
    );

    final a = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Possui altura de 2,10m. Outro: 2,20 m\n :SIM.(NBR 9050:2015 - 6.11.2.4)\n'
          'Vão livre de 0,80m (também para porta sanfonada)\n :SIM.(NBR 9050:2015 - 6.11.2.4)\n'
          'Travamento da porta deve atender os princípios do desenho universal.\n :SIM.(NBR 9050:2015 - 7.5-h e 4.6.8)'
          'Há revestimento resistente a impactos na parte inferior, no lado oposto ao lado da abertura, até a altura de 0,40m a partir do piso.\n :SIM (NBR 9050:2015 - 6.11.2.6)',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final b = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Maçanetas(NBR 9050:2015 - 4.6.6.1):\n'
          'Tipo alavanca :SIM\n'
          'Comprimento mínimo de 100mm :SIM \n'
          'Acabamento sem arestas :SIM \n'
          'Acabamento recurvado nas extremidades :SIM \n'
          'Distância mínima de 40mm da superfície da porta :SIM \n\n'
          'Puxadores verticais(NBR 9050:2015 - 4.6.6.2):\n'
          'Diâmetro entre 25mm e 45mm :SIM\n'
          'Afastamento de no mínimo 40mm entre o puxador e a superfície da porta :SIM\n'
          'Comprimento mínimo de 0,30m :SIM\n',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final c = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'NBR 9050:2015 - 5.3.5.3\n'
          'Sanitário feminino acessível :SIM\n',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final resultado = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'A porta do sanitário : Sala 202\n'
          'localizado no imóvel Edifício Gabriel, Rua Felipe Schimidt, nº 479\n'
          'ESTÁ EM CONFORMIDADE com norma de acessibilidade NBR 9050:2015',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final datahora = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Data: 12/11/2018\n'
          'Hora: 4:20',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final avaliador = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Avaliador: '
          'Chris Cornell',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    void _criarConta() {
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference =
            Firestore.instance.collection('avaliador');

        await reference.add({
          "Chave": null,
//          "Nome": "$_nome",
//          "Registro": "$_registro",
//          "Telefone": "$_telefone"
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
              child: Text('Enviar Resultado',
                  style: TextStyle(color: Colors.white)),
            )));

    final body = Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]),
        ),
        child: Column(children: <Widget>[
          titulo,
          a,
          b,
          c,
          resultado,
          datahora,
          avaliador,
          createButton
        ]));

    return new Scaffold(
      body: body,
    );
  }
}
