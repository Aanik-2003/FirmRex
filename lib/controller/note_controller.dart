import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NoteController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  // Add a new note to Firestore
  Future<void> addNote(String title, DateTime timestamp) async {
    try {
      await _firestore.collection('notes').add({
        'title': title,
        'timestamp': timestamp,
        'uid': uid,
      });
    } catch (e) {
      print("Error adding note: $e");
    }
  }

  // Retrieve notes from Firestore as a stream
  Stream<List<Map<String, dynamic>>> getNotes(DateTime selectedDay) {
    // Get the start and end of the selected day
    DateTime startOfDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));

    // Query Firestore for notes within the selected day's range
    return _firestore
        .collection('notes')
        .where('timestamp', isGreaterThanOrEqualTo: startOfDay)
        .where('timestamp', isLessThanOrEqualTo: endOfDay)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'timestamp': (doc['timestamp'] as Timestamp).toDate(),
        };
      }).toList();
    });
  }


  // Update a note by its document ID
  Future<void> updateNote(String id, String newTitle, DateTime date) async {
    try {
      await _firestore.collection('notes').doc(id).update({
        'title': newTitle,
        'timestamp': date,
      });
    } catch (e) {
      print("Error updating note: $e");
    }
  }

  // Delete a note by its document ID
  Future<void> deleteNote(String id) async {
    try {
      await _firestore.collection('notes').doc(id).delete();
    } catch (e) {
      print("Error deleting note: $e");
    }
  }
}