import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:savings/src/datasource/note_repository.dart';
import 'package:savings/src/ui/note_details.dart';

void main() {
  testWidgets('Widget shows needed fields', (WidgetTester tester) async {
    await tester.pumpWidget(ChangeNotifierProvider<NoteRepository>(
      create: (context) => NoteRepository(),
      child: MaterialApp(home: NoteDetails('Note details')),
    ));

    expect(find.text('Note details'), findsOneWidget);
    expect(find.byKey(Key('dateTime')), findsOneWidget);
    expect(find.byKey(Key('amount')), findsOneWidget);
    expect(find.byKey(Key('title')), findsOneWidget);
  });
  testWidgets('Clicking accept inserts a new note',
      (WidgetTester tester) async {
    final repo = NoteRepository();
    await tester.pumpWidget(ChangeNotifierProvider<NoteRepository>(
      create: (context) => repo,
      child: MaterialApp(
        home: NoteDetails('Note details'),
      ),
    ));
    repo.addListener(() async {
      final notes = await repo.getAllNotes();

      expect(notes.length, equals(1));

      final firstNote = notes.first;

      expect(firstNote.title, equals('First note'));
      expect(firstNote.amount, equals(Decimal.parse("171.82")));
      expect(firstNote.dateTime, equals(DateTime(2021, 3, 14)));
    });

    final notes = await repo.getAllNotes();
    expect(notes, isEmpty);

    await tester.enterText(
        find.byKey(Key('dateTime')), DateTime(2021, 3, 14).toString());
    await tester.enterText(find.byKey(Key('amount')), "171.82");
    await tester.enterText(find.byKey(Key('title')), 'First note');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
  });
}
