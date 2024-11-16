// ParticipantDto to ParticipantEntity
import 'package:redoqdemo/features/home/data/dto/user_detail_dto.dart';
import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';

// Extension for UserDetailDto
extension UserDetailDtoMapper on UserDetailDto {
  // Convert UserDetailDto to another domain-specific model if needed
  UserDetailEntity toEntity() {
    return UserDetailEntity(
      participants: participants?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension ParticipantDtoMapper on ParticipantDto {
  ParticipantEntity toEntity() {
    return ParticipantEntity(
      participantId: participantId,
      fullName: fullName,
      age: age,
      isExpanded: isExpanded,
      auditions:
          auditions?.map((audition) => audition.toEntity()).toList() ?? [],
    );
  }
}

// ParticipantEntity to ParticipantDto
extension ParticipantEntityMapper on ParticipantEntity {
  ParticipantDto toDto() {
    return ParticipantDto(
      participantId: participantId,
      fullName: fullName,
      isExpanded: isExpanded ?? false,
      age: age,
      auditions: auditions?.map((audition) => audition.toDto()).toList() ?? [],
    );
  }
}

// AuditionDto to AuditionEntity
extension AuditionDtoMapper on AuditionDto {
  AuditionEntity toEntity() {
    return AuditionEntity(
      auditionId: auditionId,
      auditionName: auditionName,
      auditionAge: auditionAge,
      isExpanded: isExpanded ?? false,
      subAuditions:
          subAuditions?.map((subAudition) => subAudition.toEntity()).toList() ??
              [],
    );
  }
}

// AuditionEntity to AuditionDto
extension AuditionEntityMapper on AuditionEntity {
  AuditionDto toDto() {
    return AuditionDto(
      auditionId: auditionId,
      auditionName: auditionName,
      auditionAge: auditionAge,
      isExpanded: isExpanded ?? false,
      subAuditions:
          subAuditions?.map((subAudition) => subAudition.toDto()).toList() ??
              [],
    );
  }
}

// SubAuditionDto to SubAuditionEntity
extension SubAuditionDtoMapper on SubAuditionDto {
  SubAuditionEntity toEntity() {
    return SubAuditionEntity(
      subAuditionId: subAuditionId,
      subAuditionName: subAuditionName,
      subAuditionAge: subAuditionAge,
      isExpanded: isExpanded ?? false,
      subSubAuditions: subSubAuditions
              ?.map((subSubAudition) => subSubAudition.toEntity())
              .toList() ??
          [],
    );
  }
}

// SubAuditionEntity to SubAuditionDto
extension SubAuditionEntityMapper on SubAuditionEntity {
  SubAuditionDto toDto() {
    return SubAuditionDto(
      subAuditionId: subAuditionId,
      subAuditionName: subAuditionName,
      subAuditionAge: subAuditionAge,
      isExpanded: isExpanded ?? false,
      subSubAuditions: subSubAuditions
              ?.map((subSubAudition) => subSubAudition.toDto())
              .toList() ??
          [],
    );
  }
}

// SubSubAuditionDto to SubSubAuditionEntity
extension SubSubAuditionDtoMapper on SubSubAuditionDto {
  SubSubAuditionEntity toEntity() {
    return SubSubAuditionEntity(
      subSubAuditionId: subSubAuditionId,
      subSubAuditionName: subSubAuditionName,
      subSubAuditionAge: subSubAuditionAge,
      isExpanded: isExpanded ?? false,
    );
  }
}

// SubSubAuditionEntity to SubSubAuditionDto
extension SubSubAuditionEntityMapper on SubSubAuditionEntity {
  SubSubAuditionDto toDto() {
    return SubSubAuditionDto(
      subSubAuditionId: subSubAuditionId,
      subSubAuditionName: subSubAuditionName,
      subSubAuditionAge: subSubAuditionAge,
    );
  }
}
