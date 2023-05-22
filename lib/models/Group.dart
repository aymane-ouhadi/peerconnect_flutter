class Group {
  String id;
  String createdAt;
  String name;
  String description;
  String groupPicture;
  List<String> rules;

  Group({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.description,
    required this.groupPicture,
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
      groupPicture: json['picture'],
      rules: rules,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'description': description,
        'picture': groupPicture,
        'rules': rules,
      };

  static Group empty() {
    return Group(
      id: '',
      createdAt: '',
      name: '',
      description: '',
      groupPicture: '',
      rules: [],
    );
  }

  @override
  String toString() {
    return "Group: ${name}";
  }
}
