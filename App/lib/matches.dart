import 'package:NeTinder/ApiConnection.dart';
import 'package:flutter/material.dart';

import 'TagDisplay.dart';

class MatchPage extends StatelessWidget {
  final String userId;

  const MatchPage({Key key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff987d4d),
        title: Text("My Matches"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: MatchCol(userId: userId,),
          ),
        ),
      ),
    );
  }
}

class MatchCol extends StatefulWidget {
  final String userId;

  const MatchCol({Key key, this.userId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MatchDisplay(userId);
  }
}

class MatchDisplay extends State<MatchCol> {
  final String userId;
  Future<MatchList> matchList;

  MatchDisplay(this.userId);

  @override
  void initState() {
    super.initState();

    matchList = ApiConnection.getUserMatches(this.userId);
  }

  Widget matchCol(List<dynamic> matches) {
    if (matches.length == 0) {
      return new Text("You have no matches yet! Add Some tags!");
    }

    List<Widget> matchCards = new List<Widget>();

    for (var i = 0; i < matches.length; i++) {
      matchCards.add(new MatchCard(match: matches[i],));
    }

    return new Column(children: matchCards,);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MatchList> (
      future: matchList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return matchCol(snapshot.data.matches);
        }
        else if (snapshot.hasError) {
          return Text("Could not fetch user matches");
        }
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}


class MatchCard extends StatelessWidget {
  final Match match;

  MatchCard({Key key, this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration( //To show the borders
          border: Border.all(width: 1.0, color: Colors.black),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 4 * MediaQuery.of(context).size.width / 5,
            minHeight: 3 * MediaQuery.of(context).size.width / 5,
            maxWidth: 4 * MediaQuery.of(context).size.width / 5,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 4 * MediaQuery.of(context).size.width / 5,
                height: 3 * MediaQuery.of(context).size.width / 5,
                child: FittedBox(
                  child: Image.asset("docs/beatrizcardoso.png"),
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(match.name),
                  ),
                  TagDisplay(tags: match.tags),
                ],
              )
            ],
          ),
        )
    );
  }
}