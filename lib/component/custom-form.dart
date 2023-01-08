import 'package:flutter/material.dart';
class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller;
  TextInputType? textInputType;
  final String title;
  final Function validator;
  final Function onChanged;
  //final Function onTap;
  IconData ?icon;
  bool? isClickable = true;
  TextFormFieldWidget(
      {required this.title, required this.validator, required this.controller, this.textInputType ,this.icon,this.isClickable,required this.onChanged});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      enabled: isClickable,
      onChanged:(x)=>onChanged(x) ,
      keyboardType: textInputType,
      controller: controller,
      //onTap:() => onTap(),
      validator: (x) => validator(x),
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: title,
        hintStyle:TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          //borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.5)
        ),
        // focusedBorder: OutlineInputBorder(
        //     //borderSide: BorderSide.none,
        //     borderRadius: BorderRadius.circular(5.5)
        // ),
      ),
    );

  }
}