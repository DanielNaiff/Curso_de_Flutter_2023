import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'dart:ui';
import 'dart:async';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp (home: TelaPrincipal()));
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({ super.key });

  @override
  State<TelaCadastro> createState() => _TelaCadastro();
}

class _TelaCadastro extends State<TelaCadastro> {
  String _email = '';
  String _senha = '';
  String? _erroEmail;
  String?_erroSenha ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('cadastro'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: _email,
                onChanged: (texto) => setState(() => _email = texto),
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _erroEmail,
                  border: OutlineInputBorder(),
                ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: _senha,
                onChanged: (texto) => setState(() => _senha = texto),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _erroSenha,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text('Entrar'),
              onPressed: ()async{
                try{
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _senha,);
                } on FirebaseAuthException catch (e){
                  setState(() {
                    String codigo = e.code;
                    if(codigo == 'invalid-email'){
                      _erroEmail = 'E-mail inválido';
                    }else if(codigo == 'email-already-in-use'){
                      _erroEmail = 'Usuário já existe';
                    }else if(codigo == 'weak-password'){
                      _erroEmail = 'senha fraca';
                    }else {
                      _erroEmail = codigo;
                       Navigator.push(context,MaterialPageRoute(builder: (context) => const TelaAutenticacao(),),);
                    }
                  });
                  return;
                }
               setState(() {
                  _erroEmail = null;
                _erroSenha = null;
               });

              })
          ],
        ),
      )
    );
  }
}

class TelaAutenticacao extends StatefulWidget {
  const TelaAutenticacao({ super.key });

  @override
  State<TelaAutenticacao> createState() => _TelaAutenticacao();
}

class _TelaAutenticacao extends State<TelaAutenticacao> {
  String _email = '';
  String _senha = '';
  String? _erroEmail;
  String?_erroSenha ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Autenticação'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: _email,
                onChanged: (texto) => setState(() => _email = texto),
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _erroEmail,
                  border: OutlineInputBorder(),
                ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: _senha,
                onChanged: (texto) => setState(() => _senha = texto),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  errorText: _erroSenha,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Text('Entrar'),
              onPressed: ()async{
                try{
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _senha,);
                } on FirebaseAuthException catch (e){
                  setState(() {
                    String codigo = e.code;
                    if(codigo == 'invalid-email'){
                      _erroEmail = 'E-mail inválido';
                    }else if(codigo == 'User-disabled'){
                      _erroEmail = 'Usuário desabilitado';
                    }else if(codigo == 'user-not-found'){
                      _erroEmail = 'Usuário não encontrado';
                    }else if (codigo == 'wrong-passwaord'){
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text('Cadastrar'),
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const TelaCadastro(),),);
                },),
              ),
          ],
        ),
      )
    );
  }
}
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Text('Carregando...'));
              }
              User? usuario = snapshot.data;
              if (usuario == null){
                return TelaAutenticacao();
              }else {
                return TelaProjetos();
              }
            },
          ),
    );
  }
}

class TelaProjetos extends StatefulWidget {
  const TelaProjetos({super.key});

  @override
  State<TelaProjetos> createState() => _TelaProjetosState();
}

class _TelaProjetosState extends State<TelaProjetos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Meus Projetos'),
          MaterialButton(
            color: Colors.red,
            child: Text('Sair'),
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}