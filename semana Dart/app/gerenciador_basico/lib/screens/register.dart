import 'package:flutter/material.dart';
import 'package:grenciador_basico/widgets/my_button.dart';
import 'package:grenciador_basico/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // text editing controllers
  //posso criar uma classe disso
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  String? _erroEmail;
  String? _erroSenha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.person_add,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Cadastro',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: _email,
                hintText: 'E-mail',
                obscureText: false,
                errorText: _erroEmail,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                errorText: _erroSenha,
                controller: _senha,
                hintText: 'Senha',
                obscureText: true,
              ),

              const SizedBox(height: 10),
              const SizedBox(height: 25),

              // sign in button
              MyButton(
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
                        }
                      },
                    );
                    return;
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  setState(
                    () {
                      _erroEmail = null;
                      _erroSenha = null;
                    },
                  );
                },
                text: 'Cadastrar',
              ),

              const SizedBox(height: 50),

              // or continue with

              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
