import'package:flutter/material.dart';
import 'package:notes_app/Home/homepage.dart';
import 'package:notes_app/crud/addnots.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "login" : (context) =>Login(),
        "Signup" :(context)=>Signup(),
        "HomePage" :(context)=>HomePage(),
        "addnotes" :(context)=>AddNotes(),
      },
    );
  }

}