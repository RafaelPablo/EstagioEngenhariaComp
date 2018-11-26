/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

final CollectionReference sanitarioCollection =
    Firestore.instance.collection('Sanitario');

class SanitarioStorage {
  final FirebaseUser user;

  SanitarioStorage.forUser({
    @required this.user,
  }) : assert(user != null);

  static Sanitario fromDocument(DocumentSnapshot document) =>
      _fromMap(document.data);

  static Sanitario _fromMap(Map<String, dynamic> data) =>
      new Sanitario.fromMap(data);

  Map<String, dynamic> _toMap(Sanitario sanitario,
      [Map<String, dynamic> other]) {
    final Map<String, dynamic> result = {};
    if (other != null) {
      result.addAll(other);
    }
    result.addAll(sanitario.toMap());
    result['uid'] = user.uid;

    return result;
  }

  /// Returns a stream of data snapshots for the user, paginated using limit/offset
  Stream<QuerySnapshot> list({int limit, int offset}) {
    Stream<QuerySnapshot> snapshots =
        sanitarioCollection.where('uid', isEqualTo: this.user.uid).snapshots();
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      // TODO can probably use _query.limit in an intelligent way with offset
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  Future<Sanitario> create(String identificacao, String localizacao,
      String tipoEntrada, String tipoSanitario) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot newDoc =
          await tx.get(sanitarioCollection.document());
      final Sanitario newSanitario = new Sanitario(
          id: newDoc.documentID,
          identificacao: identificacao,
          localizacao: localizacao,
          tipoEntrada: tipoEntrada,
          tipoSanitario: tipoSanitario);
      final Map<String, dynamic> data = _toMap(newSanitario, {
        'created': new DateTime.now().toUtc().toIso8601String(),
      });
      await tx.set(newDoc.reference, data);

      return data;
    };

    return Firestore.instance
        .runTransaction(createTransaction)
        .then(_fromMap)
        .catchError((e) {
      print('Dart erro ao gravar: $e');
      return null;
    });
  }

  Future<bool> update(Sanitario sanitario) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot doc =
          await tx.get(sanitarioCollection.document(sanitario.id));
      // Permission check
      if (doc['uid'] != this.user.uid) {
        throw new Exception('Permissão negada');
      }

      await tx.update(doc.reference, _toMap(sanitario));
      return {'result': true};
    };

    return Firestore.instance.runTransaction(updateTransaction).then((r) {
      return r['result'] == true; // forcefully cast to boolean
    }).catchError((e) {
      print('Dart erro ao atualizar: $e');
      return false;
    });
  }

  Future<bool> delete(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot doc =
          await tx.get(sanitarioCollection.document(id));
      // Permission check
      if (doc['uid'] != this.user.uid) {
        throw new Exception('Permissão negada');
      }

      await tx.delete(doc.reference);
      return {'result': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((r) => r['result'])
        .catchError((e) {
      print('Dart erro ao deletar: $e}');
      return false;
    });
  }
}
