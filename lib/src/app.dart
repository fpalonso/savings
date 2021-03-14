import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savings/src/datasource/note_repository.dart';
import 'package:savings/src/ui/note_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteRepository>(
        create: (context) => NoteRepository(),
        child: MaterialApp(title: 'Savings', home: NoteList('Notes')));
  }
}
