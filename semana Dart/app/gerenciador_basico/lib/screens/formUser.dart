import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grenciador_basico/models/usuario.dart';
import 'package:grenciador_basico/screens/profile.dart';
import 'package:grenciador_basico/widgets/my_textfield.dart';

class FormularioUsuario extends StatefulWidget {
  final String uid;
  const FormularioUsuario({super.key, required this.uid});

  @override
  State<FormularioUsuario> createState() => _FormularioUsuarioState();
}

class _FormularioUsuarioState extends State<FormularioUsuario> {
  final TextEditingController _nome = TextEditingController();
  // ignore: unused_field
  final TextEditingController _numeroMenbros = TextEditingController();
  // ignore: unused_field
  DateTime _dataEntrega = DateTime.now();
  bool _estado = false;
  String _cargo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyTextField(
              controller: _nome,
              hintText: 'Mudar nome',
              obscureText: false,
            ),
          ),
          DropdownButtonFormField(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _cargo,
            items: const [
              DropdownMenuItem(value: '', child: Text('Selecione o cargo')),
              DropdownMenuItem(
                  value: 'Desenvolvedor', child: Text('Desenvolvedor')),
              DropdownMenuItem(value: 'Gerente', child: Text('Gerente')),
              DropdownMenuItem(value: 'Testador', child: Text('Testador')),
            ],
            onChanged: (value) => setState(() => _cargo = value!),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CheckboxListTile(
              title: const Text('Ativo?'),
              value: _estado,
              onChanged: (textoAtivo) =>
                  setState(() => _estado = textoAtivo as bool),
            ),
          ),
          const SizedBox(height: 8),
          MaterialButton(
            onPressed: () async {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaProjetos(uid: widget.uid),
                ),
              );
              Usuario usuario = Usuario(
                id: widget.uid,
                nome: _nome.text,
                cargo: _cargo,
                dataEntrada: DateTime.now(),
                ativo: _estado,
              );
              await FirebaseDatabase.instance
                  .ref()
                  .child('usuario')
                  .child(widget.uid)
                  .set(usuario.toJson());
            },
            child: Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Center(
                child: Text(
                  'Salvar alterações',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
