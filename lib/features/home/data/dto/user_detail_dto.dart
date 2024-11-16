import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_detail_dto.g.dart';

UserDetailDto userDetailDtoFromJson(String str) =>
    UserDetailDto.fromJson(json.decode(str));

String userDetailDtoToJson(UserDetailDto data) => json.encode(data.toJson());

@HiveType(typeId: 1)
@JsonSerializable()
class UserDetailDto {
  @HiveField(1)
  @JsonKey(name: "participants")
  final List<ParticipantDto>? participants;

  UserDetailDto({
    this.participants,
  });

  factory UserDetailDto.fromJson(Map<String, dynamic> json) =>
      _$UserDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailDtoToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class ParticipantDto {
  @HiveField(1)
  @JsonKey(name: "participantId")
  final String? participantId;
  @HiveField(3)
  @JsonKey(name: "fullName")
   String? fullName;
  @HiveField(5)
  @JsonKey(name: "age")
   int? age;
  @HiveField(7)
  @JsonKey(name: "auditions")
  final List<AuditionDto>? auditions;
  @HiveField(8)
  @JsonKey(name: "isExpanded")
  final bool? isExpanded;

  ParticipantDto(
      {this.participantId,
      this.fullName,
      this.age,
      this.auditions,
      this.isExpanded});

  factory ParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantDtoToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class AuditionDto {
  @HiveField(1)
  @JsonKey(name: "auditionId")
  final String? auditionId;
  @HiveField(3)
  @JsonKey(name: "auditionName")
   String? auditionName;
  @HiveField(5)
  @JsonKey(name: "auditionAge")
   int? auditionAge;
  @HiveField(7)
  @JsonKey(name: "subAuditions")
  final List<SubAuditionDto>? subAuditions;
  @HiveField(8)
  @JsonKey(name: "isExpanded")
  final bool? isExpanded;

  AuditionDto(
      {this.auditionId,
      this.auditionName,
      this.auditionAge,
      this.subAuditions,
      this.isExpanded});

  factory AuditionDto.fromJson(Map<String, dynamic> json) =>
      _$AuditionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuditionDtoToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class SubAuditionDto {
  @HiveField(1)
  @JsonKey(name: "subAuditionId")
  final String? subAuditionId;
  @HiveField(3)
  @JsonKey(name: "subAuditionName")
   String? subAuditionName;
  @HiveField(5)
  @JsonKey(name: "subAuditionAge")
   int? subAuditionAge;
  @HiveField(7)
  @JsonKey(name: "subSubAuditions")
  final List<SubSubAuditionDto>? subSubAuditions;
  @HiveField(8)
  @JsonKey(name: "isExpanded")
  final bool? isExpanded;

  SubAuditionDto(
      {this.subAuditionId,
      this.subAuditionName,
      this.subAuditionAge,
      this.subSubAuditions,
      this.isExpanded});

  factory SubAuditionDto.fromJson(Map<String, dynamic> json) =>
      _$SubAuditionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubAuditionDtoToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable()
class SubSubAuditionDto {
  @HiveField(1)
  @JsonKey(name: "subSubAuditionId")
  final String? subSubAuditionId;
  @HiveField(3)
  @JsonKey(name: "subSubAuditionName")
   String? subSubAuditionName;
  @HiveField(5)
  @JsonKey(name: "subSubAuditionAge")
   int? subSubAuditionAge;
  @HiveField(6)
  @JsonKey(name: "isExpanded")
  final bool? isExpanded;

  SubSubAuditionDto(
      {this.subSubAuditionId,
      this.subSubAuditionName,
      this.subSubAuditionAge,
      this.isExpanded});

  factory SubSubAuditionDto.fromJson(Map<String, dynamic> json) =>
      _$SubSubAuditionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubSubAuditionDtoToJson(this);
}
