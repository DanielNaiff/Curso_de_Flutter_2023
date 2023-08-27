import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaAutenticacao.dart';
import 'package:login/screens/TelaProjetos.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Carregando...'));
          }
          User? usuario = snapshot.data;
          if (usuario == null) {
            return const TelaAutenticacao();
          } else {
            return TelaProjetos(uid: usuario.uid);
          }
        },
      ),
    );
  }
}
