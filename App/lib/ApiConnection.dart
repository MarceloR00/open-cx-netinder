import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({this.firstName, this.lastName, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName : json['firstName'],
      lastName : json['lastName'],
      email : json['email'],
      password : json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String,dynamic>();
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}

class ApiConnection {
  static final String userUrl = 'https://my-json-server.typicode.com/leonardofmoura/mock_json_server/users';

  static Future<User> createUser({Map body}) async {
    return http.post(userUrl, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      /* TODO verify return code according to the api
      if (statusCode < 200 || statusCode > 400 || json == null) {
        print(statusCode);
        throw new Exception("Error while fetching data");
      }
      */

      return User.fromJson(json.decode(response.body));
    });
  }
}