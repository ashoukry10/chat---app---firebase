import 'package:flutter/material.dart';
class CustomFormTextFaild extends StatelessWidget {
  CustomFormTextFaild({this.hintText,this.onChabged}) ;
  String? hintText;
  Function(String)? onChabged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty)
          return 'value is worng';
      },
      onChanged: onChabged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color:  Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        ),
      );
  }
}
