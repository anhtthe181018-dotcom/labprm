void main() {
  print('========== EXERCISE 5 ==========');
  print('Factory Constructors & Cache');
  print('');

  // Create two Settings objects
  final a = Settings();
  final b = Settings();

  print('[Factory] Created instance a');
  print('[Factory] Created instance b');

  // Check whether both variables refer to the same object
  print('');
  print('a == b: ${a == b}');
  print('identical(a, b): ${identical(a, b)}');

  // Change the setting through object a
  a.theme = 'Dark';

  print('');
  print('Set a.theme = Dark');
  print('a.theme: ${a.theme}');
  print('b.theme: ${b.theme}');

  print('');
  print('Both objects share the same cached instance.');
  print('========== EXERCISE 5 COMPLETED ==========');
}

class Settings {
  String theme = 'Light';

  // Store one shared instance in cache
  static final Settings _instance = Settings._internal();

  // Private constructor prevents direct object creation
  Settings._internal();

  // Factory returns the cached singleton instance
  factory Settings() {
    print('[Factory] Returning cached Settings instance');
    return _instance;
  }
}