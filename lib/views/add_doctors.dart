import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io';
import '../controller/doctor_controller.dart';

class AddDoctors extends StatefulWidget {
  final Function(BuildContext, int, bool) onItemTapped;
  final int selectedIndex;

  const AddDoctors({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _AddDoctorsState createState() => _AddDoctorsState();
}

class _AddDoctorsState extends State<AddDoctors> {
  final _formKey = GlobalKey<FormState>();
  final DoctorController _doctorController = DoctorController();

  late TextEditingController _fullNameController;
  late TextEditingController _fieldOfStudyController;
  late TextEditingController _locationController;
  late TextEditingController _chargePerAppointmentController;

  int selectedIndex;
  String _prefix = 'Dr.';
  File? _photo;
  File? _certificate;

  _AddDoctorsState() : selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
    _doctorController.fetchDoctors();
    _fullNameController = TextEditingController();
    _fieldOfStudyController = TextEditingController();
    _locationController = TextEditingController();
    _chargePerAppointmentController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshDoctors(); // Ensure data is refreshed whenever dependencies change
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _fieldOfStudyController.dispose();
    _locationController.dispose();
    _chargePerAppointmentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(bool isPhoto) async {
    final file = await _doctorController.pickImage();
    if (file != null) {
      setState(() {
        if (isPhoto) {
          _photo = file;
        } else {
          _certificate = file;
        }
      });
    }
  }

  void _clearForm() {
    setState(() {
      _prefix = 'Dr.';
      _fullNameController.clear();
      _fieldOfStudyController.clear();
      _locationController.clear();
      _chargePerAppointmentController.clear();
      _photo = null;
      _certificate = null;
    });
  }

  void _showFormModal([String? id]) {
    if (id != null) {
      final doctor = _doctorController.doctors.firstWhere((doc) => doc['id'] == id);
      setState(() {
        _prefix = doctor['prefix'];
        _fullNameController.text = doctor['fullName'];
        _fieldOfStudyController.text = doctor['fieldOfStudy'];
        _locationController.text = doctor['location'];
        _chargePerAppointmentController.text = doctor['chargePerAppointment'];
      });
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: _prefix,
                    items: ['Dr.', 'Veterinary']
                        .map((prefix) => DropdownMenuItem(value: prefix, child: Text(prefix)))
                        .toList(),
                    onChanged: (value) => setState(() => _prefix = value!),
                    decoration: const InputDecoration(labelText: 'Prefix'),
                  ),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (value) => value!.isEmpty ? 'Please enter the full name' : null,
                  ),
                  TextFormField(
                    controller: _fieldOfStudyController,
                    decoration: const InputDecoration(labelText: 'Field of Study'),
                    validator: (value) => value!.isEmpty ? 'Please enter the field of study' : null,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(labelText: 'Location'),
                    validator: (value) => value!.isEmpty ? 'Please enter the location' : null,
                  ),
                  TextFormField(
                    controller: _chargePerAppointmentController,
                    decoration: const InputDecoration(labelText: 'Charge Per Appointment'),
                    validator: (value) => value!.isEmpty ? 'Please enter the charge' : null,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => _pickImage(true),
                        child: Text(_photo == null ? 'Upload Photo' : 'Photo Uploaded'),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickImage(false),
                        child: Text(_certificate == null ? 'Upload Certificate' : 'Certificate Uploaded'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                          _clearForm();
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_photo == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please upload a photo.')),
                              );
                              return;
                            }

                            if (id == null) {
                              await _doctorController.addDoctor(
                                _prefix,
                                _fullNameController.text,
                                _fieldOfStudyController.text,
                                _locationController.text,
                                _chargePerAppointmentController.text,
                                _photo!,
                                _certificate!,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Doctor added successfully!')),
                              );
                            } else {
                              await _doctorController.updateDoctor(
                                id,
                                _prefix,
                                _fullNameController.text,
                                _fieldOfStudyController.text,
                                _locationController.text,
                                _chargePerAppointmentController.text,
                                _photo,
                                _certificate,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Doctor updated successfully!')),
                              );
                              _doctorController.fetchDoctors();
                            }
                            _clearForm();
                            Navigator.pop(context);
                          }
                        },
                        child: Text(id == null ? 'Add Doctor' : 'Update Doctor'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _refreshDoctors() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _doctorController.fetchDoctors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[200],
        currentIndex: selectedIndex,
        onTap: (index) {
          widget.onItemTapped(context, index, true);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Manage'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        title: const Text('Manage Doctors'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshDoctors,
        child: _doctorController.doctors.isEmpty
            ? const Center(child: Text('No doctors added yet.'))
            : ListView.builder(
          itemCount: _doctorController.doctors.length,
          itemBuilder: (context, index) {
            final doctor = _doctorController.doctors[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: doctor['photo'] != null
                      ? MemoryImage(base64Decode(doctor['photo']))
                      : null,
                  child: doctor['photo'] == null ? const Icon(Icons.person) : null,
                ),
                title: Text('${doctor['prefix']} ${doctor['fullName']}'),
                subtitle: Text('Field: ${doctor['fieldOfStudy']}\nLocation: ${doctor['location']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showFormModal(doctor['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await _doctorController.deleteDoctor(doctor['id']);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Doctor removed successfully!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormModal(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
