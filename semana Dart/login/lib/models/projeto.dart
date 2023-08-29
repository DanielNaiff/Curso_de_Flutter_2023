class Projeto {
  final String id;
  final String idGerente;
  final String nome;
  final int numeroMembros;
  final DateTime dataEntrega;
  final bool concluido;

  Projeto.fromJson(String id, Map dados)
      : this(
          id: id,
          nome: dados['nome'],
          numeroMembros: dados['numero-membros'],
          dataEntrega: DateTime.parse(dados['data-entrega']),
          concluido: dados['concluido'],
          idGerente: dados['id-gerente'],
        );

  const Projeto({
    required this.id,
    required this.idGerente,
    required this.nome,
    required this.numeroMembros,
    required this.dataEntrega,
    required this.concluido,
  });

  Map<String, Object?> toJson() {
    return {
      'nome': nome,
      'numero-membros': numeroMembros,
      'data-entrega': dataEntrega.toIso8601String(),
      'concluido': concluido,
      'id-gerente': idGerente,
    };
  }
}
