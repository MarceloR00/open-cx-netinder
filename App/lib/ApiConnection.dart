import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:async';

class User {
  final String fullname;
  final String email;
  final String password;

  User({this.fullname, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname : json['fullname'],
      email : json['email'],
      password : json['password'],
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullname: map["fullname"],
      email: map["email"],
      password: map["password"],
    );
  }

  Map toMap() {
    var map = new Map<String,dynamic>();
    map["fullname"] = fullname;
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}

class ApiConnection {
  static final String userUrl = 'http://open-cx.herokuapp.com/Users';

  static Future<User> registerUser({Map user}) async {
    // Send the request
    http.Response res = await http.post(userUrl , body: user);

    //Verify statusCode
    final int statusCode = res.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    //print the answer TODO remove later
    String data = res.body;

    User us = User.fromMap(user);

    return us;
  }
}