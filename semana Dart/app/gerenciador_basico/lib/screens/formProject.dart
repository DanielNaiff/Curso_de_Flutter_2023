import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grenciador_basico/models/usuario.dart';
import 'package:grenciador_basico/models/projeto.dart';
import 'package:grenciador_basico/screens/TelaUsuarios.dart';
import 'package:grenciador_basico/screens/profile.dart';
import 'package:grenciador_basico/widgets/my_textfield.dart';
import 'package:grenciador_basico/widgets/customButtom.dart';

// ignore: must_be_immutable
class FormularioProjeto extends StatefulWidget {
  final Usuario usuario;
  final String uid;
  final String idAtual;
  final bool novoProjeto;
  bool novoGerente = false;
  String idNovoGerente;
  FormularioProjeto(
      {super.key,
      required this.usuario,
      required this.uid,
      required this.idAtual,
      required this.novoGerente,
      required this.novoProjeto,
      required this.idNovoGerente});

  @override
  State<FormularioProjeto> createState() => _FormularioProjetoState();
}

class _FormularioProjetoState extends State<FormularioProjeto> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _numeroMenbros = TextEditingController();
  DateTime _dataEntrega = DateTime.now();
  bool _concluido = false;
  DadosFormularioProjeto? _dados = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 15),
              MyTextField(
                controller: _nome,
                hintText: 'Mudar nome',
                obscureText: false,
              ),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: MyTextField(
                      controller: _numeroMenbros,
                      hintText: 'Alterar o número de menbros',
                      obscureText: false)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CheckboxListTile(
                  title: const Text('Concluido?'),
                  value: _concluido,
                  onChanged: (textoAtivo) =>
                      setState(() => _concluido = textoAtivo as bool),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Selecione o prazo de entrega:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() => _dataEntrega = newDateTime);
                  },
                ),
              ),
              const SizedBox(height: 8),
              if (widget.novoProjeto == false)
                CustomButtom(
                  text: 'Trocar Gerente',
                  onPressed: () async {
                    widget.novoGerente = true;
                    DadosFormularioProjeto? dados = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaUsuario(
                          uid: widget.uid,
                          usuario: widget.usuario,
                          idAtual: widget.idAtual,
                          novoProjeto: false,
                          novoGerente: true,
                        ),
                      ),
                    );
                    setState(() {
                      _dados = dados;
                    });
                  },
                ),
              const SizedBox(height: 8),
              CustomButtom(
                text: 'inserir dados',
                onPressed: () async {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaProjetos(uid: widget.uid),
                    ),
                  );
                  if (widget.novoProjeto == true) {
                    DatabaseReference referencia = FirebaseDatabase.instance
                        .ref()
                        .child('projetos')
                        .push();
                    String idUnico = referencia.key!;
                    Projeto projeto = Projeto(
                      id: idUnico,
                      idGerente: widget.usuario.id,
                      nome: _nome.text,
                      numeroMembros: int.parse(_numeroMenbros.text),
                      dataEntrega: _dataEntrega,
                      concluido: _concluido,
                    );
                    await referencia.set(projeto.toJson());
                  } else {
                    if (widget.novoGerente == false) {
                      Projeto projeto = Projeto(
                        id: widget.idAtual,
                        idGerente: widget.usuario.id,
                        nome: _nome.text,
                        numeroMembros: int.parse(_numeroMenbros.text),
                        dataEntrega: _dataEntrega,
                        concluido: _concluido,
                      );

                      DatabaseReference referencia = FirebaseDatabase.instance
                          .ref()
                          .child('projetos')
                          .child(widget.idAtual)
                          .set(projeto.toJson()) as DatabaseReference;
                      await referencia.set(projeto.toJson());
                    } else {
                      if (widget.novoGerente == true) {
                        Projeto projeto = Projeto(
                          id: widget.idAtual,
                          idGerente: _dados!.novoGerente
                              ? _dados!.idNovoGerente
                              : widget.usuario.id,
                          nome: _nome.text,
                          numeroMembros: int.parse(_numeroMenbros.text),
                          dataEntrega: _dataEntrega,
                          concluido: _concluido,
                        );
                        DatabaseReference referencia = FirebaseDatabase.instance
                            .ref()
                            .child('projetos')
                            .child(widget.idAtual)
                            .set(projeto.toJson()) as DatabaseReference;
                        await referencia.set(projeto.toJson());
                      }
                    }
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
