import 'package:hive/hive.dart';
import 'package:redoqdemo/core/resources/data_state.dart';
import 'package:redoqdemo/features/home/data/dto/user_detail_dto.dart';

class UserDetailLocalDataSource {
  // Open the Hive box
  Future<Box<UserDetailDto>> _openBox() async {
    return await Hive.openBox<UserDetailDto>('userDetailBox');
  }

  // Save user details to Hive (using the provided method)
  Future<DataState<void>> saveUserDetails(String jsonString) async {
    try {
      final userDetailDto =
          userDetailDtoFromJson(jsonString); // Deserialize JSON to DTO

      // Open the Hive box
      var box = await _openBox();

      // Save the data to the box
      await box.put('userDetails', userDetailDto); // You can use any key here

      print('Data saved successfully');
      return const DataSuccess(null); // Return success
    } catch (e) {
      print('Error saving data to Hive: $e');
      return DataFailed(
          'Error saving data to Hive: $e'); // Return failure with error message
    }
  }

  // Fetch all user details from Hive
  Future<DataState<UserDetailDto>> fetchAllUsers() async {
    try {
      var box = await _openBox();
      final userDetailDto = box.get('userDetails'); // Get the data by the key

      if (userDetailDto != null) {
        return DataSuccess(userDetailDto); // Return the user data
      } else {
        return const DataFailed(
            'No data found'); // Return failure if no data found
      }
    } catch (e) {
      print('Failed to fetch data from Hive: $e');
      return DataFailed('Failed to fetch data from Hive: $e');
    }
  }

// Update based on a single ID level (participant, audition, subAudition, or subSubAudition)
  Future<void> updateById({
    required String
        id, // Single ID passed: participantId, auditionId, subAuditionId, or subSubAuditionId
    required UpdateType
        type, // The type of ID to update (participant, audition, subAudition, subSubAudition)
    String? fullName,
    int? age,
  }) async {
    final box = await _openBox();

    final userDetail = box.get('userDetails'); // Get the data by the key

    if (userDetail != null && userDetail.participants != null) {
      // Update participant based on participantId
      if (type == UpdateType.participant) {
        ParticipantDto participant = userDetail.participants!.firstWhere(
          (p) => p.participantId == id,
          orElse: () => ParticipantDto(),
        );

        if (participant.participantId != null) {
          participant.fullName = fullName;
          participant.age = age;
        }
      }

      // Update audition based on auditionId
      if (type == UpdateType.audition) {
        for (var participant in userDetail.participants!) {
          var audition = participant.auditions?.firstWhere(
            (a) => a.auditionId == id,
            orElse: () => AuditionDto(),
          );

          if (audition != null) {
            audition.auditionName = fullName;
            audition.auditionAge = age;
          }
        }
      }

      // Update subAudition based on subAuditionId
      if (type == UpdateType.subAudition) {
        for (var participant in userDetail.participants!) {
          for (AuditionDto audition in participant.auditions ?? []) {
            var subAudition = audition.subAuditions?.firstWhere(
              (s) => s.subAuditionId == id,
              orElse: () => SubAuditionDto(),
            );

            if (subAudition!.subAuditionId != null) {
              subAudition.subAuditionName = fullName;

              subAudition.subAuditionAge = age;
            }
          }
        }
      }

      // Update subSubAudition based on subSubAuditionId
      if (type == UpdateType.subSubAudition) {
        for (var participant in userDetail.participants!) {
          for (AuditionDto audition in participant.auditions ?? []) {
            for (SubAuditionDto subAudition in audition.subAuditions ?? []) {
              var subSubAudition = subAudition.subSubAuditions?.firstWhere(
                (ss) => ss.subSubAuditionId == id,
                orElse: () => SubSubAuditionDto(),
              );

              if (subSubAudition != null) {
                subSubAudition.subSubAuditionName = fullName;

                subSubAudition.subSubAuditionAge = age;
              }
            }
          }
        }
      }

      // Save the updated data back to Hive box
      await box.put('userDetails', userDetail);
    }
  }
}

enum UpdateType { participant, audition, subAudition, subSubAudition }
