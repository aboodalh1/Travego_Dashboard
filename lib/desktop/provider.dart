import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class Mypro with ChangeNotifier{


 Map<String , String> userlog ={
    'email': '',
    'password': '',
  };

  Map<String , String> userinfo = {
    'id':'',
    'name':'',
    'lastname' : '',
    'username': '',
    'email':'',
    'token':'',
  };


  List<dynamic> places = [];
List<dynamic> clients = [];

void setmaplog(Map user){
      userlog['email']=user['email'];
      userlog['password']=user['password'];
      notifyListeners();
    }

  static String baseurl = 'https://travego-z86d.onrender.com/api/';
  

  Future setlogin()async{
    final String url = '${baseurl}Auth/Manager/Manager_Login';
    try{
     final res = await http.post(Uri.parse(url) ,
     headers: {
      'Content-Type': 'application/json',
       'Accept':'application/json'},
     body: jsonEncode(userlog),
     );
  // print(userlog);
     final resdata = json.decode(res.body);
    print(resdata);
      if(resdata['status']== 'ACCEPTED'){
       print(resdata['status']);
      userinfo['id'] = resdata['body']['User']['id'].toString();
      userinfo['name']=resdata['body']['User']['first_name'];
      userinfo['lastname']=resdata['body']['User']['last_name'];
      userinfo['username'] =resdata['body']['User']['theusername'];
      userinfo['email']=resdata['body']['User']['email'];
      userinfo['token']=resdata['body']['Token'];
      print( userinfo['token']);
       }
     if(res.statusCode == 422 || res.statusCode == 400 || res.statusCode == 404 || res.statusCode == 415){
       print(resdata['message']);
      throw '${resdata['message']}';
     }
    }catch(error){
      print(error);
      rethrow ;
    }

  }

  Future <void> Get_AllClient ()async{
    final String url = '${baseurl}Auth/Manager/Get_AllClient';
    print('1');
    print(userinfo['token']);
    print(url);
    try{
    print('ok');
    final res = await http.get(Uri.parse(url),
     headers:{
      'access-control-allow-origin': '*',
      'Authorization': 'Bearer ${userinfo['token']}',
     },
     );
      if (res.statusCode == 200) {
     final resdata = json.decode(res.body);
      print(resdata);
      print(resdata['body'] );

      }
    }catch(errore){
      print(errore);
      throw'$errore';

    }
  }


}

   

