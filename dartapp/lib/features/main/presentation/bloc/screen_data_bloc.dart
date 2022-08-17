import 'package:bloc/bloc.dart';
import 'package:dartapp/core/error/failures.dart';
import 'package:dartapp/features/main/domain/entities/screen_data.dart';
import 'package:dartapp/features/main/domain/repositories/screen_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'screen_data_event.dart';
part 'screen_data_state.dart';

class ScreenDataBloc extends Bloc<ScreenDataEvent, ScreenDataState> {
  final ScreenDataRepository repository;

  ScreenDataBloc(this.repository) : super(EmptyScreenDataState()) {
    on<GetScreenDataEvent>((event, emit) async {
      emit(LoadingScreenDataState());

      final Either<Failure, ScreenData> either =
          await repository.getScreenData(event.number);

      either.fold(
        (l) => emit(ErrorScreenDataState(message: l.msg)),
        (r) => emit(
          LoadedScreenDataState(data: r),
        ),
      );
    });
  }
}
