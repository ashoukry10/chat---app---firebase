import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled5/widget/contans.dart';
import 'package:untitled5/widget/custom_buttom.dart';
import 'package:untitled5/widget/custom_widget.dart';
import '../helper/show_snackerBar.dart';
import 'chat_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                Center(
                  child: Text(
                    'ScholarChat',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontFamily: 'pacifico'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormTextFaild(
                  onChabged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormTextFaild(
                  hintText: 'Passowrd',
                  onChabged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButon(
                  text: 'Login',
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ChatPage();
                    }));
                    if (formKey.currentState!.validate()) isLoading = true;
                    setState(() {});
                    try {
                      await loginUsers();
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'weak password') {
                        showSnackBar(context, 'weak password');
                      } else if (ex.code == 'email - already - in - use') ;
                      showSnackBar(context, 'sucsess');
                      isLoading = false;
                      setState(() {});
                    }
                    ;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> loginUsers() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email:email! , password: password!);
  }
}
