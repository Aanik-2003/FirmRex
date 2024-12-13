import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWithNotes extends StatefulWidget {
  const CalendarWithNotes({super.key});

  @override
  State<CalendarWithNotes> createState() => _CalendarWithNotesState();
}

class _CalendarWithNotesState extends State<CalendarWithNotes> {
  // Calendar controller variables
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Store notes as a map: { Date: List<Notes> }
  Map<DateTime, List<String>> _notes = {};

  // Text Controller for note input
  final TextEditingController _noteController = TextEditingController();

  // BottomNavigationBar current index
  int _selectedIndex = 0;

  // Function to add a note for the selected day
  void _addNote() {
    if (_selectedDay == null || _noteController.text.trim().isEmpty) return;

    setState(() {
      _notes.putIfAbsent(_selectedDay!, () => []);
      _notes[_selectedDay!]!.add(_noteController.text.trim());
      _noteController.clear();
    });
  }

  // Function to edit an existing note
  void _editNote(int index) {
    if (_selectedDay == null) return;

    _noteController.text = _notes[_selectedDay!]![index]; // Pre-fill note text
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Note'),
        content: TextField(
          controller: _noteController,
          decoration: const InputDecoration(
            labelText: 'Edit your note',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _notes[_selectedDay!]![index] = _noteController.text.trim();
                _noteController.clear();
              });
              Navigator.pop(context); // Close dialog
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // Function to delete a note
  void _deleteNote(int index) {
    if (_selectedDay == null) return;

    setState(() {
      _notes[_selectedDay!]!.removeAt(index);
      if (_notes[_selectedDay!]!.isEmpty) {
        _notes.remove(_selectedDay!); // Remove key if no notes left for the day
      }
    });
  }

  // Function to get notes for a day
  List<String> _getNotesForDay(DateTime day) {
    return _notes[day] ?? [];
  }

  // Handle BottomNavigationBar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Dummy navigation for example purposes
    switch (index) {
      case 0:
        debugPrint("Home Selected");
        break;
      case 1:
        debugPrint("Explore Selected");
        break;
      case 2:
        debugPrint("Map Selected");
        break;
      case 3:
        debugPrint("Manage Selected");
        break;
      case 4:
        debugPrint("Profile Selected");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'), foregroundColor: Colors.white,

        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Calendar widget
          TableCalendar(
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
          ),

          const SizedBox(height: 10),

          // Input field to add a note
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: const InputDecoration(
                      labelText: 'Add a note',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addNote,
                  color: Colors.green,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Display notes for the selected day with edit and delete options
          Expanded(
            child: _selectedDay != null
                ? ListView.builder(
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
                        onPressed: () => _editNote(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(index),
                      ),
                    ],
                  ),
                );
              },
            )
                : const Center(
              child: Text(
                'Select a day to view or add notes.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[200],
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
