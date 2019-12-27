import 'package:flutter/material.dart';

class TagDisplay extends StatelessWidget {
  final List<dynamic> tags;

  const TagDisplay({Key key, this.tags}) : super(key: key);

  Widget getTags() {
    List<Widget> tagList = new List<Widget>();

    for (var i = 0; i < tags.length; i++) {
      tagList.add(RaisedButton(
        disabledColor: Colors.blueGrey[300],
        padding: EdgeInsets.all(3.0),
        child: Text(
          this.tags[i].toString(),
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
      ));
    }
    return new Wrap(
      spacing: 2.0,
      runSpacing: 1.0,
      direction: Axis.horizontal,
      children: tagList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getTags();
  }

}