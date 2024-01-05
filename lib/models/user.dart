
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  int? korisnikId;
  String? firstName;
  String? lastName;
  String? korisnickoIme;

  User(this.korisnikId, this.firstName, this.lastName, this.korisnickoIme);

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}

