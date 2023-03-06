import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled5/widget/contans.dart';
import 'package:untitled5/helper/show_snackerBar.dart';
import 'package:untitled5/pages/chat_page.dart';
import 'package:untitled5/pages/login_screen.dart';
import '../widget/custom_buttom.dart';
import '../widget/custom_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
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
                  kLogo,
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
                      'Register',
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
                  text: 'REGISTER',
                  onTap: () async {
                    if (formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ChatPage();
                      }));
                    } isLoading = true;
                    setState(() {});
                    try {
                      await regisyerUsers();

                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user - not - found') {
                        showSnackBar(context, 'weak password');
                      } else if (ex.code == 'worng - password') ;
                      showSnackBar(context, 'email already exists');
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
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));
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

  Future<void> regisyerUsers() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }

}
