import 'package:flutter/material.dart';
import 'package:NeTinder/ApiConnection.dart';


class TagManagement {
  int indexList;
  int numElem;
  List tags;


  TagManagement(int size, List tags) {
    this.numElem = size;
    this.tags = tags;
    this.indexList = 0;
  }

  incIndex() {
    this.indexList++;
  }

  getIndex() {
    return indexList;
  }

  getElem() {
    return numElem;
  }

  reduceElem() {
    this.numElem--;
  }

  display() {


  }
}

class Profile extends StatefulWidget {
  final UserAuth auth;

  const Profile({Key key, this.auth}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfileState(auth);
}

class ProfileState extends State<Profile> {
  final UserAuth auth;
  Future<User> user;

  ProfileState(this.auth);

  @override
  void initState() {
    super.initState();

    user = ApiConnection.getUserInformation(auth);
  }

  @override
  Widget build(BuildContext context) {
    String _Phone = "Not Found";
    List _Tags = [];
    int _Points = 0;

    TagManagement tagControl = TagManagement(_Tags.length, _Tags);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      height: 2,
                    ),
                    new Text(
                      "My Profile",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 2,
                    ),

                    new Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(
                      width: 33,
                      height: 2,
                    ),

                    Container(
                      color: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10),
                      child: Column(
                        children: <Widget>[
                          FutureBuilder<User>(
                            future: user,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.fullname,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                  ),
                                );
                              }
                              else if (snapshot.hasError) {
                                return Text(
                                  "Not Found",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                  ),
                                );
                              }
                              else {
                                return CircularProgressIndicator();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 10,
                height: 20,
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 2,
                    ),

                    new Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(
                      width: 33,
                      height: 2,
                    ),

                    Container(
                      color: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10),
                      child: Column(
                        children: <Widget>[
                          FutureBuilder<User>(
                            future: user,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.email,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                  ),
                                );
                              }
                              else if (snapshot.hasError) {
                                return Text(
                                  "Not Found",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                  ),
                                );
                              }
                              else {
                                return CircularProgressIndicator();
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 10,
                height: 20,
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 2,
                    ),

                    new Text(
                      "Phone",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(
                      width: 27,
                      height: 2,
                    ),

                    Container(
                      color: Colors.blueGrey,
                      padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            //INSERIR DA BASE DE DADOS
                            _Phone,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 10,
                height: 20,
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 2,
                    ),

                    new Text(
                      "Tags",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(
                      width: 38,
                      height: 2,
                    ),

                    Expanded(
                      child: Container(
                        height: 200,

                        child: FutureBuilder<User> (
                          future: user,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.tags.length == 0) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: Text("You have no tags!"),
                                );
                              }
                              else {
                                return GridView.count(
                                  crossAxisCount: 3,
                                  children: snapshot.data.tags.map((value) {
                                    return Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),),
                                      child: Text(value),
                                    );
                                  }).toList(),
                                );
                              }
                            }
                            else if (snapshot.hasError) {
                              return new Text("Could not get Tags!");
                            }
                            else {
                              return CircularProgressIndicator();
                            }
                          },
                        )
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 10,
                height: 40,
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      height: 2,
                    ),
                    new Text(
                      "My Points",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25,
                      height: 2,
                    ),

                    Text(
                      //INSERIR DA BASE DE DADOS
                      "You have " + _Points.toString() + " points!",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(
                      width: 7,
                      height: 2,
                    ),

                    RaisedButton(
                      color: Colors.yellowAccent,
                      textColor: Colors.white,
                      disabledColor: Color(0xfffaf2cc),
                      //disabledTextColor: Color(0xffff8c1a),
                      disabledTextColor: Color(0xff987d4d),
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,

                      //onPressed: (),

                      child: Text(
                        "Manage them!",
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),


              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width:  40,
                    ),

                    ButtonTheme(
                      minWidth: 20,
                      height: 40,

                      child: RaisedButton(
                        color: Colors.yellowAccent,
                        textColor: Colors.white,
                        disabledColor: Color(0xffebcccc),
                        disabledTextColor: Color(0xffa94442),
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                        splashColor: Colors.blueAccent,

                        //onPressed: (),

                        child: Text(
                          "Delete my account",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 2,
                      width: 40,
                    ),


                    ButtonTheme(
                      minWidth: 20,
                      height: 40,
                      child:  RaisedButton(
                        color: Colors.yellowAccent,
                        textColor: Colors.white,
                        disabledColor: Color(0xfffaf2cc),
                        disabledTextColor: Color(0xff987d4d),
                        splashColor: Colors.blueAccent,

                        //onPressed: (),

                        child: Text(
                          "Edit my profile",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}