import 'package:flutter/material.dart';

import 'TagDisplay.dart';

class Match {
  final String name;
  final List<dynamic> tags;

  Match(this.name, this.tags);
}


class MatchPage extends StatelessWidget {
  Match match1 = new Match("Gajoo", ["cenas 1", "cenas 2", "cenas 3"]);
  Match match2 = new Match("Gajoo", ["cenas 1", "cenas 2", "cenas 3"]);

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
            child: MatchDisplay(matches: [match1, match2],),
          ),
        ),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({Key key, this.match}) : super(key: key);

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

class MatchDisplay extends StatelessWidget {
  final List<Match> matches;

  const MatchDisplay({Key key, this.matches}) : super(key: key);


  Widget matchCol() {
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
    return this.matchCol();
  }

}
