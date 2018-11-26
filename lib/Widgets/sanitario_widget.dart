/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

class SanitarioWidget extends StatefulWidget {
  final Sanitario sanitario;
  final bool disabled;
  final ValueChanged<bool> onToggle;
  final ValueChanged<String> onIdentificacaoChanged;
  final ValueChanged<String> onLocalizacaoChanged;
  final ValueChanged<String> onTipoEntradaChanged;
  final ValueChanged<String> onTipoSanitarioChanged;
  final VoidCallback onDelete;

  SanitarioWidget({
    Key key,
    @required this.sanitario,
    this.disabled = false,
    this.onToggle,
    this.onIdentificacaoChanged,
    this.onLocalizacaoChanged,
    this.onTipoEntradaChanged,
    this.onTipoSanitarioChanged,
    this.onDelete,
  })  : assert(sanitario != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => new _SanitarioWidgetState();
}

class _SanitarioWidgetState extends State<SanitarioWidget> {
  final TextEditingController _editIdentificacaoController =
      new TextEditingController();
  final TextEditingController _editLocalizacaoController =
      new TextEditingController();
  final TextEditingController _editTipoEntradaController =
      new TextEditingController();
  final TextEditingController _editTipoSanitarioController =
      new TextEditingController();

  bool _editMode;

  @override
  void initState() {
    super.initState();
    _editMode = false;
  }

  Widget _buildEditIdentificacao() {
    final String identificacao = widget.sanitario.identificacao;

    // Make sure the controller always has our current value
    _editIdentificacaoController.text = identificacao;
    // Select all the text when we show the edit box
    _editIdentificacaoController.selection =
        new TextSelection(baseOffset: 0, extentOffset: identificacao.length);

    return new TextField(
      autofocus: true,
      controller: _editIdentificacaoController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        widget.onIdentificacaoChanged(value);
      },
    );
  }

  Widget _buildEditLocalizacao() {
    final String localizacao = widget.sanitario.localizacao;

    // Make sure the controller always has our current value
    _editLocalizacaoController.text = localizacao;
    // Select all the text when we show the edit box
    _editLocalizacaoController.selection =
        new TextSelection(baseOffset: 0, extentOffset: localizacao.length);

    return new TextField(
      autofocus: true,
      controller: _editLocalizacaoController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        widget.onLocalizacaoChanged(value);
      },
    );
  }

  Widget _buildEditTipoEntrada() {
    final String tipoEntrada = widget.sanitario.tipoEntrada;

    // Make sure the controller always has our current value
    _editLocalizacaoController.text = tipoEntrada;
    // Select all the text when we show the edit box
    _editLocalizacaoController.selection =
        new TextSelection(baseOffset: 0, extentOffset: tipoEntrada.length);

    return new TextField(
      autofocus: true,
      controller: _editTipoEntradaController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        widget.onTipoEntradaChanged(value);
      },
    );
  }

  Widget _buildEditTipoSanitario() {
    final String tipoSanitario = widget.sanitario.tipoSanitario;

    // Make sure the controller always has our current value
    _editTipoSanitarioController.text = tipoSanitario;
    // Select all the text when we show the edit box
    _editTipoSanitarioController.selection =
        new TextSelection(baseOffset: 0, extentOffset: tipoSanitario.length);

    return new TextField(
      autofocus: true,
      controller: _editTipoSanitarioController,
      onSubmitted: (value) {
        setState(() {
          _editMode = false;
        });
        widget.onTipoSanitarioChanged(value);
      },
    );
  }

  Widget _buildIdentificacao(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle titleStyle = theme.textTheme.body1;
    if (widget.disabled) {
      titleStyle = titleStyle.copyWith(color: Colors.grey);
    }

    return new GestureDetector(
      child: new Text(widget.sanitario.identificacao, style: titleStyle),
      onLongPress: widget.disabled
          ? null
          : () {
              // Long press to edit
              if (widget.onIdentificacaoChanged != null) {
                setState(() {
                  _editMode = true;
                });
              }
            },
    );
  }

  Widget _buildLocalizacao(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle titleStyle = theme.textTheme.body1;
    if (widget.disabled) {
      titleStyle = titleStyle.copyWith(color: Colors.grey);
    }

    return new GestureDetector(
      child: new Text(widget.sanitario.localizacao, style: titleStyle),
      onLongPress: widget.disabled
          ? null
          : () {
              // Long press to edit
              if (widget.onLocalizacaoChanged != null) {
                setState(() {
                  _editMode = true;
                });
              }
            },
    );
  }

  Widget _buildTipoEntrada(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle titleStyle = theme.textTheme.body1;
    if (widget.disabled) {
      titleStyle = titleStyle.copyWith(color: Colors.grey);
    }

    return new GestureDetector(
      child: new Text(widget.sanitario.tipoEntrada, style: titleStyle),
      onLongPress: widget.disabled
          ? null
          : () {
              // Long press to edit
              if (widget.onTipoEntradaChanged != null) {
                setState(() {
                  _editMode = true;
                });
              }
            },
    );
  }

  Widget _buildTipoSanitario(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle titleStyle = theme.textTheme.body1;
    if (widget.disabled) {
      titleStyle = titleStyle.copyWith(color: Colors.grey);
    }

    return new GestureDetector(
      child: new Text(widget.sanitario.tipoSanitario, style: titleStyle),
      onLongPress: widget.disabled
          ? null
          : () {
              // Long press to edit
              if (widget.onTipoSanitarioChanged != null) {
                setState(() {
                  _editMode = true;
                });
              }
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget identificacaoChild = (!widget.disabled && _editMode)
        ? _buildEditIdentificacao()
        : _buildIdentificacao(context);
    final Widget localizacaoChild = (!widget.disabled && _editMode)
        ? _buildEditLocalizacao()
        : _buildLocalizacao(context);
    final Widget tipoEntradaChild = (!widget.disabled && _editMode)
        ? _buildEditTipoEntrada()
        : _buildTipoEntrada(context);
    final Widget tipoSanitarioChild = (!widget.disabled && _editMode)
        ? _buildEditTipoSanitario()
        : _buildTipoSanitario(context);

    return new Row(
      children: <Widget>[
        new Checkbox(
          value: widget.sanitario.completed,
          onChanged: widget.disabled ? null : widget.onToggle,
        ),
        new Expanded(
            flex: 2,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                identificacaoChild,
                SizedBox(height: 8.0),
                localizacaoChild,
                SizedBox(height: 8.0),
                tipoEntradaChild,
                SizedBox(height: 8.0),
                tipoSanitarioChild,
              ],
            )),
        new IconButton(
          icon: new Icon(Icons.delete),
          onPressed: widget.disabled ? null : widget.onDelete,
        ),
      ],
    );
  }
}
