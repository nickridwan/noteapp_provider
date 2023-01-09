import 'package:flutter/cupertino.dart';

import '../models/note.dart';

class NotesOperation with ChangeNotifier {
  //List of note
  List<Note> _notes = [];
  bool _isErr = false;

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote('First Note', 'First Note Description');
  }

  void addNewNote(String titleContent, String descContent) {
    //Note object
    Note note = Note(title: titleContent, desc: descContent);
    if (titleContent.isEmpty || descContent.isEmpty) {
    } else {
      _notes.add(note);
      notifyListeners();
    }
  }
}
