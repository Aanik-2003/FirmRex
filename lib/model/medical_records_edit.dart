import 'dart:convert';
import 'package:firm_rex/controller/medical_records_controller.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class EditMedicalRecords {
  final _medicalController = MedicalRecordsController();

  late final String pickedImage;

  void addPastVaccineForm(BuildContext context) {
    // Define controllers for text fields
    TextEditingController vaccineNameController = TextEditingController();
    TextEditingController doctorNameController = TextEditingController();
    DateTime? selectedDate;

    // Function to clear all fields
    void clearFields() {
      vaccineNameController.clear();
      doctorNameController.clear();
      selectedDate = null;
      _medicalController.pickedImage = null; // Clear the picked image
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Add Vaccine",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Vaccine Name Field
                    TextField(
                      controller: vaccineNameController,
                      decoration: const InputDecoration(
                        labelText: "Vaccine Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Date Picker Field
                    InkWell(
                      onTap: () async {
                        // Open date picker
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDate != null
                                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                  : "Select Date",
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const Icon(Icons.calendar_today, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Doctor Name Field
                    TextField(
                      controller: doctorNameController,
                      decoration: const InputDecoration(
                        labelText: "Doctor Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Upload Icon and Text
                    if (_medicalController.pickedImage != null)
                      Image.file(
                        _medicalController.pickedImage!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    else
                      const Text("No image selected"),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        await _medicalController.pickImage(); // Trigger image picker
                        setState(() {}); // Refresh UI to display the picked image
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Upload Image"),
                    ),
                    const SizedBox(height: 20),
                    // Action Buttons (Cancel and Save)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Cancel Button
                        TextButton(
                          onPressed: () {
                            clearFields(); // Clear all fields
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        // Save Button
                        ElevatedButton(
                          onPressed: () async {
                            String vaccineName = vaccineNameController.text;
                            String doctorName = doctorNameController.text;

                            if (vaccineName.isNotEmpty && selectedDate != null && doctorName.isNotEmpty) {
                              // Show a progress indicator (loading) while saving the data
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Saving vaccine information...'), duration: Duration(seconds: 2)),
                              );

                              // Show a loading indicator or progress here while saving data (use a Future if necessary)
                              try {
                                // Assuming the method to add the vaccine is asynchronous
                                bool success = await _medicalController.addPastVaccine(vaccineName, selectedDate!, doctorName);

                                if (success) {
                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Vaccine information added successfully!'), backgroundColor: Colors.green),
                                  );
                                  _medicalController.fetchAllVaccines();
                                } else {
                                  // Show failure message if something went wrong
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Failed to add vaccine information. Please try again.'), backgroundColor: Colors.red),
                                  );
                                }
                              } catch (e) {
                                // Handle errors (e.g., network issues)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                                );
                              }

                              // Close the dialog
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all the fields.')),
                              );
                            }
                          },
                          child: const Text("Save"),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Method to show vaccine details in a popup window
  void showVaccineDetailsPopup(BuildContext context, Map<String, dynamic> vaccine) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Vaccine Details"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vaccine Name
              Text(
                "Vaccine Name: ${vaccine['vaccineName'] ?? 'Unknown Vaccine'}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Date Given
              Text(
                '${vaccine['dateGiven'].day}/${vaccine['dateGiven'].month}/${vaccine['dateGiven'].year}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              // Doctor Name
              Text(
                "Doctor: ${vaccine['doctorName'] ?? 'Unknown'}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              // Image Display
              if (vaccine['image_base64'] != null)
                GestureDetector(
                  onTap: () {
                    // Show full-size image when clicked
                    showFullSizeImage(context, vaccine['image_base64']);
                  },
                  child: Image.memory(
                    base64Decode(vaccine['image_base64']),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                )
              else
                const Text("No image available"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  // Method to show the full-size image with zoom and download options
  void showFullSizeImage(BuildContext context, String base64Image) async {
    // Convert base64 image to bytes
    final imageBytes = base64Decode(base64Image);

    // Show dialog with zoomable image
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Full Size Image"),
        content: GestureDetector(
          onTap: () {
            Navigator.pop(context);  // Close image on tap
          },
          child: PhotoView(
            imageProvider: MemoryImage(imageBytes),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Close the dialog
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void addPastTreatmentForm(BuildContext context) {
    // Define controllers for text fields
    TextEditingController treatmentNameController = TextEditingController();
    TextEditingController doctorNameController = TextEditingController();
    DateTime? selectedDate;

    // Function to clear all fields
    void clearFields() {
      treatmentNameController.clear();
      doctorNameController.clear();
      selectedDate = null;
      _medicalController.pickedImage = null; // Clear the picked image
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Add Treatment",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Vaccine Name Field
                    TextField(
                      controller: treatmentNameController,
                      decoration: const InputDecoration(
                        labelText: "Treatment Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Date Picker Field
                    InkWell(
                      onTap: () async {
                        // Open date picker
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDate != null
                                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                  : "Select Date",
                              style: const TextStyle(color: Colors.black54),
                            ),
                            const Icon(Icons.calendar_today, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Doctor Name Field
                    TextField(
                      controller: doctorNameController,
                      decoration: const InputDecoration(
                        labelText: "Doctor Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Upload Icon and Text
                    if (_medicalController.pickedImage != null)
                      Image.file(
                        _medicalController.pickedImage!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    else
                      const Text("No image selected"),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        await _medicalController.pickImage(); // Trigger image picker
                        setState(() {}); // Refresh UI to display the picked image
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text("Upload Image"),
                    ),
                    const SizedBox(height: 20),
                    // Action Buttons (Cancel and Save)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Cancel Button
                        TextButton(
                          onPressed: () {
                            clearFields(); // Clear all fields
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        // Save Button
                        ElevatedButton(
                          onPressed: () async {
                            String vaccineName = treatmentNameController.text;
                            String doctorName = doctorNameController.text;

                            if (vaccineName.isNotEmpty && selectedDate != null && doctorName.isNotEmpty) {
                              // Show a progress indicator (loading) while saving the data
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Saving treatment information...'), duration: Duration(seconds: 2)),
                              );

                              // Show a loading indicator or progress here while saving data (use a Future if necessary)
                              try {
                                // Assuming the method to add the vaccine is asynchronous
                                bool success = await _medicalController.addPastTreatments(vaccineName, selectedDate!, doctorName);

                                if (success) {
                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Treatment information added successfully!'), backgroundColor: Colors.green),
                                  );
                                  _medicalController.fetchAllTreatments();
                                } else {
                                  // Show failure message if something went wrong
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Failed to add treatment information. Please try again.'), backgroundColor: Colors.red),
                                  );
                                }
                              } catch (e) {
                                // Handle errors (e.g., network issues)
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                                );
                              }

                              // Close the dialog
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all the fields.')),
                              );
                            }
                          },
                          child: const Text("Save"),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void showTreatmentDetailsPopup(BuildContext context, Map<String, dynamic> treatment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Treatment Details"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vaccine Name
              Text(
                "Treatment Name: ${treatment['treatmentName'] ?? 'Unknown Treatment'}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Date Given
              Text(
                '${treatment['dateGiven'].day}/${treatment['dateGiven'].month}/${treatment['dateGiven'].year}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              // Doctor Name
              Text(
                "Doctor: ${treatment['doctorName'] ?? 'Unknown'}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              // Image Display
              if (treatment['image_base64'] != null)
                GestureDetector(
                  onTap: () {
                    // Show full-size image when clicked
                    showFullSizeImage(context, treatment['image_base64']);
                  },
                  child: Image.memory(
                    base64Decode(treatment['image_base64']),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                )
              else
                const Text("No image available"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

}
