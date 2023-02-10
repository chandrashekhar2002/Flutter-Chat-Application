import 'package:authentication/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'clipper.dart';
import 'Auth.dart';
import 'home.dart';

class login extends StatelessWidget{
  var authentication = Auth();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: clipper(),
              child: Container(
                color: Colors.black87.withOpacity(0.7),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/3.15,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(5),
                      child:SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width/1.15,
                        child: TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),

                    Padding(padding: const EdgeInsets.all(5),
                      child:SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width/1.15,
                        child: TextField(
                          controller: password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),

                    Padding(padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          authentication.handleSignInEmail(email.text, password.text).
                          then((User? user) async {
                            if(user!.emailVerified){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                              Fluttertoast.showToast(msg: "Login Successfully");
                            }
                          }).catchError((e) => print(e));
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87.withOpacity(0.7),
                        ),
                      ),),

                    Padding(padding: EdgeInsets.all(20),
                      child: TextButton(child: Text("Don't have an account? SignUp",
                        style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    ),
    );
  }
}