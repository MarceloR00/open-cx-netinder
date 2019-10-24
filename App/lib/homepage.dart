import 'package:flutter/material.dart';

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
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                        width: 300,
                        height: 200,
                        child: FittedBox(
                          child: Image.asset('docs/logo.jpg'),
                          fit: BoxFit.fitHeight,
                        )
                    ),
                  ),
                  SizedBox(
                    height: 60, //ADICIONAR AQUI SIGN UP/SIGN IN
                  ),
                  TextField(
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
                  TextField(
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
                      onPressed: () => {},
                      textColor: Colors.black,
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