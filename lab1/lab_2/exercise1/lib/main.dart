

void main() {
  // Declare variables with different data types
  int age = 22;
  double height = 1.80;
  String name = 'The Anh';
  bool isStudent = true;

  // Print variable values
  print('========== EXERCISE 1 ==========');
  print('Name: $name');
  print('Age: $age');
  print('Height: ${height}m');
  print('Is student: $isStudent');

  // String interpolation with a variable
  print('Hello, my name is $name.');

  // String interpolation with an expression
  print('Next year age: ${age + 1}');
}