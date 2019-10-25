import 'package:flutter/material.dart';

class SingUpPage extends StatelessWidget {
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
                    TextField(
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
                    TextField(
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
                    TextField(
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
                    TextField(
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
                    TextField(
                      autofocus: false,
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
                        onPressed: () => {},
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

            ),

          ),

        )
    );
  }
}