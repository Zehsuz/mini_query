class AuthModel {
  final DateTime created;
  final String id;
  final String name;

  AuthModel({required this.created, required this.id, required this.name});

  AuthModel.fromJSON(Map<String, dynamic> json) : this(
      created : json['created'],
      id : json['id'],
      name : json['name']
  );
}
