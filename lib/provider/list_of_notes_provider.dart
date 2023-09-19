import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/models/note.dart';

class NoteState extends ChangeNotifier {
  List<Note> _notes = [];
  bool _isLoggedIn = false;

  List<Note> get notes => _notes;
  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }
}
