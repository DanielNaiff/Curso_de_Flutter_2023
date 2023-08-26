import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:login/screens/TelaPrincipal.dart';
// import 'dart:ui';
// import 'dart:async';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: TelaPrincipal()));
}
