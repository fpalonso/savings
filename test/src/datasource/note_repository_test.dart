import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savings/src/datasource/note_repository.dart';
import 'package:savings/src/model/note.dart';

void main() {
  test('Notes are inserted and retrieved', () async {
    final repo = NoteRepository();
    repo.addListener(() async {
      List notes = await repo.getAllNotes();
      expect(notes.length, equals(1));
      expect((notes.first as Note).title, equals('First note'));
    });

    List notes = await repo.getAllNotes();
    expect(notes, isEmpty);

    final note = Note(
      title: 'First note',
      amount: Decimal.parse("3.20")
    );
    repo.addNote(note);
  });
  test('addNote returns the note', () {
    final repo = NoteRepository();
    final note = Note();
    expect(repo.addNote(note), same(note));
  });
}