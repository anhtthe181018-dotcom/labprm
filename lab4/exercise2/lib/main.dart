import 'package:flutter/material.dart';

void main() => runApp(const InputControlsApp());

class InputControlsApp extends StatelessWidget {
  const InputControlsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xfffcf9ff),
          colorSchemeSeed: const Color(0xff596aa5),
        ),
        home: const InputControlsDemo(),
      );
}

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});
  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _rating = 50;
  bool _isMovieActive = false;
  String? _genre;
  DateTime? _selectedDate;

  String get _selectedGenreLabel => _genre ?? 'None';

  Future<void> _openDatePicker() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: _selectedDate ?? DateTime.now(),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Exercise 2 – Input Controls'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Rating (Slider)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Slider(
              value: _rating,
              max: 100,
              onChanged: (value) => setState(() => _rating = value),
            ),
            Text('Current value: ${_rating.round()}'),
            const SizedBox(height: 24),
            const Text('Active (Switch)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Is movie active?'),
              value: _isMovieActive,
              onChanged: (value) => setState(() => _isMovieActive = value),
            ),
            const SizedBox(height: 16),
            const Text('Genre (RadioListTile)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _genre,
              onChanged: (value) => setState(() => _genre = value),
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _genre,
              onChanged: (value) => setState(() => _genre = value),
            ),
            Text('Selected genre: $_selectedGenreLabel'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _openDatePicker,
                child: const Text('Open Date Picker'),
              ),
            ),
            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                    'Selected date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              ),
          ]),
        ),
      );
}
