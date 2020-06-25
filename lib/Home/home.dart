import "package:flutter/material.dart";
import 'package:sustainHill/postdata/postdata.dart';
import 'package:sustainHill/widgets/widgets.dart';
import 'package:sustainHill/Database/databasemethods.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  //For Circular progress indicator
  bool _isloading = false;
  //List of posts
  List data = [];

  void initState() {
    getposthelpermethod();
    super.initState();
  }
   //Get Request post Handler
   getposthelpermethod()async{
     setState(() {
       _isloading=true;
     });
      DatabaseMethods databaseMethods=DatabaseMethods();
      databaseMethods.getpost().then((value) {
        data =value;
        setState(() {
          _isloading=false;
        });
      });
     }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: appBarMain(context),
            floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>PostData()));
            },child:Icon(Icons.add) ,),
            body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Card(
                        child: Column(children: [
                          SizedBox(height: 10),
                          listtile(data[index]["title"],"Title"),
                          SizedBox(height: 10),
                          listtile(data[index]["id"].toString(), "Id"),
                          SizedBox(height: 10),
                          listtile(data[index]["body"], "Body"),
                          SizedBox(height: 10),
                          listtile(data[index]["userId"].toString(), "UserId")
                        ]),
                      ),
                    ],
                  );
                }),
          );
  }
}
