import 'package:dartapp/core/error/failures.dart';
import 'package:dartapp/core/usecases/usecase.dart';
import 'package:dartapp/features/main/domain/entities/screen_data.dart';
import 'package:dartapp/features/main/domain/repositories/screen_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetScreenDataUsecase extends UseCase<ScreenData, Params> {
  final ScreenDataRepository repository;

  GetScreenDataUsecase(this.repository);

  @override
  Future<Either<Failure, ScreenData>> call(Params params) async {
    return await repository.getScreenData(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}
