class Conta {
  final String chave;
  String nome;
  String email;
  String registro;
  String telefone;
  String senha;
  bool completed;

  Conta({
    this.chave,
    this.nome,
    this.email,
    this.registro,
    this.telefone,
    this.senha,
    this.completed = false,
  })  : assert(chave != null && chave.isNotEmpty),
        assert(nome != null && nome.isNotEmpty),
        assert(email != null && email.isNotEmpty),
        assert(registro != null && registro.isNotEmpty),
        assert(senha != null && senha.isNotEmpty),
        assert(telefone != null && telefone.isNotEmpty),
        assert(completed != null);

  Conta.fromMap(Map<String, dynamic> data)
      : this(chave: data['chave'],
      nome: data['nome'],
      email: data['email'],
      registro: data['registro'],
      telefone: data['telefone'],
      senha: data['senha'],
      ??
      false);

  Map<String, dynamic> toMap() =>
      {
        'chave': this.chave,
        'nome': this.nome,
        'email': this.email,
        'registro': this.registro,
        'telefone': this.telefone,
        'senha': this.senha,
      };
}
