import 'package:get_it/get_it.dart';
import 'package:redoqdemo/features/home/data/data_sources/local/user_detail_data_source.dart';
import 'package:redoqdemo/features/home/data/repository/user_detail_repository_impl.dart';
import 'package:redoqdemo/features/home/domain/repository/user_detail_repository.dart';
import 'package:redoqdemo/features/home/domain/usecases/get_userDetail_usecase.dart';
import 'package:redoqdemo/features/home/presentation/bloc/user_detail_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependecies() async {
  // Register data source
  // getIt.registerSingleton(() => UserDetailLocalDataSource());
  getIt.registerFactory<UserDetailLocalDataSource>(
    () => UserDetailLocalDataSource(),
  );
  // Register repository implementation

  getIt.registerSingleton<UserDetailRepository>(
      UserDetailRepositoryImpl(getIt<UserDetailLocalDataSource>()));

  // Register use cases
  getIt.registerSingleton<GetUserdetailUsecase>(
      GetUserdetailUsecase(getIt<UserDetailRepository>()));

// Register bloc

  getIt.registerFactory<UserDetailBloc>(
    () => UserDetailBloc(getUserdetailUsecase: getIt()),
  );
}
