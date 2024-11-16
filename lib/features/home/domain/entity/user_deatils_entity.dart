class UserDetailEntity {
  final List<ParticipantEntity>? participants;

  UserDetailEntity({
    this.participants,
  });
}

class ParticipantEntity {
  final String? participantId;
  final String? fullName;
  final int? age;
  bool? isExpanded;
  final List<AuditionEntity>? auditions;

  ParticipantEntity(
      {this.participantId,
      this.fullName,
      this.age,
      this.auditions,
      this.isExpanded = false});
}

class AuditionEntity {
  final String? auditionId;
  final String? auditionName;
  final int? auditionAge;
  bool? isExpanded;
  final List<SubAuditionEntity>? subAuditions;

  AuditionEntity(
      {this.auditionId,
      this.auditionName,
      this.auditionAge,
      this.subAuditions,
      this.isExpanded = false});
}

class SubAuditionEntity {
  final String? subAuditionId;
  final String? subAuditionName;
  final int? subAuditionAge;
  bool? isExpanded;
  final List<SubSubAuditionEntity>? subSubAuditions;

  SubAuditionEntity(
      {this.subAuditionId,
      this.subAuditionName,
      this.subAuditionAge,
      this.subSubAuditions,
      this.isExpanded = false});
}

class SubSubAuditionEntity {
  final String? subSubAuditionId;
  final String? subSubAuditionName;
  final int? subSubAuditionAge;
  bool? isExpanded;

  SubSubAuditionEntity(
      {this.subSubAuditionId,
      this.subSubAuditionName,
      this.subSubAuditionAge,
      this.isExpanded = false});
}
