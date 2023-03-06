import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key,  this.text, this.onTap});
  String? text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text!,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}
