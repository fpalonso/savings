import 'package:flutter/material.dart';
import 'package:savings/src/ui/note_details.dart';

class NoteList extends StatefulWidget {
  final String title;

  NoteList(this.title);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          // TODO
          ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NoteDetails('Note details'),
            ));
          }),
    );
  }
}
