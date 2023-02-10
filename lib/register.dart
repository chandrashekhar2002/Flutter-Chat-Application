import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'clipper.dart';
import 'Auth.dart';
import 'login.dart';

class register extends StatelessWidget{
  var authentication = new Auth();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
              top: MediaQuery
                  .of(context)
                  .size
                  .height / 3.15,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [

                    Padding(padding: EdgeInsets.all(5),
                      child: Container(
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.15,
                        child: TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(5),
                      child: Container(
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.15,
                        child: TextField(
                          controller: password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          authentication.handleSignUp(email.text, password.text).
                            then((User? user) async{
                              print("hello");
                              if(!(user!.emailVerified)){
                                user.sendEmailVerification();
                                const snackBar = SnackBar(
                                    content: Text('Please check your email to verify your email address')
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                          });
                        },
                        child: Text("Register"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87.withOpacity(0.7),
                        ),
                      ),),

                    Padding(padding: EdgeInsets.all(20),
                      child: TextButton(
                          child: Text("Already have an acoount? SignIn"),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => login()));
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