import 'package:flutter/material.dart';
import 'package:NeTinder/sign_in.dart';
import 'package:NeTinder/sign_up.dart';

class HomePage extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetTinder'),
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
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),

                        );
                      },
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      height: 50,
                      child:
                      Text("SIGN UP"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                          MaterialPageRoute(builder: (context) => SignInPage()),

                        );
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
            ),
            
          ),
              
        ),
      
      )
    );
  }
}