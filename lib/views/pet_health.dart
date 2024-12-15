import 'package:firm_rex/model/medical_records_edit.dart';
import 'package:firm_rex/views/medical_records.dart';
import 'package:flutter/material.dart';
import '../controller/medical_records_controller.dart';

class PetHealth extends StatefulWidget {

  const PetHealth({super.key,});
  @override
  _PetHealthState createState() => _PetHealthState();
}

class _PetHealthState extends State<PetHealth>{
  final _editMedicalRecords = EditMedicalRecords();
  final _medicalController = MedicalRecordsController();

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {

      _medicalController.fetchAllVaccines();
      _medicalController.fetchAllTreatments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context), // Fixed header
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData, // Define a method to handle refresh logic
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 20),
                  _buildCard(
                    context,
                    title: "New Vaccinations",
                    onAddPressed: () => _editMedicalRecords.addPastVaccineForm(context),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _medicalController.fetchAllVaccines(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text("No Vaccines Found"));
                        } else {
                          List<Map<String, dynamic>> vaccines = snapshot.data!;
                          return _buildHorizontalScrollVaccine(context, vaccines);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildCard(
                    context,
                    title: "Past Treatments",
                    onAddPressed: () => _editMedicalRecords.addPastTreatmentForm(context),
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _medicalController.fetchAllTreatments(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text("No Treatment Found"));
                        } else {
                          List<Map<String, dynamic>> treatments = snapshot.data!;
                          return _buildHorizontalScrollTreatment(context, treatments);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fixed Header Widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.only(top: 30.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                "Pet Health",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Wellness",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationThickness: 4,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicalRecords()),
                  );
                },
                child: const Text(
                  "Medical Records",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Reusable Card Widget
  Widget _buildCard(
      BuildContext context, {
        required String title,
        required VoidCallback onAddPressed,
        required Widget child,
      }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black.withOpacity(0.3),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "New",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 3,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: onAddPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          size: 32,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          child,
        ],
      ),
    );
  }

  // Horizontal Scroll Implementation for displaying vaccines
  Widget _buildHorizontalScrollVaccine(BuildContext context, List<Map<String, dynamic>> vaccines) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: vaccines.map((vaccine) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                // Show the details dialog when a container is clicked
                _editMedicalRecords.showVaccineDetailsPopup(context, vaccine);
              },
              child: Container(
                width: 180,
                height: 150,  // Increased height to accommodate more text
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vaccine Name
                      Text(
                        vaccine['vaccineName'] ?? 'Unknown Vaccine',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                        'Doctor: ${vaccine['doctorName'] ?? 'Unknown'}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }


  Widget _buildHorizontalScrollTreatment(BuildContext context, List<Map<String, dynamic>> treatments) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: treatments.map((treatment) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                // Show the details dialog when a container is clicked
                _editMedicalRecords.showVaccineDetailsPopup(context, treatment);
              },
              child: Container(
                width: 180,
                height: 150,  // Increased height to accommodate more text
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Vaccine Name
                      Text(
                        treatment['treatmentName'] ?? 'Unknown Treatment',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                        'Doctor: ${treatment['doctorName'] ?? 'Unknown'}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}