
import 'package:flutter/material.dart';
import 'package:sustainHill/Database/databasemethods.dart';
import 'package:sustainHill/Post/post.dart';
import 'package:sustainHill/widgets/widgets.dart';


class PostData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _PostDataState();
  }
}

class _PostDataState extends State<PostData> {
  bool _isloading = false;
  //controler for textformfield for taking input
  TextEditingController titlecontroler = TextEditingController();
  TextEditingController bodycontroler = TextEditingController();

  //formkey for validation in this project
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  DatabaseMethods databaseMethods = DatabaseMethods();
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success!"),
    content: Text("Successfully rentered the data."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
  
  //upload the data into the usl through this helper function
  uploadbuttonpressed(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isloading = true;
      });

      //postdataclass is for creating the fields of the post
      PostDataClass postDataClass = PostDataClass(
          title: titlecontroler.text,
          body: bodycontroler.text,
          userId: "1",
          id: "0");
      databaseMethods.postmethod(postDataClass).then((value) {
        setState(() {
          _isloading = false;
        });
        showAlertDialog(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return _isloading
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: appBarMain(context),
            body: Form(
              key: _formkey,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Upload Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.deepPurple),
                            )),
                      ),
                      textformfield(
                          titlecontroler, "Title is required", "Title"),
                      textformfield(bodycontroler, "Body is required", "Body"),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 365,
                        child: GestureDetector(
                            onTap: () {
                              uploadbuttonpressed(context);
                            },
                            child: buttonforupload()),
                      ),
                    ]),
              ),
            ),
          );
  }
}
