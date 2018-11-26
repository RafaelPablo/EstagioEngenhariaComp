/* Copyright 2018 Rafael Pablo. All rights reserved.
*  Use of this source code is governed by a BSD-style license that can be
*  found in the LICENSE file.
*  Rafael Pablo Massocato
*  Estágio Engenharia de Computação 2018
*  Aplicativo para avaliação de acessibilidade */
part of acessibilidade_app;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    currentUser = await _googleSignIn.signInSilently();
  }
  if (currentUser == null) {
    currentUser = await _googleSignIn.signIn();
  }
  final GoogleSignInAuthentication auth = await currentUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );
  assert(user != null);
  assert(!user.isAnonymous);
  print("Acesso Google: $user");
  return user;
}

Future<FirebaseUser> signInWithEmail(String _email, String _senha) async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final FirebaseUser user =
      await _auth.signInWithEmailAndPassword(email: _email, password: _senha);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print("Acesso E-mail: $user");
  return user;
}

Future<Null> signOutWithGoogle() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}
