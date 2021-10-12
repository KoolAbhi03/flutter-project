import 'package:flutter/material.dart';

class Todocard extends StatefulWidget {
  final String s;
  final Function del;
  Todocard({this.s, this.del});

  @override
  _TodocardState createState() => _TodocardState();
}

class _TodocardState extends State<Todocard> {
  var ico = Icons.circle;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      margin: EdgeInsets.fromLTRB(5, 5, 0, 2),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                '${widget.s}',
                style: TextStyle(color: Colors.white),
              ),
              leading: IconButton(
                icon: Icon(ico),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    if (ico == Icons.circle) {
                      ico = Icons.done;
                    } else {
                      ico = Icons.circle;
                    }
                  });
                },
              ),
              trailing: IconButton(
                color: Colors.white,
                icon: Icon(Icons.delete),
                onPressed: widget.del,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
