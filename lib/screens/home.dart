import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task/screens/add_note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _signOut(BuildContext context) async {
    await widget._auth.signOut();
    Navigator.pushReplacementNamed(context, '/signIn');
  }

  void _navigateToAddNote(BuildContext context) async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNoteScreen()), // Navigate to AddNoteScreen
    );

    if (newNote != null) {
      // Add the new note to Firestore
      await _firestore.collection('notes').add({
        'title': newNote.title,
        'content': newNote.content,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF63A69F), // Teal
                Color(0xFFF29492), // Salmon
                Color(0xFFE7C3B6), // Peach
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('notes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final notes = snapshot.data?.docs;

                return ListView.builder(
                  itemCount: notes?.length,
                  itemBuilder: (context, index) {
                    final note = notes?[index];
                    final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

                    return Dismissible(
                      key: Key(note!.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove the dismissed note from Firestore
                        _firestore.collection('notes').doc(note?.id).delete();
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: NoteCard(
                        note: Note(
                          title: note['title'],
                          content: note['content'],
                        ),
                        backgroundColor: randomColor,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => _navigateToAddNote(context), // Navigate to AddNoteScreen
            child: Text('Create Task'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF63A69F), // Teal
            ),
          ),
        ],
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final Note note;
  final Color backgroundColor;

  NoteCard({required this.note, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      color: backgroundColor,
      child: ListTile(
        title: Text(note.title),
        subtitle: Text(note.content),
      ),
    );
  }
}

class Note {
  final String title;
  final String content;

  Note({required this.title, required this.content});
}
