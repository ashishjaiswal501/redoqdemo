import 'package:hive_flutter/hive_flutter.dart';
import 'package:redoqdemo/features/home/data/data_sources/local/user_detail_data_source.dart';
import 'package:redoqdemo/features/home/data/dto/user_detail_dto.dart';
import 'package:redoqdemo/injection_container.dart';

class HiveConfig {
  static Future<void> initHive() async {
    // Initialize Hive
    await Hive.initFlutter();
    // Register Adapters
    Hive.registerAdapter(UserDetailDtoAdapter());
    Hive.registerAdapter(ParticipantDtoAdapter());
    Hive.registerAdapter(AuditionDtoAdapter());
    Hive.registerAdapter(SubAuditionDtoAdapter());
    Hive.registerAdapter(SubSubAuditionDtoAdapter());
    await saveintohive();
  }

  static Future<void> saveintohive() async {
    const String jsonString = '''{
  "participants": [
    {
      "participantId": "5d1cc79e-799f-41f0-b890-6ef0a6c5e35d",
      "fullName": "Richard E. Meyer",
      "age": 28,
      "isExpanded":false,
      "auditions": [
        {
          "auditionId": "8993e81f-ab6f-4845-97c8-afb7662ad32b",
          "auditionName": "Audition 1",
          "auditionAge": 28,
           "isExpanded":false,
          "subAuditions": [
            {
              "subAuditionId": "a0de9118-1dfe-47c9-ac70-b13d4a681a67",
              "subAuditionName": "Sub Audition 1",
              "subAuditionAge": 27,
               "isExpanded":false,
              "subSubAuditions": [
                {
                  "subSubAuditionId": "1918de8f-dd78-4f2d-b90c-89f2c7a8a706",
                  "subSubAuditionName": "Sub Sub Audition 1",
                  "subSubAuditionAge": 26,
                   "isExpanded":false
                },
                {
                  "subSubAuditionId": "589191ba-2701-4e62-aaef-7bd9cc3b763a",
                  "subSubAuditionName": "Sub Sub Audition 2",
                  "subSubAuditionAge": 25,
                   "isExpanded":false
                }
              ]
            }
          ]
        },
        {
          "auditionId": "8993e81f-ab6f-4845-97c8-afb7662ad32b8278727",
          "auditionName": "Audition 2",
          "auditionAge": 28,
           "isExpanded":false,
          "subAuditions": [
            {
              "subAuditionId": "a0de9118-1dfe-47c9-ac70-b13d4a681a67233",
              "subAuditionName": "Sub Audition 1",
              "subAuditionAge": 27,
               "isExpanded":false,
              "subSubAuditions": [
                {
                  "subSubAuditionId": "1918de8f-dd78-4f2d-b90c-89f2c7a8a70623",
                  "subSubAuditionName": "Sub Sub Audition 1",
                  "subSubAuditionAge": 26,
                   "isExpanded":false
                },
                {
                  "subSubAuditionId": "589191ba-2701-4e62-aaef-7bd9cc3b763a23",
                  "subSubAuditionName": "Sub Sub Audition 2",
                  "subSubAuditionAge": 25,
                   "isExpanded":false
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}''';
    getIt<UserDetailLocalDataSource>().saveUserDetails(jsonString);
  }
}
