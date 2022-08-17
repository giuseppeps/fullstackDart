import 'package:dartapp/features/main/data/datasource/screen_data_datasource.dart';
import 'package:dartapp/features/main/data/repositories/screen_data_repository_impl.dart';
import 'package:dartapp/features/main/domain/repositories/screen_data_repository.dart';
import 'package:dartapp/features/main/domain/usecases/get_screen_data_usecase.dart';
import 'package:dartapp/features/main/presentation/bloc/screen_data_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  //! Features - Number Trivia
  //Bloc
  getIt.registerFactory(() => ScreenDataBloc(getIt()));
  // Use cases
  getIt.registerLazySingleton(
    () => GetScreenDataUsecase(getIt()),
  );
  // Repository
  getIt.registerLazySingleton<ScreenDataRepository>(
    () => ScreenDataRepositoryImpl(datasource: getIt()),
  );
  // Data sources
  getIt.registerLazySingleton<ScreenDataDatasource>(
    () => ScreenDataDatasourceImpl(client: getIt()),
  );
  //! Core
  //! External
  getIt.registerLazySingleton(() => http.Client());
}
