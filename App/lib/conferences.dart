import 'package:flutter/material.dart';

class Conference {
  final String conferenceName = "Talk a bit 2020";
  final String photoPath = 'docs/talkabit.png';
  final String description =
      'Conferencia organizada por alunos de yadayadayada muito boa para apresentar projetos de ldso';
  final String location = 'Porto';
  final String dateInicio = '11/01/2020';
  final String dateFinal = '11/01/2020';
}

class Conferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List Conferences = [
      "Conference1",
      "Conference2",
      "Conference3",
      "Conference4",
      "Conference5",
      "Conference6",
      "Conference7"
    ];
    List<Conference> myConferences = List<Conference>(3);
    myConferences[0] = new Conference();
    myConferences[1] = new Conference();
    myConferences[2] = new Conference();

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
                      height: 20,
                    ),
                    new Text(
                      "My Conferences",
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
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 2,
                      height: 1,
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        child: GridView.count(
                          crossAxisCount: 1,
                          children: myConferences.map((conference) {
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
                                          height: 120,
                                          child: FittedBox(
                                            child: Image.asset(
                                                conference.photoPath),
                                            fit: BoxFit.fitWidth,
                                          ))),
                                  Container(child: Text(' ')),
                                  Container(
                                      child: Text(conference.conferenceName)),
                                  Container(child: Text(conference.location)),
                                  Container(
                                      child: Text(conference.dateInicio +
                                          ' - ' +
                                          conference.dateFinal)),
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
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
