import 'package:dartapp/core/error/exception.dart';
import 'package:dartapp/core/error/failures.dart';
import 'package:dartapp/features/main/data/datasource/screen_data_datasource.dart';
import 'package:dartapp/features/main/domain/entities/screen_data.dart';
import 'package:dartapp/features/main/domain/repositories/screen_data_repository.dart';
import 'package:dartz/dartz.dart';

class ScreenDataRepositoryImpl implements ScreenDataRepository {
  final ScreenDataDatasource datasource;

  ScreenDataRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, ScreenData>> getScreenData(int number) async {
    try {
      final remoteTrivia = await datasource.getScreenData(number);

      return Right(remoteTrivia);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
