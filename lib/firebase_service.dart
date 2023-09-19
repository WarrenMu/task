import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/models/note.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // for hamdling auth errors
      print("Authentication Error: $e");
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
  }

  Future<void> addNoteToFirestore(Note note) async {
    try {
      await _firestore.collection("notes").add({
        'title': note.title,
        'content': note.content,
      });
    } catch (e) {
      //for handling firestore error
      print("Firestore Error: $e");
    }
  }

  Stream<List<Note>> getNotesFromFirestore() {
    return _firestore.collection('notes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(
          id: doc.id,
          title: data['title'] ?? '',
          content: data['content'] ?? '',
        );
      }).toList();
    });
  }
}
