import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'clipper.dart';
import 'Auth.dart';
import 'login.dart';
import 'home.dart';

class register extends StatelessWidget {
  var authentication = new Auth();
  TextEditingController username = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              ClipPath(
                clipper: clipper(),
                child: Container(
                  color: Colors.black87.withOpacity(0.7),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3.15,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: TextField(
                            controller: username,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: TextField(
                            controller: mobileNumber,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile Number',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: TextField(
                            controller: email,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.15,
                          child: TextField(
                            controller: password,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            authentication
                                .handleSignUp(email.text, password.text)
                                .then((User? user) async {
                              print("hello");
                              if (!(user!.emailVerified)) {
                                user.sendEmailVerification();
                                const snackBar = SnackBar(
                                    content: Text(
                                        'Please check your email to verify your email address'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black87.withOpacity(0.7),
                          ),
                          child: const Text("Register"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextButton(
                            child: const Text("Already have an acoount? SignIn"),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => login()));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
