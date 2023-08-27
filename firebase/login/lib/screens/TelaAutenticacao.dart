import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaCadastro.dart';
import 'package:login/widgets/CustomWidgets.dart';

class TelaAutenticacao extends StatefulWidget {
  const TelaAutenticacao({super.key});

  @override
  State<TelaAutenticacao> createState() => _TelaAutenticacao();
}

class _TelaAutenticacao extends State<TelaAutenticacao> {
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
            const Text('Autenticação'),
            Formulario(
                erroText: _erroEmail, labelText: 'E-mail', controller: _email),
            Formulario(
              erroText: _erroSenha,
              labelText: 'Senha',
              controller: _senha,
            ),
            CustomButtom(
                text: 'Entrar',
                color: Colors.blue,
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email.text,
                      password: _senha.text,
                    );
                  } on FirebaseAuthException catch (e) {
                    setState(() {
                      String codigo = e.code;
                      if (codigo == 'invalid-email') {
                        _erroEmail = 'E-mail inválido';
                      } else if (codigo == 'User-disabled') {
                        _erroEmail = 'Usuário desabilitado';
                      } else if (codigo == 'user-not-found') {
                        _erroEmail = 'Usuário não encontrado';
                      } else if (codigo == 'wrong-passwaord') {
                        _erroSenha = 'senha inválida';
                      }
                    });
                    return;
                  }
                  setState(() {
                    _erroEmail = null;
                    _erroSenha = null;
                  });
                }),
            CustomButtom(
              text: 'Cadastrar',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaCadastro(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// FuncaoEntrar(_email, _senha, codigo, e, _erroEmail, _erroSenha) {
//   return () async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _email.text,
//         password: _senha.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         String codigo = e.code;
//         if (codigo == 'invalid-email') {
//           _erroEmail = 'E-mail inválido';
//         } else if (codigo == 'User-disabled') {
//           _erroEmail = 'Usuário desabilitado';
//         } else if (codigo == 'user-not-found') {
//           _erroEmail = 'Usuário não encontrado';
//         } else if (codigo == 'wrong-passwaord') {
//           _erroSenha = 'senha inválida';
//         }
//       });
//       return;
//     }
//     setState(() {
//       _erroEmail = null;
//       _erroSenha = null;
//     });
//   };
// }
