 import 'package:untitled/auth.dart';
 import 'package:untitled/pages/homepage.dart';
 import 'package:untitled/pages/loginReg.dart';
 import 'package:flutter/material.dart';

 class WidgetTree extends StatefulWidget {
   const WidgetTree({Key? key}) : super(key:key);

   @override
   State<WidgetTree> createState() => _WidgetTreeState();
 }

 class _WidgetTreeState extends State<WidgetTree> {
   @override
   Widget build(BuildContext context) {
     return StreamBuilder(
         stream: Auth().authStateChanges,
         builder: (context, snapshot){
           if (snapshot.hasData){
     return Homepage();
           }else{
             return const LoginPage();
           }
         }
     );
   }
 }
