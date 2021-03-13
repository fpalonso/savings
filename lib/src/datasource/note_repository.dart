import 'package:flutter/foundation.dart';
import 'package:savings/src/model/note.dart';

class NoteRepository extends ChangeNotifier {
  // TODO use a db for this
  final List<Note> _cachedNotes = [];

  Future<List<Note>> getAllNotes() {
    return Future.value(_cachedNotes);
  }

  Note addNote(Note note) {
    _cachedNotes.add(note);
    notifyListeners();
    return note;
  }
}