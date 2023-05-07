// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetails {
  String id;
  String name;
  String username;
  String email;
  String phone;
  String companyName;
  String website;
  String address;

  UserDetails(
      {required this.id,
      required this.name,
      required this.phone,
      required this.companyName,
      required this.address,
      required this.email,
      required this.username,
      required this.website});

  factory UserDetails.fromJson(Map<String, dynamic> jsonResponse) {
    return UserDetails(
      id: "${jsonResponse["id"]}",
      name: "${jsonResponse["name"]}",
      phone: "${jsonResponse["phone"]}",
      companyName: "${jsonResponse["company"]["name"]}",
      address:
          "${jsonResponse["address"]["street"]},${jsonResponse["address"]["city"]},zipcode - ${jsonResponse["address"]["zipcode"]}",
      email: "${jsonResponse["email"]}",
      website: "${jsonResponse["website"]}",
      username: "${jsonResponse["username"]}",
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'companyName': companyName,
      'website': website,
      'address': address,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      companyName: map['companyName'] as String,
      website: map['website'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson1(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}
