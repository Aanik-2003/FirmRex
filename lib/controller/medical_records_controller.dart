import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      // Perform save operation (e.g., saving to Firestore)
      await FirebaseFirestore.instance.collection('pastVaccines').add({
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

  // Method to retrieve all past vaccines from Firestore
  Future<List<Map<String, dynamic>>> fetchAllVaccines() async {
    try {
      // Fetching all documents from the 'pastVaccines' collection
      QuerySnapshot snapshot = await _firestore.collection('pastVaccines').orderBy('createdAt', descending: true).get();

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
      print("Error fetching vaccines: $e");
      return [];
    }
  }

  // Method to add a past vaccine record to Firestore
  Future<bool> addPastTreatments(String treatmentName, DateTime date, String doctorName) async {
    try {
      // Perform save operation (e.g., saving to Firestore)
      await FirebaseFirestore.instance.collection('pastTreatments').add({
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

  // Method to retrieve all past vaccines from Firestore
  Future<List<Map<String, dynamic>>> fetchAllTreatments() async {
    try {
      // Fetching all documents from the 'pastVaccines' collection
      QuerySnapshot snapshot = await _firestore.collection('pastTreatments').orderBy('createdAt', descending: true).get();

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

      return treatments; // Return the list of vaccines
    } catch (e) {
      print("Error fetching treatments: $e");
      return [];
    }
  }
}