import 'package:redoqdemo/core/resources/data_state.dart';
import 'package:redoqdemo/features/home/data/data_sources/local/user_detail_data_source.dart';
import 'package:redoqdemo/features/home/data/dto/user_detail_dto.dart';
import 'package:redoqdemo/features/home/data/mapper/mapper.dart';
import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';
import 'package:redoqdemo/features/home/domain/repository/user_detail_repository.dart';

class UserDetailRepositoryImpl implements UserDetailRepository {
  final UserDetailLocalDataSource userDetailLocalDataSource;

  UserDetailRepositoryImpl(this.userDetailLocalDataSource);

  @override
  Future<DataState<UserDetailEntity>> getAllUsers() async {
    try {
      final DataState<UserDetailDto> result =
          await userDetailLocalDataSource.fetchAllUsers();
      return DataSuccess(result.data!.toEntity());
    } catch (e) {
      return DataFailed('Failed to fetch users: $e');
    }
  }
}
