import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  final String title;

  NoteDetails(this.title);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [IconButton(icon: Icon(Icons.check), onPressed: null)],
        ),
        body: Center(
            // TODO
            ));
  }
}
