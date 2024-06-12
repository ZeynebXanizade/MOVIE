class User {
  String name;
  String surname;
  String age;
  String gender;
  User({
    required this.name,
    required this.surname,
    required this.age,
    required this.gender,
  });

  User copyWith({
    String? name,
    String? surname,
    String? age,
    String? gender,
  }) {
    return User(
        name: name ?? this.name,
        surname: surname ?? this.surname,
        age: age ?? this.age,
        gender: gender ?? this.gender);
  }
}
