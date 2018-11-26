/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class About extends StatelessWidget {
  static String tag = 'about';

  @override
  Widget build(BuildContext context) {
    final acessibilidade = Hero(
      tag: 'acessibilidade',
      child: Padding(
        padding: EdgeInsets.all(36.0),
        child: CircleAvatar(
          radius: 48.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('imagens/acessibilidadeONU.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Sobre',
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
          'Este aplicativo foi desenvolvido pelo acadêmico Rafael Pablo Massocato, '
          'durante o Estágio Curricular do Curso de Engenharia de Computação '
          'da Universidade do Oeste de Santa Catarina, com base na pesquisa realizada '
          'pelas professoras Angela Zamboni Piovesan e Rogeria Ramos. Seu objetivo é '
          'auxiliar na avaliação e registro de acessibilidade especial em edificações públicas.',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          )),
    );

    final backButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Material(
            borderRadius: BorderRadius.circular(30.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: () {
                Navigator.of(context).pushNamed(Login.tag);
              },
              child: Text('Voltar',
                  style: TextStyle(color: Colors.lightBlueAccent)),
            )));

    final rights = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Versão 1.0.0',
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
    );

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
          acessibilidade,
          welcome,
          lorem,
          backButton,
          rights
        ]));

    return new Scaffold(
      body: body,
    );
  }
}
