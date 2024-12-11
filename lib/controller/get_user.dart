
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GetUser {

  // method to get user's name
  Future<String> getUserName() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final String userName = userDoc['UserName'] ?? 'User';
        return userName;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'User';
  }

  // method to get user's email
  Future<String> getUserEmail() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final String email = userDoc['Email'] ?? 'User';
        return email;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'User';
  }

  // method to get user's phone number
  Future<String> getUserNumber() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final int number = userDoc['Phone Number'] ?? 'Number';
        return number.toString();
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'Number';
  }

  // method to get user's address
  Future<String> getUserAddress() async {
    try {
      // Get the current logged-in user
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch the user details from Firestore
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Retrieve the full name field
        final String address = userDoc['Address'] ?? 'Address';
        return address;
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return 'Address';
  }

  // Method to update user's details
  Future<void> updateUserDetails(String userName, int age, int number, String address, String gender) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Reference to the user's document in Firestore
        final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        // Update the user's details
        await userRef.update({
          'UserName': userName,
          'Age': age,
          'Phone Number': number,
          'Address': address,
          'Gender': gender,
        });
        print("User details updated successfully");
      } else {
        print("No user is currently logged in.");
      }
    } catch (e) {
      print("Error updating user data: $e");
    }
  }

}