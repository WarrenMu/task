import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addNote(BuildContext context) async {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      try {
        await _firestore.collection('notes').add({
          'title': title,
          'content': content,
        });
        Navigator.pop(context); // Go back to the previous screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add note'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _addNote(context),
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
