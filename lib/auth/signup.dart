import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/auth/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  Signup()async{
    var data=formstate.currentState;
    if(data!.validate())
      {
        data.save();
        try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: pass,
          );
          return credential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            SnackBar(
              content: Text("The password provided is too weak."),
            );
            //print('');
          } else if (e.code == 'email-already-in-use') {
            SnackBar(
              content: Text("The account already exists for that email"),
            );
            //print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    else{
    }
  }
  late String username;
  late String email;
  late String pass;
  // save()async{
  //   SharedPreferences pref=await SharedPreferences.getInstance();
  //   username=pref.setString("name", username) as String;
  //   email=pref.setString("email", email)as String;
  //   pass=pref.setString("pass", pass)as String;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("images/Login.jpeg",height:300,width: 900,),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formstate,
                child: Column(
              children: [
                TextFormField(
                  onSaved: (val){
                    username=val.toString();
                  },
                  validator:(val)
                  {
                    if(val!.length > 100)
                      return "UserName can't be larger than 100";
                    if(val.length<2)
                      return "UserName can't be less than 2";
                    return null;

                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter Username",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)
                      )
                  ),
                ),
                SizedBox(width: 20,),
                TextFormField(
                  onSaved: (val){
                  email=val.toString();
                },
                  validator:(val)
                  {
                    if(val!.length > 100)
                      return "Email can't be larger than 100";
                    if(val.length<2)
                      return "Email can't be less than 2";
                    return null;

                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)
                      )
                  ),
                ),
                SizedBox(width: 20,),
                TextFormField(
                  onSaved: (val){
                    pass=val.toString();
                  },
                  validator:(val)
                  {
                    if(val!.length > 100)
                      return "Pass can't be larger than 100";
                    if(val.length<4)
                      return "Pass can't be less than 4";
                    return null;

                  },
                  obscureText:true ,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Enter Pass",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(" u have account?",style: TextStyle(color: Colors.lightGreen),),
                      InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed("login");
                          },
                          child:Text("Click Here",style: TextStyle(color: Colors.amber) ,                     )
                      )
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(

                      onPressed: ()async {
                       UserCredential res= await Signup();
                       print("--------------------------------");
                       print(res.user);
                       print("--------------------------------");
                        // Navigator.of(context).pushReplacementNamed("HomePage");
                      },
                      child: Text("Sign Up",style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                      )

                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
