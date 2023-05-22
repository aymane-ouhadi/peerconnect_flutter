class CreateGroupModel {
  String adminId;
  String name;
  String picture;
  String description;
  List<String> rulesDescription;

  CreateGroupModel({
    required this.adminId,
    required this.name,
    required this.picture,
    required this.description,
    required this.rulesDescription,
  });

  factory CreateGroupModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> rulesDescriptionJson = json['rulesDescription'] ?? [];
    List<String> rulesDescription = rulesDescriptionJson.cast<String>().toList();

    return CreateGroupModel(
      adminId: json['adminId'],
      name: json['name'],
      picture: json['picture'],
      description: json['description'],
      rulesDescription: rulesDescription,
    );
  }

  Map<String, dynamic> toJson() => {
        'adminId': adminId,
        'name': name,
        'description': description,
        'picture': picture,
        'rulesDescription': rulesDescription,
      };

  static CreateGroupModel empty() {
    return CreateGroupModel(
      adminId: '',
      name: '',
      description: '',
      picture: '',
      rulesDescription: [],
    );
  }

  @override
  String toString() {
    return "CreateGroupModel: ${name}, admin: $adminId";
  }
}
