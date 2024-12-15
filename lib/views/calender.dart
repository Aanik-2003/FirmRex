import 'package:firm_rex/controller/booking_controller.dart';
import 'package:firm_rex/controller/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../auth/admin_provider.dart';

class CalendarWithNotes extends StatefulWidget {
  final Function(BuildContext, int, bool) onItemTapped;
  final int selectedIndex;

  const CalendarWithNotes({super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<CalendarWithNotes> createState() => _CalendarWithNotesState();
}

class _CalendarWithNotesState extends State<CalendarWithNotes> {
  final nc = NoteController();
  final bc = BookingController();
  // Calendar controller variables
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  int selectedIndex;
  _CalendarWithNotesState() : selectedIndex = 0; // Initial value to 0

  // Store notes as a map: { Date: List<Notes> }
  Map<DateTime, List<String>> _notes = {};
  Map<DateTime, List<Map<String, dynamic>>> _bookings = {};  // Store bookings

  // Text Controller for note input
  final TextEditingController _noteTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Check if _selectedDay is not null before calling getNotes
    // Fetch notes and bookings when a day is selected
    if (_selectedDay != null) {
      // Fetch notes
      nc.getNotes(_selectedDay!).listen((notes) {
        setState(() {
          _notes[_selectedDay!] = notes.map((note) => note['title'] as String).toList();
        });
      });

      // Fetch bookings
      bc.getBookings(_selectedDay!).listen((bookings) {
        setState(() {
          _bookings[_selectedDay!] = bookings;
        });
      });
    }
  }

  // Function to get both notes and bookings for a day
  List<String> _getEventsForDay(DateTime day) {
    List<String> events = [];
    if (_notes[day] != null) {
      events.addAll(_notes[day]!);
    }
    if (_bookings[day] != null) {
      // Add a simple representation of the bookings
      events.addAll(_bookings[day]!.map((booking) => 'Booking: ${booking['patientName']}'));
    }
    return events;
  }

  // Function to get notes for a day
  List<String> _getNotesForDay(DateTime day) {
    return _notes[day] ?? [];
  }

  void _showUpdateDialog(BuildContext context, String currentTitle, String noteId, int index) {
    TextEditingController _updateController = TextEditingController(text: currentTitle);
    DateTime selectedDate = _selectedDay!;  // Initial selected date

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextField for updating note title
              TextField(
                controller: _updateController,
                decoration: const InputDecoration(
                  labelText: 'Enter new title',
                ),
              ),
              const SizedBox(height: 5),
              // Date Picker
              TextButton(
                onPressed: () async {
                  // Open date picker dialog
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  'Date ${selectedDate.toLocal()}'.split(' ')[0], // Show only date in yyyy-MM-dd format
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String newTitle = _updateController.text.trim();
                if (newTitle.isNotEmpty) {
                  try {
                    // Call your controller to update the note
                    await nc.updateNote(noteId, newTitle, selectedDate);
                    // setState(() {
                    //   // After the note is updated, update the local state
                    //   _notes[selectedDate]![index] = newTitle; // Update the note locally
                    // });

                    // Show success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Note updated successfully!')),
                    );

                    Navigator.of(context).pop(); // Close the dialog

                    // Debug: Check if the SnackBar was triggered
                    print("SnackBar shown!");

                  } catch (e) {
                    print('Error updating note: $e');
                    // Optionally show a Snackbar or some error message to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating note: $e')),
                    );
                  }
                } else {
                  // Optionally show an error if the title is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Title cannot be empty!')),
                  );
                }
              },
              child: const Text('Update'),
            ),

          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    // Access isAdmin using Provider
    bool isAdmin = context.watch<AdminProvider>().isAdmin;

    // Dynamically create BottomNavigationBar items
    final List<BottomNavigationBarItem> bottomNavItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        label: 'Calendar',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Map',
      ),
      if (isAdmin)
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Manage',
        ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Calendar'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
          child: Column(
            children: [
              // Calendar widget
              Container(
                height: 350,
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  eventLoader: (day) {
                    return _getNotesForDay(day);
                  },
                  enabledDayPredicate: (day) {
                    return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) || isSameDay(day, DateTime.now());
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Input field to add a note
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _noteTextController,
                        decoration: const InputDecoration(
                          labelText: 'Add a note',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        if (_selectedDay != null && _noteTextController.text.trim().isNotEmpty) {
                          // Using NoteController here for adding a note
                          await nc.addNote(
                            _noteTextController.text.trim(),
                            _selectedDay!,
                          );
                          _noteTextController.clear(); // Clear input field
                        }
                      },
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Display notes for the selected day with edit and delete options
              _selectedDay != null
                  ? StreamBuilder<List<Map<String, dynamic>>>(
                stream: nc.getNotes(_selectedDay!), // Pass selected day here
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No notes for this day.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  List<Map<String, dynamic>> notes = snapshot.data!;

                  // Update _notes for the selected day
                  _notes[_selectedDay!] = notes.map((note) => note['title'] as String).toList();

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: _getNotesForDay(_selectedDay!).length,
                    itemBuilder: (context, index) {
                      final note = _getNotesForDay(_selectedDay!)[index];
                      return ListTile(
                        leading: const Icon(Icons.note),
                        title: Text(note),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () {
                                String currentTitle = _getNotesForDay(_selectedDay!)[index]; // Get current note title
                                String noteId = notes[index]['id'];  // Assuming 'id' is available in the note data

                                // Show the update dialog
                                _showUpdateDialog(context, currentTitle, noteId, index);
                              },
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                String id = notes[index]['id'];  // Assuming 'id' is available in the note data

                                // Call the deleteNote method from the NoteController
                                nc.deleteNote(id).then((_) {
                                  setState(() {
                                    // After deletion, remove the note from the local state
                                    _notes[_selectedDay!]!.removeAt(index); // Remove the note from the list
                                  });
                                }).catchError((e) {
                                  // Handle error if deletion fails
                                  print('Error deleting note: $e');
                                });
                              },
                            ),

                          ],
                        ),
                      );
                    },
                  );
                },
              )
                  : const Center(
                child: Text(
                  'Select a day to view or add notes.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.green[200],
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (index) {
            widget.onItemTapped(context, index, isAdmin);
          },
          items: bottomNavItems,
        ),
        resizeToAvoidBottomInset: true,
       );
   }
}