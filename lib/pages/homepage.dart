import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:untitled/auth.dart';

class Homepage extends StatelessWidget {
  Homepage ({Key? key}) : super(key: key);

  final User? user=Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget userUid(){
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton(){
    return ElevatedButton(
        onPressed: signOut,
        child: const Text('Sign Out'),
    );
  }

  Widget _title(){
    return const Text('Sign In Kulla');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height:double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            userUid(),
            _signOutButton(),
          ]
        ),
      ),
    );
  }
}
