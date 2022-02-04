class Users {
  final String? email;
  final String? uuid;
  bool? isAdmin;
  final String? username;
  final String? phone;
  Users({this.email, this.isAdmin, this.phone, this.username, this.uuid});

  Users.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        uuid = json['uuid'],
        isAdmin = json['isAdmin'],
        username = json['username'],
        phone = json['phone'];

  Map<String, dynamic> toJson() =>
      {'email': email, 'uuid': uuid, 'isAdmin': isAdmin, 'username': username, 'phone': phone};
}
