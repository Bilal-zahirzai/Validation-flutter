import 'package:flutter/material.dart';
import 'package:project1/src/screens/login_screen.dart';

class App extends StatelessWidget{
  Widget build(context){
    return MaterialApp(

      title: 'Log in me!',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}