part of 'screen_data_bloc.dart';

abstract class ScreenDataEvent extends Equatable {
  const ScreenDataEvent();

  @override
  List<Object> get props => [];
}

class GetScreenDataEvent extends ScreenDataEvent {
  final int number;

  const GetScreenDataEvent(this.number);
}
