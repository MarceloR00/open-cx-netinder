import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:async';

class ConnectionException implements Exception {
  String error;
  ConnectionException(this.error);
}

class UserRegInfo {
  final String fullname;
  final String email;
  final String password;

  UserRegInfo({this.fullname, this.email, this.password});

  factory UserRegInfo.fromJson(Map<String, String> json) {
    return UserRegInfo(
      fullname : json['fullname'],
      email : json['email'],
      password : json['password'],
    );
  }

  factory UserRegInfo.fromMap(Map<String, String> map) {
    return UserRegInfo(
      fullname: map['fullname'],
      email: map['email'],
      password: map['password'],
    );
  }

  Map toMap() {
    var map = new Map<String,String>();
    map['fullname'] = fullname;
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}

class User {
  final String userID;
  final String fullname;
  final String email;
  final String password;

  User({this.userID, this.fullname, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID : json['_id'],
      fullname : json['fullname'],
      email : json['email'],
      password : json['password'],
    );
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userID : map["_id"],
      fullname: map["fullname"],
      email: map["email"],
      password: map["password"],
    );
  }

  Map toMap() {
    var map = new Map<String,dynamic>();
    map["_id"] = userID;
    map["fullname"] = fullname;
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}

class ApiConnection {
  static final String userUrl = 'https://tranquil-springs-58074.herokuapp.com/users/register';
  static final String loginUrl = 'https://tranquil-springs-58074.herokuapp.com/users/login';

  static Future<UserRegInfo> registerUser({Map userRegisterInfo}) async {
    // Send the request

    http.Response res = await http.post(userUrl ,headers: {"Content-Type" : "application/json"}, body: json.encode( userRegisterInfo));

    //Verify statusCode
    final int statusCode = res.statusCode;

    print(statusCode);
    print(res.body);

    if (statusCode < 200 || statusCode > 400 || json == null) {
      print(statusCode);
      print(res.body);
      throw new ConnectionException("Error while fetching data");
    }

    UserRegInfo us = UserRegInfo.fromMap(userRegisterInfo);

    return us;
  }

  static Future<User> getUserInformation(String userID) async {
    //TODO remove hardcoded user id
    userID = '5dea3ac2af393c0024ea5da4';

    String userGetUrl = userUrl + '/' +userID;

    print(userGetUrl);

    //Send the request
    http.Response res = await http.get(userGetUrl);

    //Verify statusCode
    final int statusCode = res.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new ConnectionException(res.body);
    }
    
    return User.fromJson(jsonDecode(res.body));
  }

  static Future<String> loginUser({Map userLoginInfo}) async {
    //Send the request
    http.Response res = await http.post(loginUrl, body: userLoginInfo);

    //Verify statusCode
    final int statusCode = res.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new ConnectionException(res.body);
    }

    String authToken = res.headers['Auth-Token'];

    return authToken;
  }
}