import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaAutenticacao.dart';
import 'package:login/widgets/CustomWidgets.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastro();
}

class _TelaCadastro extends State<TelaCadastro> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  String? _erroEmail;
  String? _erroSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('cadastro'),
            Formulario(
                erroText: _erroEmail, labelText: 'E-mail', controller: _email),
            Formulario(
                erroText: _erroSenha, labelText: 'Senha', controller: _senha),
            CustomButtom(
              text: 'Entrar',
              color: Colors.blue,
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email.text,
                    password: _senha.text,
                  );
                } on FirebaseAuthException catch (e) {
                  setState(
                    () {
                      String codigo = e.code;
                      if (codigo == 'invalid-email') {
                        _erroEmail = 'E-mail inválido';
                      } else if (codigo == 'email-already-in-use') {
                        _erroEmail = 'Usuário já existe';
                      } else if (codigo == 'weak-password') {
                        _erroEmail = 'senha fraca';
                      } else {
                        _erroEmail = codigo;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TelaAutenticacao(),
                          ),
                        );
                      }
                    },
                  );
                  return;
                }
                setState(
                  () {
                    _erroEmail = null;
                    _erroSenha = null;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
