import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoqdemo/core/resources/data_state.dart';
import 'package:redoqdemo/features/home/domain/usecases/get_userDetail_usecase.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_event.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetUserdetailUsecase getUserdetailUsecase;

  UserDetailBloc({required this.getUserdetailUsecase})
      : super(UserDetailLoadingState()) {
    on<FetchUserDetails>(_onFetchUserDetailFromHive);
  }

  void _onFetchUserDetailFromHive(
      FetchUserDetails event, Emitter<UserDetailState> emit) async {
    try {
      emit(UserDetailLoadingState());

      final dataState = await getUserdetailUsecase();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(UserDetailLoadedState(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(UserDetailErrorState(dataState.dioError!));
      }
    } catch (e) {
      emit(UserDetailLoadingState());
    }
  }
}
