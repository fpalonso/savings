import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:savings/src/ui/note_details.dart';
import 'package:savings/src/ui/note_list.dart';

void main() {
  testWidgets('Can open NoteDetails from NoteList',
      (WidgetTester tester) async {
    final detailsFinder = find.byType(NoteDetails);

    await tester.pumpWidget(MaterialApp(
      home: NoteList('Notes'),
    ));

    expect(detailsFinder, findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(detailsFinder, findsOneWidget);
  });
}
