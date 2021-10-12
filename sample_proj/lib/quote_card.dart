import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Quote: ${quote.text}',
              style: TextStyle(
                fontFamily: 'Dancing_Script',
                fontSize: 18,
                color: Colors.red[600],
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Author: ${quote.author}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            FlatButton.icon(
                onPressed: delete,
                label: Text('delete quote'),
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
