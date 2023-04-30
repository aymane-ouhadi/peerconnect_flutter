class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isConfirmed;
  final String college;
  final String major;
  final String password;
  final String? profilePicture;
  final String? coverPicture;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isConfirmed,
    required this.college,
    required this.major,
    required this.password,
    this.profilePicture,
    this.coverPicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      isConfirmed: json['isConfirmed'] ?? false,
      college: json['college'],
      major: json['major'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      coverPicture: json['coverPicture'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'isConfirmed': isConfirmed,
    'college': college,
    'major': major,
    'password': password,
    'profilePicture': profilePicture,
    'coverPicture': coverPicture,
  };

  factory User.empty() {
    return User(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      isConfirmed: false,
      college: '',
      major: '',
      password: '',
    );
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName';
  }
  
}
