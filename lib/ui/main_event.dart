import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';
part 'main_event.g.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.showSnackBar(String message) = ShowSnackBar;

  const factory MainEvent.showDialog(String message) = ShowDialog;

  factory MainEvent.fromJson(Map<String, Object?> json) =>
      _$MainEventFromJson(json);
}
