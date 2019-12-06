import 'package:flutter/material.dart';
import 'email_validation.dart';

import 'ApiConnection.dart';

class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(24),
              child: SignUpPageForm(),

            ),

          ),

        )
    );
  }
}


class SignUpPageForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpPageForm> {

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  final _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpKey,
      child: Center(
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                  width: 315,
                  height: 150,
                  child: FittedBox(
                    child: Image.asset('docs/logo.jpg'),
                    fit: BoxFit.fitWidth,
                  )
              ),
            ),
            SizedBox(
              height: 15, //ADICIONAR AQUI SIGN UP/SIGN IN
            ),
            TextFormField(
              controller: firstNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please insert a First Name";
                }

                return null;
              },
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "First Name",
                hintText: "First Name",
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
              height: 15,
            ),
            TextFormField(
              controller: lastNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please insert a Last Name";
                }

                return null;
              },
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Last Name",
                hintText: "Last Name",
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
              height: 15,
            ),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please insert an Email";
                }
                else if (!validate_email(value)) {
                  return "Please insert a valid email";
                }

                return null;
              },
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.text,
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
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please insert a Password";
                }
                else if (value.length < 6) {
                  return "Password must be at least 6 characters long";
                }
                return null;
              },
              autofocus: false,
              obscureText: true,
              keyboardType: TextInputType.text,
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
              height: 15,
            ),
            TextFormField(
              autofocus: false,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please confirm your Password";
                }
                else if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Confirm Password",
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
              height: 15,
            ),
            ButtonTheme(
              minWidth: double.infinity,
              child: MaterialButton(
                onPressed: () async {
                  if (!_signUpKey.currentState.validate())  {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Please insert valid information'),));
                  }
                  else {
                    //create the user
                    UserRegInfo newUser = new UserRegInfo(
                      fullname: firstNameController.text + lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    try {
                      UserRegInfo p = await ApiConnection.registerUser(userInfo: newUser.toMap());
                    }
                    on ConnectionException catch(e) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.error)));
                    }
                    catch (e) {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Unknown error ocurred")));
                    }
                  }
                },
                textColor: Colors.white,
                color: Colors.redAccent,
                height: 50,
                child:
                Text("SIGN UP"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}