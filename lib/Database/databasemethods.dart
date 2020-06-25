import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sustainHill/Post/post.dart';

class DatabaseMethods {
//Url for the diifferent url request 
static final posturl = "https://jsonplaceholder.typicode.com/posts";

  //postrequest method for uploading the data
 Future<http.Response> postmethod(PostDataClass data,)async {
    http.Response responsedata;
    try {
      Map<String, dynamic> body = {
        "userId": data.userId,
        "id": data.id,
        "title": data.title,
        "body": data.body
      };
       responsedata=await  http.post(posturl, body: json.encode(body));
       return responsedata;
    } catch (e) {
      print(e);   
    }

  }
//getrequest method for fetching the data
 Future<List> getpost() async {
    List responsedata=[];
    try {
      http.Response response = await http.get(
          Uri.encodeFull(posturl),
          headers: {"Accept": "application/json"});
      responsedata  = json.decode(response.body);
      return responsedata;
      
    } catch (e) {}
  }
}
