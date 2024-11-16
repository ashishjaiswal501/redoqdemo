import 'package:redoqdemo/core/resources/data_state.dart';
import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';

abstract class UserDetailRepository {
  Future<DataState<UserDetailEntity>> getAllUsers();
 // Future<DataState<void>> updateUser(String key, UserDetailEntity user);
}