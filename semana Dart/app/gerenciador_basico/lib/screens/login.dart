import 'package:flutter/material.dart';
import 'package:grenciador_basico/widgets/my_button.dart';
import 'package:grenciador_basico/widgets/my_textfield.dart';
import 'package:grenciador_basico/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final _email = TextEditingController();
  final _senha = TextEditingController();
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
                Icons.login,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                'Bem-vindo(a)',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                errorText: _erroEmail,
                controller: _email,
                hintText: 'Nome',
                obscureText: false,
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
                },
                text: 'Entrar',
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
