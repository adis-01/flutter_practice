import 'package:json_annotation/json_annotation.dart';

part 'story.g.dart';

@JsonSerializable()
class Story{
  int? pricaId;
  String? naslov;
  String? opis;
  int? novcaniCilj;
  bool? aktivna;

  Story(this.pricaId,this.naslov,this.opis,this.novcaniCilj,this.aktivna);

  factory Story.fromJson(Map<String,dynamic> json) => _$StoryFromJson(json);

  Map<String, dynamic> toJson() => _$StoryToJson(this);
}