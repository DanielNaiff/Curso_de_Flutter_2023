class Usuario {
  final String id;

  final String nome;
  final String cargo;
  final DateTime dataEntrada;
  final bool ativo;

  Usuario.fromJson(String id, Map dados)
      : this(
          id: id,
          nome: dados['nome'],
          cargo: dados['cargo'],
          ativo: dados['ativo'],
          dataEntrada: DateTime.parse(dados['data-entrada']),
        );

  const Usuario({
    required this.id,
    required this.nome,
    required this.cargo,
    required this.dataEntrada,
    required this.ativo,
  });

  Map<String, Object?> toJson() {
    return {
      'nome': nome,
      'cargo': cargo,
      'ativo': ativo,
      'data-entrada': dataEntrada.toIso8601String(),
    };
  }
}
