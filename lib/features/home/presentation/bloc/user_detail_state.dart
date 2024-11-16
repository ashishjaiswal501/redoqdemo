import 'package:redoqdemo/features/home/domain/entity/user_deatils_entity.dart';

abstract class UserDetailState {}

class UserDetailLoadingState extends UserDetailState {
  UserDetailLoadingState();
}

class UserDetailLoadedState extends UserDetailState {
  final UserDetailEntity userDetailEntity;

  UserDetailLoadedState(this.userDetailEntity);
}

class UserDetailErrorState extends UserDetailState {
  final String message;

  UserDetailErrorState(this.message);
}
