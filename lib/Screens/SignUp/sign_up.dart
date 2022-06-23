// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../SignIn/sign_in.dart';
import 'Model/user_model.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    //--------------------------------full Name
    final fullnamefeild = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: fullnameController,
      onSaved: (value) {
        fullnameController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{13,}$');
        if (value!.isEmpty) {
          return ("Please Enter full Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Full name",
      ),
    );
    //--------------------------------user Name
    final usernamefeild = TextFormField(
      autofocus: false,
      controller: usernameController,
      onSaved: (value) {
        usernameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter user Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "user Name",
      ),
    );
    //--------------------------------Email
    final emailfeild = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E mail",
      ),
    );
    //--------------------------------Password
    final passwordfeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
      ),
    );
    //--------------------------------Confirm Password
    final confirmpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordController,
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      validator: (value) {
        if (confirmpasswordController.text != passwordController.text) {
          return "Password dont Match";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
      ),
    );
    //--------------------------------Birth Year
    final year = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      // controller: confirmpasswordController,
      // onSaved: (value) {
      //   confirmpasswordController.text = value!;
      // },
      // validator: (value) {
      //   if (confirmpasswordController.text != passwordController.text) {
      //     return "Password dont Match";
      //   }
      //   return null;
      // },
      // textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Year",
      ),
    );
    //--------------------------------Month
    final month = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      // controller: confirmpasswordController,
      // onSaved: (value) {
      //   confirmpasswordController.text = value!;
      // },
      // validator: (value) {
      //   if (confirmpasswordController.text != passwordController.text) {
      //     return "Password dont Match";
      //   }
      //   return null;
      // },
      // textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Month",
      ),
    );
    //--------------------------------Day
    final day = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      // controller: confirmpasswordController,
      // onSaved: (value) {
      //   confirmpasswordController.text = value!;
      // },
      // validator: (value) {
      //   if (confirmpasswordController.text != passwordController.text) {
      //     return "Password dont Match";
      //   }
      //   return null;
      // },
      // textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Day",
      ),
    );
    final location = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.streetAddress,
      // controller: confirmpasswordController,
      // onSaved: (value) {
      //   confirmpasswordController.text = value!;
      // },
      // validator: (value) {
      //   if (confirmpasswordController.text != passwordController.text) {
      //     return "Password dont Match";
      //   }
      //   return null;
      // },
      // textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Location',
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Country, Province, City",
      ),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.purple,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    //--------------------------------Date of Birth
    final dateofbirth = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: year),
        SizedBox(width: 10),
        Expanded(child: month),
        SizedBox(width: 10),
        Expanded(child: day),
      ],
    );
    //--------------------------------Phone Number
    final phonenumber = Row(
      children: [
        CountryCodePicker(
          closeIcon: Icon(Icons.arrow_drop_down),
          initialSelection: 'PK',
          favorite: ['PK', '+92'],
          showCountryOnly: true,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Phone number',
            ),
          ),
        ),
      ],
    );
    //--------------------------------Blood Group
    final bloodgroup = DropdownButton<String>(
      isExpanded: true,
      underline: SizedBox(),
      // value: _item,
      items: <String>[
        "A Positive (A+)",
        'A Negative (A-)',
        'B Positive (B+)',
        'B Negative (B-)',
        'O Positive (O+)',
        'O Pegative (O-)',
        'AB Positive (AB+)',
        'AB Negative (AB-)',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        'Select your blood group',
      ),
      onChanged: (value) {
        setState(() {
          // _item = value!;
        });
      },
    );
    //--------------------------------Phone Number
    final gender = DropdownButton<String>(
      isExpanded: true,
      underline: SizedBox(),
      // value: _item,
      items: <String>[
        'Male',
        'Female',
        'Prefer not to say',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        'Gender',
      ),
      onChanged: (value) {
        setState(() {
          // _item = value!;
        });
      },
    );
    //--------------------------------Already have an account
    final alreadyhaveaccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        GestureDetector(
          onTap: () => Get.to(
            Sign_In(),
          ),
          child: const Text(
            " Login",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Your Credentials',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Please fill the following fields',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                fullnamefeild,
                SizedBox(height: 5),
                usernamefeild,
                SizedBox(height: 5),
                emailfeild,
                SizedBox(height: 5),
                passwordfeild,
                SizedBox(height: 5),
                confirmpassword,
                SizedBox(height: 5),
                dateofbirth,
                SizedBox(height: 5),
                phonenumber,
                SizedBox(height: 5),
                location,
                SizedBox(height: 15),
                bloodgroup,
                gender,
                const SizedBox(height: 20),
                loginbutton,
                const SizedBox(height: 15),
                alreadyhaveaccount,
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  //postDetailsToFirebase
  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullnameController.text;
    userModel.userName = usernameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomap());
    Fluttertoast.showToast(
      msg: "Account created successfully :)",
    );
    Get.to(() => Sign_In());
  }
}
