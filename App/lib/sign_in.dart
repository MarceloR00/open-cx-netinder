import 'package:NeTinder/ApiConnection.dart';
import 'package:NeTinder/profile.dart';
import 'package:flutter/material.dart';
import 'email_validation.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(24),
            child: SignInPageForm(),
          ),
        ),
      ),
    );
  }
}

class SignInPageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInFormState();
  }

}

class SignInFormState extends State<SignInPageForm> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInKey,
      child: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
                width: 315,
                height: 250,
                child: FittedBox(
                  child: Image.asset('docs/logo.jpg'),
                  fit: BoxFit.fitWidth,
                )
            ),
          ),
          SizedBox(
            height: 50, //ADICIONAR AQUI SIGN UP/SIGN IN
          ),
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value.isEmpty) {
                return "Please insert an email";
              }
              else if (!validate_email(value)) {
                return "Please insert a valid email";
              }

              return null;
            },
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Email",
              labelStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 16,
              ),
              border: OutlineInputBorder (
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value.isEmpty) {
                return "Please insert a password";
              }

              return null;
            },
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Password",
              labelStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 16,
              ),
              border: OutlineInputBorder (
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.amber,
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
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Please insert valid information"),));
                }
                else {
                  //Create the login information
                  UserLoginInfo info = new UserLoginInfo(email: emailController.text, password: passwordController.text);

                  Future<UserAuth> auth = ApiConnection.loginUser(userLoginInfo: info.toMap());
                  auth.then((realAuth) { //Execute when future is complete
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile(auth: realAuth)));})
                      .catchError((e)  => Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.error))),
                        test: (e) => e is ConnectionException)
                      .catchError((e) => Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString()))));
                }
              },
              textColor: Colors.white,
              color: Colors.redAccent,
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