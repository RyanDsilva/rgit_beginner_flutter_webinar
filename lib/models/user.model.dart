// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class User {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  User({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  User copyWith({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      email: map['email'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, first_name: $first_name, last_name: $last_name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        avatar.hashCode;
  }
}
