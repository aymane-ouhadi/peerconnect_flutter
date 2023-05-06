class Group {
  final String id;
  final String createdAt;
  final String name;
  final String description;
  final List<String> rules;

  Group({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.rules,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    List<dynamic> rulesJson = json['rules'] ?? [];
    List<String> rules = rulesJson.cast<String>().toList();

    return Group(
      id: json['id'],
      createdAt: json['_createdAt'],
      name: json['name'],
      description: json['description'],
      rules: rules,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'description': description,
        'rules': rules,
      };

  static Group empty() {
    return Group(
      id: '',
      createdAt: '',
      name: '',
      description: '',
      rules: [],
    );
  }

  @override
  String toString() {
    return "Group: ${name}";
  }
}
