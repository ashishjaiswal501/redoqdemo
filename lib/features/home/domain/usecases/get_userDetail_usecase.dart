import 'package:redoqdemo/core/resources/data_state.dart';
import 'package:redoqdemo/core/usecase/usecase.dart';
import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';
import 'package:redoqdemo/features/home/domain/repository/user_detail_repository.dart';

class GetUserdetailUsecase implements Usecase<DataState<UserDetailEntity>, void>{
  final UserDetailRepository userDetailRepository;

  GetUserdetailUsecase(this.userDetailRepository);
  
  @override
  Future<DataState<UserDetailEntity>> call({void prams}) {
      return userDetailRepository.getAllUsers(); 
  }

 
}