part of 'screen_data_bloc.dart';

abstract class ScreenDataState extends Equatable {
  const ScreenDataState();

  @override
  List<Object> get props => [];
}

class EmptyScreenDataState extends ScreenDataState {}

class LoadingScreenDataState extends ScreenDataState {}

class LoadedScreenDataState extends ScreenDataState {
  final ScreenData data;

  const LoadedScreenDataState({required this.data});
}

class ErrorScreenDataState extends ScreenDataState {
  final String message;

  const ErrorScreenDataState({required this.message});
}
