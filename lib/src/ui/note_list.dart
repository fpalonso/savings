import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Center(
        // TODO
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // TODO
        }
      ),
    );
  }
}
