/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

enum TypeFilter {
  TODOS,
  NAOAVALIADOS,
  AVALIADOS,
}

class ListaSanitarios extends StatefulWidget {
  static String tag = 'ListaSanitarios';
  @override
  State<StatefulWidget> createState() => new ListaSanitariosState();
}

class ListaSanitariosState extends State<ListaSanitarios> {
  TypeFilter typeFilter;
  List<Sanitario> sanitarios;
  Set<String> disabledSanitarios;
  StreamSubscription<QuerySnapshot> sanitarioSub;
  SanitarioStorage sanitarioStorage;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    typeFilter = TypeFilter.TODOS;
    sanitarios = [];
    disabledSanitarios = new Set();

    _auth.currentUser().then((FirebaseUser user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed('/');
      } else {
        sanitarioStorage = new SanitarioStorage.forUser(user: user);
        sanitarioSub?.cancel();
        sanitarioSub = sanitarioStorage.list().listen((QuerySnapshot snapshot) {
          final List<Sanitario> sanitarios = snapshot.documents
              .map(SanitarioStorage.fromDocument)
              .toList(growable: false);
          setState(() {
            this.sanitarios = sanitarios;
          });
        });

        setState(() {
          this.user = user;
        });
      }
    });
  }

  @override
  void dispose() {
    sanitarioSub?.cancel();
    super.dispose();
  }

  void setFilter(TypeFilter filter) {
    setState(() {
      typeFilter = filter;
    });
  }

  Widget buildToggleButton(TypeFilter type, String text) {
    final bool enabled = type == typeFilter;

    Widget button = new MaterialButton(
      key: new Key('filter-button-${text.toLowerCase()}'),
      textColor: enabled ? Colors.black : Colors.grey,
      child: new Text(text),
      onPressed: () => setFilter(type),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      minWidth: 0.0,
    );

    if (enabled) {
      button = new Container(
        decoration: new BoxDecoration(
          border: new Border.all(),
          borderRadius: new BorderRadius.circular(3.0),
        ),
        child: button,
      );
    }

    return button;
  }

  Widget buildContent(int remainingActive) {
    if (user == null) {
      return new IndicadorCarregamento();
    } else {
      final bool onlyNaoAvaliados = typeFilter == TypeFilter.NAOAVALIADOS;
      final List<Sanitario> visibleSanitarios = typeFilter == TypeFilter.TODOS
          ? sanitarios
          : sanitarios
              .where((t) => t.completed != onlyNaoAvaliados)
              .toList(growable: false);

      final bool allCompleted = sanitarios.isNotEmpty && remainingActive == 0;

      return new Column(
        children: <Widget>[
//          new SanitarioHeaderWidget(
//            key: new Key('sanitario-header'),
//            showToggleAll: sanitarios.length > 0,
//            toggleAllActive: allCompleted,
//            onChangeToggleAll: () {
//              this._toggleAll(!allCompleted);
//            },
//            onAddSanitario: this._createSanitario,
//          ),
          new Expanded(
            flex: 2,
            child: new ListView.builder(
              key: const Key('sanitario-list'),
              itemCount: visibleSanitarios.length,
              itemBuilder: _buildSanitarios(visibleSanitarios),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final int remainingActive = sanitarios.where((t) => !t.completed).length;

    final ThemeData themeData = Theme.of(context);

    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.lightBlueAccent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: new Text("Sanitários", style: TextStyle(color: Colors.white)),
        ),
        drawer: new Drawer(
          child: new ListView(
            primary: false,
            children: <Widget>[
              new DrawerHeader(
                child: new Center(
                  child: new Text(
                    "Menu",
                    style: themeData.textTheme.title,
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
                  await signOutWithGoogle();
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
        body: buildContent(remainingActive),
        bottomNavigationBar: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.centerStart,
            children: <Widget>[
              new Text(
                  '$remainingActive item${remainingActive == 1 ? '' : 's'} left'),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildToggleButton(TypeFilter.TODOS, 'Todos'),
                  buildToggleButton(TypeFilter.NAOAVALIADOS, 'Não avaliados'),
                  buildToggleButton(TypeFilter.AVALIADOS, 'Avalaidos'),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushNamed(PrincipalAvaliacaoSanitario.tag);
            }));
  }

  IndexedWidgetBuilder _buildSanitarios(List<Sanitario> sanitarios) {
    return (BuildContext context, int idx) {
      final Sanitario sanitario = sanitarios[idx];
      return new SanitarioWidget(
        key: new Key('sanitario-${sanitario.id}'),
        sanitario: sanitario,
        disabled: disabledSanitarios.contains(sanitario.id),
        onToggle: (completed) {
          this._toggleSanitario(sanitario, completed);
        },
        onIdentificacaoChanged: (newIdentificacao) {
          this._editSanitario(sanitario, newIdentificacao);
        },
        onDelete: () {
          this._deleteSanitario(sanitario);
        },
      );
    };
  }

  void _disableSanitario(Sanitario sanitario) {
    setState(() {
      disabledSanitarios.add(sanitario.id);
    });
  }

  void _enabledSanitario(Sanitario sanitario) {
    setState(() {
      disabledSanitarios.remove(sanitario.id);
    });
  }

  void _toggleAll(bool toggled) {
    sanitarios.forEach((t) => this._toggleSanitario(t, toggled));
  }

  void _createSanitario(String identificacao) {
//    sanitarioStorage.create(
//        identificacao, Newlocalizacao, tipoEntrada, tipoSanitario);
  }

  void _deleteSanitario(Sanitario sanitario) {
    this._disableSanitario(sanitario);
    sanitarioStorage.delete(sanitario.id).catchError((_) {
      this._enabledSanitario(sanitario);
    });
  }

  void _toggleSanitario(Sanitario sanitario, bool completed) {
    this._disableSanitario(sanitario);
    sanitario.completed = completed;
    sanitarioStorage.update(sanitario).whenComplete(() {
      this._enabledSanitario(sanitario);
    });
  }

  void _editSanitario(Sanitario sanitario, String newIdentificacao) {
    this._disableSanitario(sanitario);
    sanitario.identificacao = newIdentificacao;
//    sanitario.localizacao = newLocalizacao;
//    sanitario.tipoEntrada = newTipoEntrada;
//    sanitario.tipoSanitario = newTipoSanitario;
    sanitarioStorage.update(sanitario).whenComplete(() {
      this._enabledSanitario(sanitario);
    });
  }
}
