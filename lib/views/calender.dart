import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class Calender extends StatelessWidget {
  const Calender({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar with Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalendarWithNotes(),
    );
  }
}

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

  // Function to add a note for the selected day
  void _addNote() {
    if (_selectedDay == null || _noteController.text.trim().isEmpty) return;

    setState(() {
      // Add note to the selected date
      _notes.putIfAbsent(_selectedDay!, () => []);
      _notes[_selectedDay!]!.add(_noteController.text.trim());
      _noteController.clear();
    });
  }

  // Function to show notes for a selected day
  List<String> _getNotesForDay(DateTime day) {
    return _notes[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar with Notes'),
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
                _focusedDay = focusedDay; // Keep focused day in sync
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
              // Highlight days with notes
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
                  color: Colors.blue,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Display notes for the selected day
          Expanded(
            child: _selectedDay != null
                ? ListView.builder(
              itemCount: _getNotesForDay(_selectedDay!).length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.note),
                  title: Text(_getNotesForDay(_selectedDay!)[index]),
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
    );
  }
}
