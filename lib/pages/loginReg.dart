import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? errorMessage='';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

Future<void> signInWithEmailAndPassword() async{
  try{
    await Auth().signInWithEmailAndPassword(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );
  } on FirebaseAuthException catch (e){
    setState(() {
      errorMessage=e.message;
    });
  }
}

Future<void>  createUserWithEmailAndPassword() async{
  try{
    await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
    );
  }on FirebaseAuthException catch(e){
    setState(() {
      errorMessage=e.message;
    });
  }
}

Widget _title(){
  return const Text('Firebase Auth');
}

Widget _entryfield(
    String title,
    TextEditingController controller,
    ){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: title,
    ),
  );
}

Widget _errorMessage(){
  return Text(errorMessage == '' ? '' : "$errorMessage");
}

Widget _submitButton(){
  return ElevatedButton(
      onPressed:
        isLogin? signInWithEmailAndPassword : createUserWithEmailAndPassword,
  child: Text(isLogin ? 'Login' : 'Register'),
  );
}

Widget _loginRegisterButton(){
  return TextButton(
      onPressed:(){
        setState(() {
          isLogin = !isLogin;
        });
      } , child: Text(isLogin ? 'Register Instead' : 'Login Instead'),
  );
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            _entryfield('Email', _controllerEmail),
            _entryfield('Password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginRegisterButton(),
          ],
        ),

      ),
    );
  }
}
