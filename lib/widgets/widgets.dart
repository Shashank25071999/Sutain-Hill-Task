
//This file if for returning Widget function

import 'package:flutter/material.dart';


//function returning Appbar widget
Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Center(child: Text("Sustain Hill Development")),
  );
}


//function returning InputDecoration for textformfield
InputDecoration inputdecoration(String title, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.grey),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurple, width: 2),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurple, width: 2),
    ),
  );
}


//function returning Upload Button widget
Widget buttonforupload() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text("Upload", style: TextStyle(color: Colors.white)),
        )
      ],
    ),
  );
}


//function returning TextFormField widget
Widget textformfield(
    TextEditingController controler, String invalidtext, String title) {
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
    child: TextFormField(
      controller: controler,
      cursorColor: Colors.deepPurple,
      decoration: inputdecoration(title, title),
      validator: (val) {
        if (val.length == 0) {
          return invalidtext;
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black),
    ),
  );
}

//function returning ListTile widget
Widget listtile(String data,String title)
    {
  return ListTile(
                  title: Text(title),
                  subtitle: Text(data,
                  style: TextStyle(fontWeight: FontWeight.bold),)); 
      }