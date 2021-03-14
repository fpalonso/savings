import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savings/src/datasource/note_repository.dart';
import 'package:savings/src/model/note.dart';

class NoteDetails extends StatefulWidget {
  final String title;

  NoteDetails(this.title);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  final _formKey = GlobalKey<FormState>();
  DateTime _dateTime = DateTime.now();
  final _dateTimeController =
      TextEditingController(text: DateTime.now().toLocal().toString());
  final _titleFieldController = TextEditingController();
  final _amountFieldController = TextEditingController();

  final _fieldSeparator = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Consumer<NoteRepository>(
              builder: (context, repo, child) => Column(
                children: [
                  _buildDateTimeField(_dateTime, () async {
                    final selectedDT = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2100));
                    if (selectedDT != null) {
                      setState(() {
                        _dateTime = selectedDT;
                        _dateTimeController.text =
                            selectedDT.toLocal().toString();
                      });
                    }
                  }),
                  _fieldSeparator,
                  _buildAmountField(),
                  _fieldSeparator,
                  _buildTitleField()
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Provider.of<NoteRepository>(context, listen: false).addNote(Note(
              dateTime: DateTime.parse(_dateTimeController.text),
              amount: _amount,
              title: _titleFieldController.text));
        },
      ),
    );
  }

  TextFormField _buildDateTimeField(DateTime dateTime, Function onTapped) {
    return TextFormField(
      key: Key('dateTime'),
      controller: _dateTimeController,
      decoration: InputDecoration(
          labelText: 'Date',
          border: OutlineInputBorder(),
          icon: Icon(Icons.calendar_today)),
      onTap: onTapped,
    );
  }

  TextFormField _buildAmountField() {
    return TextFormField(
        key: Key('amount'),
        controller: _amountFieldController,
        decoration: InputDecoration(
            labelText: 'Amount',
            border: OutlineInputBorder(),
            icon: Icon(Icons.money)));
  }

  Decimal get _amount {
    if (_amountFieldController.text.isEmpty) {
      _amountFieldController.text = '0';
    }
    try {
      return Decimal.parse(_amountFieldController.text);
    } on FormatException {
      return Decimal.zero;
    }
  }

  TextFormField _buildTitleField() {
    return TextFormField(
        key: Key('title'),
        controller: _titleFieldController,
        decoration: InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
            icon: Icon(Icons.title)));
  }
}
