import 'package:firm_rex/controller/pet_controller.dart';
import 'package:firm_rex/model/pet_profile_edit.dart';
import 'package:firm_rex/views/pet_health.dart';
import 'package:firm_rex/views/user_dashboard.dart';
import 'package:flutter/material.dart';


class PetProfile extends StatefulWidget {
  final int selectedIndex;
  final Map<String, dynamic> pet;

  const PetProfile({super.key, required this.selectedIndex, required this.pet});

  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  final _petController = PetController();
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  Future<void> refreshPetProfile(String petId) async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _petController.getPetById(petId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pet = widget.pet;
    final petId = pet['id'];
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardPage(selectedIndex: 0),
              ),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for the avatar and other UI elements
            Stack(
              children: [
                // Wrap the CircleAvatar inside a RefreshIndicator
                RefreshIndicator(
                  onRefresh: () => refreshPetProfile(petId),
                  child: FutureBuilder<Image?>(
                    future: _petController.retrieveAndDecodeImage(petId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircleAvatar(
                          radius: 150,
                          backgroundColor: Colors.grey,
                          child: CircularProgressIndicator(), // Show a loading indicator
                        );
                      } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
                        return const CircleAvatar(
                          radius: 150,
                          backgroundImage: AssetImage('images/profile.png'), // Fallback image
                        );
                      } else {
                        final Image image = snapshot.data!;
                        return CircleAvatar(
                          radius: 150,
                          backgroundImage: MemoryImage((image.image as MemoryImage).bytes), // Display the local image
                        );
                      }
                    },
                  ),
                ),
                // Positioned photo icon in the bottom right corner
                Positioned(
                  bottom: 10,
                  right: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.photo_camera, color: Colors.green),
                      onPressed: () => _petController.pickAndStoreImage(petId),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Content below the image and icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RefreshIndicator(
                onRefresh: () => refreshPetProfile(petId), // Refresh function for the body
                child: FutureBuilder<Map<String, dynamic>>(
                  future: _petController.getPetById(petId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      final petData = snapshot.data!;
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            width: double.infinity,
                            height: size.height / 8,
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  petData['name'] ?? 'Unknown',
                                  style: const TextStyle(
                                    color: Color(0xFF131314),
                                    fontSize: 26,
                                    fontFamily: 'Fredoka',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF576AC),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Icon(
                                    petData['gender'] == 'Female' ? Icons.female : Icons.male,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "About Pet",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return EditPetProfile(petId: petId);
                                    },
                                  );
                                },
                                icon: const Icon(Icons.edit, color: Colors.blue),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildInfoCard('Breed', petData['breed'] ?? 'Unknown'),
                                SizedBox(width: 10),
                                _buildInfoCard('Age', petData['age'].toString() ?? 'Unknown'),
                                SizedBox(width: 10),
                                _buildInfoCard('Weight', petData['weight'].toString() ?? 'Unknown'),
                                SizedBox(width: 10),
                                _buildInfoCard('Height', petData['height'].toString() ?? 'Unknown'),
                                SizedBox(width: 10),
                                _buildInfoCard('Color', petData['color'] ?? 'Unknown'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            petData['description'] ?? "This pet does not have a description.",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Pet's Status",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.health_and_safety, color: Colors.red, size: 40),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    petData['healthStatus'] ?? 'View Health details',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PetHealth(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "View",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: Text("No pet data available."));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
