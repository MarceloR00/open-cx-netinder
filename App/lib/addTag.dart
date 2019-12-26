import 'package:NeTinder/ApiConnection.dart';
import 'package:NeTinder/profile.dart';
import 'package:flutter/material.dart';
import 'email_validation.dart';

class AddTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff987d4d),
        title: Text('Add tag'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(24),
            child: AddTagForm(),
          ),
        ),
      ),
    );
  }
}

class AddTagForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTagFormState();
  }

}

class AddTagFormState extends State<AddTagForm> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) {
                return "Please at least one tag";
              }
              return null;
            },
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Tags",
              hintText: "Enter tags separated by commas",
              labelStyle: TextStyle(
                color: Color(0xff987d4d),
                fontSize: 16,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff987d4d), width: 2.0),
              ),
              border: OutlineInputBorder (
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xff987d4d),
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 40,
          ),

          ButtonTheme(
            minWidth: double.infinity,
            child: MaterialButton(
              onPressed: () async {
                if (!_signInKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Please insert valid tags"),));
                }
                else {
                  //Create the login information
                  UserLoginInfo info = new UserLoginInfo(email: emailController.text, password: passwordController.text);

                  Future<UserAuth> auth = ApiConnection.loginUser(userLoginInfo: info.toMap());
                  auth.then((realAuth) { //Execute when future is complete
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile(auth: realAuth)));
                  })
                      .catchError((e)  => Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.error))),
                      test: (e) => e is ConnectionException)
                      .catchError((e) => Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString()))));
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Logging In, please wait")));
                }
              },
              textColor: Color(0xff987d4d),
              color: Color(0xfffaf2cc),
              height: 50,
              child:
              Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }
}