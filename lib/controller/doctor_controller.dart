import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DoctorController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  // List to store locally fetched doctor data (for UI display)
  final List<Map<String, dynamic>> _doctors = [];

  List<Map<String, dynamic>> get doctors => _doctors;

  /// Fetch all doctors from Firestore and update the local `_doctors` list
  Future<void> fetchDoctors() async {
    try {
      final snapshot = await _firestore.collection('doctors').get();
      _doctors.clear();
      for (var doc in snapshot.docs) {
        final doctorData = doc.data();
        doctorData['id'] = doc.id; // Include document ID for updates/deletes
        _doctors.add(doctorData);
      }
      notifyListeners(); // Notify UI about changes
    } catch (e) {
      print("Error fetching doctors: $e");
    }
  }

  /// Add a new doctor to Firestore
  Future<void> addDoctor(
    String prefix,
    String fullName,
    String fieldOfStudy,
    String location,
    String chargePerAppointment,
    File photo,
    File certificate,
  ) async {
    try {
      // Convert images to Base64
      final String photoBase64 = await _convertImageToBase64(photo);
      final String certificateBase64 = await _convertImageToBase64(certificate);

      // Save data to Firestore
      await _firestore.collection('doctors').add({
        'prefix': prefix,
        'fullName': fullName,
        'fieldOfStudy': fieldOfStudy,
        'location': location,
        'chargePerAppointment': chargePerAppointment,
        'photo': photoBase64,
        'certificate': certificateBase64,
        'status': 'Verified',
      });

      // Refresh the local list
      await fetchDoctors();
      print("Doctor added successfully.");
    } catch (e) {
      print("Error adding doctor: $e");
    }
  }

  /// Update an existing doctor in Firestore
  Future<void> updateDoctor(
      String id,
        String prefix,
        String fullName,
        String fieldOfStudy,
        String location,
        String chargePerAppointment,
        File? photo,
        File? certificate,
      ) async {
    try {
      // Prepare updated data
      Map<String, dynamic> updatedData = {
        'prefix': prefix,
        'fullName': fullName,
        'fieldOfStudy': fieldOfStudy,
        'location': location,
        'chargePerAppointment': chargePerAppointment,
      };

      // Convert and add images if provided
      if (photo != null) {
        updatedData['photo'] = await _convertImageToBase64(photo);
      }
      if (certificate != null) {
        updatedData['certificate'] = await _convertImageToBase64(certificate);
      }

      // Update Firestore document
      await _firestore.collection('doctors').doc(id).update(updatedData);

      // Refresh the local list
      await fetchDoctors();
      print("Doctor updated successfully.");
    } catch (e) {
      print("Error updating doctor: $e");
    }
  }

  /// Delete a doctor from Firestore
  Future<void> deleteDoctor(String id) async {
    try {
      await _firestore.collection('doctors').doc(id).delete();

      // Refresh the local list
      await fetchDoctors();
      print("Doctor deleted successfully.");
    } catch (e) {
      print("Error deleting doctor: $e");
    }
  }

  /// Pick an image using the image picker
  Future<File?> pickImage() async {
    try {
      final XFile? pickedFile =
      await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        print("No image selected.");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
    return null;
  }

  /// Convert an image file to Base64
  Future<String> _convertImageToBase64(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      print("Error converting image to Base64: $e");
      throw e;
    }
  }
}
