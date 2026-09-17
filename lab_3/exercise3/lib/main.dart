import 'dart:async';

void main() {
  print('========== EXERCISE 3 ==========');

  print('1. Start');

  // Microtask runs before event callbacks
  scheduleMicrotask(() {
    print('3. Microtask');
  });

  // Future adds a callback to the event queue
  Future(() {
    print('4. Future event');
  });

  print('2. End');
}