/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

/// The header widget for sanitario list page
class SanitarioHeaderWidget extends StatelessWidget {
  final TextEditingController _newTitleController = new TextEditingController();
  final Key textInputKey;
  final bool showToggleAll;
  final bool toggleAllActive;
  final VoidCallback onChangeToggleAll;
  final ValueSetter<String> onAddSanitario;

  SanitarioHeaderWidget({
    Key key,
    this.textInputKey,
    this.showToggleAll = false,
    this.toggleAllActive = false,
    this.onChangeToggleAll,
    @required this.onAddSanitario,
  })  : assert(onAddSanitario != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];

    // Only add the "Toggle All" icon if `showToggleAll` is true and we have a callback for it
    if (this.showToggleAll && this.onChangeToggleAll != null) {
      children.add(new IconButton(
        icon: new Icon(
          Icons.arrow_downward,
          color: this.toggleAllActive ? Colors.black : Colors.grey,
        ),
        alignment: Alignment.bottomCenter,
        onPressed: this.onChangeToggleAll,
      ));
    }

    // Always add the input box
    children.add(new Expanded(
      flex: 2,
      child: new TextField(
        key: textInputKey,
        controller: _newTitleController,
        decoration: new InputDecoration(hintText: 'What needs to be done?'),
        onSubmitted: (String value) {
          // Notify that we're adding a new item, and clear the text field
          this.onAddSanitario(value);
          _newTitleController.text = "";
        },
      ),
    ));

    return new Padding(
      // If we have the toggle all box, left the icon be our left padding
      padding: new EdgeInsets.fromLTRB(
          this.showToggleAll ? 0.0 : 10.0, 10.0, 10.0, 10.0),
      child: new Row(children: children),
    );
  }
}
