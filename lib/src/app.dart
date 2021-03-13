import 'package:flutter/material.dart';
import 'package:savings/src/ui/note_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savings',
      home: NoteList('Notes'),
    );
  }
}
