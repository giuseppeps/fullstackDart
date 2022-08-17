import 'package:dartapp/core/error/failures.dart';
import 'package:dartapp/features/main/domain/entities/screen_data.dart';
import 'package:dartz/dartz.dart';

abstract class ScreenDataRepository {
  Future<Either<Failure, ScreenData>> getScreenData(int number);
}
