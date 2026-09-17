import 'dart:convert';

void main() async {
  print('========== EXERCISE 2 ==========');

  // Fetch and parse users from simulated API
  final users = await UserRepository().getUsers();

  // Display parsed users
  for (final user in users) {
    print('Name: ${user.name}');
    print('Email: ${user.email}');
  }
}

class User {
  final String name;
  final String email;

  User({
    required this.name,
    required this.email,
  });

  // Convert JSON object into User object
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];
}

class UserRepository {
  Future<List<User>> getUsers() async {
    // Simulate JSON response from an API
    const jsonData = '''
    [
      {"name": "The Anh", "email": "theanh@gmail.com"},
      {"name": "Nguyen Van A", "email": "vana@gmail.com"},
      {"name": "Tran Thi B", "email": "thib@gmail.com"}
    ]
    ''';

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Convert JSON string into Dart objects
    final List<dynamic> data = jsonDecode(jsonData);

    // Convert each JSON object into User
    return data
        .map((json) => User.fromJson(json))
        .toList();
  }
}