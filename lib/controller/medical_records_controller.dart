import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class MedicalRecordsController extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  String? _base64Image;

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        pickedImage = File(pickedFile.path); // Store the picked file
        _base64Image = await _convertImageToBase64(pickedFile.path);
        notifyListeners(); // Notify UI listeners of state change
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  // Method to encode an image to Base64
  Future<String?> _convertImageToBase64(String imagePath) async {
    try {
      final bytes = await File(imagePath).readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      print("Error converting image to Base64: $e");
      return null;
    }
  }

  // Method to add a past vaccine record to Firestore
  Future<bool> addPastVaccine(String vaccineName, DateTime date, String doctorName) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      // Perform save operation (e.g., saving to Firestore)
      await FirebaseFirestore.instance.collection('pastVaccines').add({
        'uid': uid,
        'vaccineName': vaccineName,
        'dateGiven': date,
        'doctorName': doctorName,
        'image_base64': _base64Image,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print("Error adding vaccine: $e");
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllVaccines() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await _firestore
          .collection('pastVaccines')
          .where('uid', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .get();

      // Map the results to a list of maps
      List<Map<String, dynamic>> vaccines = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'vaccineName': doc['vaccineName'],
          'dateGiven': (doc['dateGiven'] as Timestamp).toDate(),
          'doctorName': doc['doctorName'],
          'image_base64': doc['image_base64'],
        };
      }).toList();

      return vaccines; // Return the list of vaccines
    } catch (e) {
      print("Error fetching user vaccines: $e");
      return [];
    }
  }


  // Method to add a past treatments record to Firestore
  Future<bool> addPastTreatments(String treatmentName, DateTime date, String doctorName) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('pastTreatments').add({
        'uid': uid,
        'treatmentName': treatmentName,
        'dateGiven': date,
        'doctorName': doctorName,
        'image_base64': _base64Image,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print("Error adding treatment: $e");
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllTreatments() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await _firestore
          .collection('pastTreatments')
          .where('userId', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .get();

      // Map the results to a list of maps
      List<Map<String, dynamic>> treatments = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'treatmentName': doc['treatmentName'],
          'dateGiven': (doc['dateGiven'] as Timestamp).toDate(),
          'doctorName': doc['doctorName'],
          'image_base64': doc['image_base64'],
        };
      }).toList();

      return treatments; // Return the list of treatments
    } catch (e) {
      print("Error fetching user treatments: $e");
      return [];
    }
  }

  // Method to add new vaccines record to Firestore
  Future<bool> addNewVaccines(String vaccineName, DateTime date, String doctorName) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('newVaccine').add({
        'uid': uid,
        'vaccineName': vaccineName,
        'dateGiven': date,
        'doctorName': doctorName,
        'image_base64': _base64Image,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return true;
    } catch (e) {
      print("Error adding new vaccine: $e");
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllNewVaccines() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await _firestore
          .collection('newVaccine')
          .where('uid', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .get();

      // Map the results to a list of maps
      List<Map<String, dynamic>> newVaccines = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'vaccineName': doc['vaccineName'],
          'dateGiven': (doc['dateGiven'] as Timestamp).toDate(),
          'doctorName': doc['doctorName'],
          'image_base64': doc['image_base64'],
        };
      }).toList();

      return newVaccines; // Return the list of treatments
    } catch (e) {
      print("Error fetching new vaccine: $e");
      return [];
    }
  }
}