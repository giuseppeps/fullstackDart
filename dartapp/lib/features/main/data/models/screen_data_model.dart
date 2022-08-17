import 'package:dartapp/features/main/domain/entities/screen_data.dart';

class ScreenDataModel extends ScreenData {
  const ScreenDataModel({
    required String title,
    required String text,
  }) : super(text: text, title: title);

  factory ScreenDataModel.fromJson(Map<String, dynamic> json) {
    return ScreenDataModel(
      text: json["text"] as String,
      title: json["title"] as String,
    );
  }
}
