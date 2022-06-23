// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../SignUp/sign_up.dart';
import '../bottom_bar.dart';
import '../bottombar.dart';

// ignore: camel_case_types
class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

// ignore: camel_case_types
class _Sign_InState extends State<Sign_In> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //--------------------------------Email
    final emailFeild = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Email");
        }
        String pattern = r'\w+@\w+\.\w+';
        if (!RegExp(pattern).hasMatch(value)) {
          return 'Invalid Email format';
        }
        return null;
      },
      onSaved: (value) {
        emailcontroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
      ),
    );
    //------------------------------Password
    final passwordFeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordcontroller,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min 6 character)");
        }
        return null;
      },
      onSaved: (value) {
        passwordcontroller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
      ),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.purple,
      child: MaterialButton(
        splashColor: const Color.fromARGB(255, 121, 30, 30),
        padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Get.to(Bottombar());
          // signIn(emailcontroller.text, passwordcontroller.text);
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/blood1.png",
                          width: 220,
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    emailFeild,
                    const SizedBox(
                      height: 25,
                    ),
                    passwordFeild,
                    const SizedBox(
                      height: 30,
                    ),
                    loginbutton,
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              Sign_Up(),
                            );
                          },
                          child: const Text(
                            " Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Get.to(
                  Bottombar(),
                ),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
