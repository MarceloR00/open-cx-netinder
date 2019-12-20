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

class UserLoginInfo {
  final String email;
  final String password;

  UserLoginInfo({this.email, this.password});

  factory UserLoginInfo.fromMap(Map<String, String> map) {
    return UserLoginInfo(
      email: map['email'],
      password: map['password'],
    );
  }

  Map toMap() {
    var map = new Map<String,String>();
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}

class UserAuth {
  final String email;
  final String authToken;

  UserAuth({this.email,this.authToken});
}

class User {
  final String userID;
  final String fullname;
  final String email;
  final String password;
  final List<dynamic> tags;
  final List<dynamic> matches;
  final List<dynamic> conferences;

  User({this.tags, this.matches, this.conferences, this.userID, this.fullname, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['_id'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      tags: json['tags'] as List<dynamic>,
      matches: json['matches'] as List<dynamic>,
      conferences: json['conferences'] as List<dynamic>
    );
  }
}

class ApiConnection {
  static final String registerUrl = 'https://tranquil-springs-58074.herokuapp.com/users/register';
  static final String loginUrl = 'https://tranquil-springs-58074.herokuapp.com/users/login';
  static final String getInfoUrl = 'https://tranquil-springs-58074.herokuapp.com/users';

  static void registerUser({Map userRegisterInfo}) async {
    // Send the request

    var headers = {
      "Content-Type" : "application/json"
    };

    http.Response res = await http.post(registerUrl ,headers: headers, body: json.encode( userRegisterInfo));

    //Verify statusCode
    final int statusCode = res.statusCode;

    print(statusCode);
    print(res.body);

    if (statusCode < 200 || statusCode >= 400 || json == null) {
      print(statusCode);
      print(res.body);
      throw new ConnectionException("Error resistering user: " + res.body);
    }
  }

  static Future<User> getUserInformation(UserAuth auth) async {
    String email = auth.email;
    String token = auth.authToken;

    String userGetUrl = getInfoUrl + '/' + email;

    var headers = {
      "Auth-Token" : token
    };

    //Send the request
    http.Response res = await http.get(userGetUrl, headers: headers);

    //Verify statusCode
    final int statusCode = res.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new ConnectionException(res.body);
    }

    print("HEREEEEEE");
    print(res.body.toString());

    User u = User.fromJson(json.decode(res.body));

    print(u.toString());
    return u;
  }

  static Future<UserAuth> loginUser({Map userLoginInfo}) async {
    //Send the request
    http.Response res = await http.post(loginUrl, headers: {"Content-Type" : "application/json"},  body: json.encode(userLoginInfo));

    //Verify statusCode
    final int statusCode = res.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      throw new ConnectionException(res.body);
    }

    print("Code: " + statusCode.toString());
    String authToken = res.headers['auth-token'];
    print(authToken);

   return new UserAuth(email: userLoginInfo['email'], authToken: authToken);
  }
}