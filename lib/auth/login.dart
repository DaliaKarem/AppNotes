import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/auth/signup.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/Login.jpeg",height:100,width: 900,),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1)
                    )
                  ),
                ),
                SizedBox(),
                TextFormField(
                  obscureText:true ,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1)
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(" u don't have account?",style: TextStyle(color: Colors.lightGreen),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed("Signup");
                        },
                          child:Text("Click Here",style: TextStyle(color: Colors.amber) ,                     )
                      )
                    ],
                  ),
                ),
                Container(
                  child: ElevatedButton(

                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("HomePage");

                    },
                    child: Text("Login",style: TextStyle(fontSize: 20),),
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
