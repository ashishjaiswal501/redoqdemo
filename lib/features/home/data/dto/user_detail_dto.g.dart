// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailDtoAdapter extends TypeAdapter<UserDetailDto> {
  @override
  final int typeId = 1;

  @override
  UserDetailDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailDto(
      participants: (fields[1] as List?)?.cast<ParticipantDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailDto obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.participants);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParticipantDtoAdapter extends TypeAdapter<ParticipantDto> {
  @override
  final int typeId = 2;

  @override
  ParticipantDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParticipantDto(
      participantId: fields[1] as String?,
      fullName: fields[3] as String?,
      age: fields[5] as int?,
      auditions: (fields[7] as List?)?.cast<AuditionDto>(),
      isExpanded: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ParticipantDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.participantId)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(7)
      ..write(obj.auditions)
      ..writeByte(8)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParticipantDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuditionDtoAdapter extends TypeAdapter<AuditionDto> {
  @override
  final int typeId = 3;

  @override
  AuditionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuditionDto(
      auditionId: fields[1] as String?,
      auditionName: fields[3] as String?,
      auditionAge: fields[5] as int?,
      subAuditions: (fields[7] as List?)?.cast<SubAuditionDto>(),
      isExpanded: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AuditionDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.auditionId)
      ..writeByte(3)
      ..write(obj.auditionName)
      ..writeByte(5)
      ..write(obj.auditionAge)
      ..writeByte(7)
      ..write(obj.subAuditions)
      ..writeByte(8)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuditionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubAuditionDtoAdapter extends TypeAdapter<SubAuditionDto> {
  @override
  final int typeId = 4;

  @override
  SubAuditionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubAuditionDto(
      subAuditionId: fields[1] as String?,
      subAuditionName: fields[3] as String?,
      subAuditionAge: fields[5] as int?,
      subSubAuditions: (fields[7] as List?)?.cast<SubSubAuditionDto>(),
      isExpanded: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SubAuditionDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.subAuditionId)
      ..writeByte(3)
      ..write(obj.subAuditionName)
      ..writeByte(5)
      ..write(obj.subAuditionAge)
      ..writeByte(7)
      ..write(obj.subSubAuditions)
      ..writeByte(8)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubAuditionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubSubAuditionDtoAdapter extends TypeAdapter<SubSubAuditionDto> {
  @override
  final int typeId = 5;

  @override
  SubSubAuditionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubSubAuditionDto(
      subSubAuditionId: fields[1] as String?,
      subSubAuditionName: fields[3] as String?,
      subSubAuditionAge: fields[5] as int?,
      isExpanded: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SubSubAuditionDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.subSubAuditionId)
      ..writeByte(3)
      ..write(obj.subSubAuditionName)
      ..writeByte(5)
      ..write(obj.subSubAuditionAge)
      ..writeByte(6)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubSubAuditionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailDto _$UserDetailDtoFromJson(Map<String, dynamic> json) =>
    UserDetailDto(
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ParticipantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDetailDtoToJson(UserDetailDto instance) =>
    <String, dynamic>{
      'participants': instance.participants,
    };

ParticipantDto _$ParticipantDtoFromJson(Map<String, dynamic> json) =>
    ParticipantDto(
      participantId: json['participantId'] as String?,
      fullName: json['fullName'] as String?,
      age: (json['age'] as num?)?.toInt(),
      auditions: (json['auditions'] as List<dynamic>?)
          ?.map((e) => AuditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool?,
    );

Map<String, dynamic> _$ParticipantDtoToJson(ParticipantDto instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'fullName': instance.fullName,
      'age': instance.age,
      'auditions': instance.auditions,
      'isExpanded': instance.isExpanded,
    };

AuditionDto _$AuditionDtoFromJson(Map<String, dynamic> json) => AuditionDto(
      auditionId: json['auditionId'] as String?,
      auditionName: json['auditionName'] as String?,
      auditionAge: (json['auditionAge'] as num?)?.toInt(),
      subAuditions: (json['subAuditions'] as List<dynamic>?)
          ?.map((e) => SubAuditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool?,
    );

Map<String, dynamic> _$AuditionDtoToJson(AuditionDto instance) =>
    <String, dynamic>{
      'auditionId': instance.auditionId,
      'auditionName': instance.auditionName,
      'auditionAge': instance.auditionAge,
      'subAuditions': instance.subAuditions,
      'isExpanded': instance.isExpanded,
    };

SubAuditionDto _$SubAuditionDtoFromJson(Map<String, dynamic> json) =>
    SubAuditionDto(
      subAuditionId: json['subAuditionId'] as String?,
      subAuditionName: json['subAuditionName'] as String?,
      subAuditionAge: (json['subAuditionAge'] as num?)?.toInt(),
      subSubAuditions: (json['subSubAuditions'] as List<dynamic>?)
          ?.map((e) => SubSubAuditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isExpanded: json['isExpanded'] as bool?,
    );

Map<String, dynamic> _$SubAuditionDtoToJson(SubAuditionDto instance) =>
    <String, dynamic>{
      'subAuditionId': instance.subAuditionId,
      'subAuditionName': instance.subAuditionName,
      'subAuditionAge': instance.subAuditionAge,
      'subSubAuditions': instance.subSubAuditions,
      'isExpanded': instance.isExpanded,
    };

SubSubAuditionDto _$SubSubAuditionDtoFromJson(Map<String, dynamic> json) =>
    SubSubAuditionDto(
      subSubAuditionId: json['subSubAuditionId'] as String?,
      subSubAuditionName: json['subSubAuditionName'] as String?,
      subSubAuditionAge: (json['subSubAuditionAge'] as num?)?.toInt(),
      isExpanded: json['isExpanded'] as bool?,
    );

Map<String, dynamic> _$SubSubAuditionDtoToJson(SubSubAuditionDto instance) =>
    <String, dynamic>{
      'subSubAuditionId': instance.subSubAuditionId,
      'subSubAuditionName': instance.subSubAuditionName,
      'subSubAuditionAge': instance.subSubAuditionAge,
      'isExpanded': instance.isExpanded,
    };
