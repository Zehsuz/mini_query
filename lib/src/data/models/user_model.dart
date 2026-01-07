class UserModel {
  final DateTime created;
  final String id;
  final String name;

  UserModel({required this.created, required this.id, required this.name});

  UserModel.fromJSON(Map<String, dynamic> json) : this(
      created : json['created'],
      id : json['id'],
      name : json['name']
  );
}
