import 'package:flutter/material.dart';

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

  display() {}
}

class Match {
  final String matchName = "Beatriz Cardoso";
  final String photoPath = "docs/beatrizcardoso.png";
}

class Matches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List Tags = ["Tag1", "Tag2", "Tag3", "Tag4", "Tag5"];
    List<Match> myMatches = List<Match>(3);
    myMatches[0] = new Match();
    myMatches[1] = new Match();
    myMatches[2] = new Match();

    TagManagement tagControl = TagManagement(Tags.length, Tags);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff987d4d),
        title: Text("My Matches"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*
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
                      height: 20,
                    ),
                    new Text(
                      "My Matches",
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

               */
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 1,
                      height: 2,
                    ),
                    Expanded(
                      child: Container(
                        height: 600,
                        child: GridView.count(
                          crossAxisCount: 1,
                          children: myMatches.map((match) {
                            return Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: SizedBox(
                                          width: 380,
                                          height: 300,
                                          child: FittedBox(
                                            child: Image.asset(match.photoPath),
                                            fit: BoxFit.fitWidth,
                                          ))),
                                  Container(child: Text(match.matchName)),
                                  Container(child: Text(' ')),
                                  Container(
                                    child: tagControl.getElem() >= 4
                                        ? Container(
                                            child: Row(
                                              children: <Widget>[
                                                Container(
                                                  alignment: Alignment.center,
                                                  color: Colors.blueGrey[300],
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 28),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        //INSERIR DA BASE DE DADOS
                                                        Tags.elementAt(
                                                            tagControl
                                                                .getIndex()),
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                  height: 2,
                                                ),
                                                Container(
                                                  color: Colors.blueGrey[300],
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 28),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        //INSERIR DA BASE DE DADOS
                                                        Tags.elementAt(
                                                            tagControl
                                                                .getIndex()),
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      // tagControl.incIndex(),
                                                      // tagControl.reduceElem(),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                  height: 2,
                                                ),
                                                Container(
                                                  color: Colors.blueGrey[300],
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 28),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        //INSERIR DA BASE DE DADOS
                                                        Tags.elementAt(
                                                            tagControl
                                                                .getIndex()),
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      // tagControl.incIndex(),
                                                      // tagControl.reduceElem(),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                  height: 2,
                                                ),
                                                Container(
                                                  color: Colors.blueGrey[300],
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 28),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        //INSERIR DA BASE DE DADOS
                                                        Tags.elementAt(
                                                            tagControl
                                                                .getIndex()),
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                      // tagControl.incIndex(),
                                                      // tagControl.reduceElem(),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                  height: 2,
                                                ),
                                              ],
                                            ),
                                          )
                                        : tagControl.getElem() == 3
                                            ? Container(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      color:
                                                          Colors.blueGrey[300],
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 28),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            //INSERIR DA BASE DE DADOS
                                                            Tags.elementAt(
                                                                tagControl
                                                                    .getIndex()),
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          //tagControl.incIndex(),
                                                          //tagControl.reduceElem(),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                      height: 2,
                                                    ),
                                                    Container(
                                                      color: Colors.blueGrey,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 28),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            //INSERIR DA BASE DE DADOS
                                                            Tags.elementAt(
                                                                tagControl
                                                                    .getIndex()),
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          //tagControl.incIndex(),
                                                          //tagControl.reduceElem(),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      color:
                                                          Colors.blueGrey[300],
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 28),
                                                      child: Column(
                                                        children: <Widget>[
                                                          Text(
                                                            //INSERIR DA BASE DE DADOS
                                                            Tags.elementAt(
                                                                tagControl
                                                                    .getIndex()),
                                                            style: TextStyle(
                                                              fontSize: 16.0,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                          ),
                                                          // tagControl.incIndex(),
                                                          // tagControl.reduceElem(),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                      height: 2,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : tagControl.getElem() == 2
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          color: Colors
                                                              .blueGrey[300],
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0,
                                                                  horizontal:
                                                                      28),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                //INSERIR DA BASE DE DADOS
                                                                Tags.elementAt(
                                                                    tagControl
                                                                        .getIndex()),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                              ),
                                                              //tagControl.incIndex(),
                                                              //tagControl.reduceElem(),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                          height: 2,
                                                        ),
                                                        Container(
                                                          color:
                                                              Colors.blueGrey,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0,
                                                                  horizontal:
                                                                      28),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                //INSERIR DA BASE DE DADOS
                                                                Tags.elementAt(
                                                                    tagControl
                                                                        .getIndex()),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                              ),
                                                              //tagControl.incIndex(),
                                                              //tagControl.reduceElem(),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                          color:
                                                              Colors.blueGrey,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0,
                                                                  horizontal:
                                                                      28),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                //INSERIR DA BASE DE DADOS
                                                                Tags.elementAt(
                                                                    tagControl
                                                                        .getIndex()),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .black87,
                                                                ),
                                                              ),
                                                              //tagControl.incIndex(),
                                                              //tagControl.reduceElem(),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
