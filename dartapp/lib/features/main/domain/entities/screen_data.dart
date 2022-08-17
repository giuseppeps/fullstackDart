import 'package:equatable/equatable.dart';

class ScreenData extends Equatable {
  final String title;
  final String text;

  const ScreenData({required this.title, required this.text});

  @override
  List<Object?> get props => throw UnimplementedError();
}
