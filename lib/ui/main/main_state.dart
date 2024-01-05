import 'package:clone_coding_image_search_app/domain/model/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState<T> with _$MainState<T> {
  factory MainState({
    @Default(false) bool isLoading,
    @Default([]) List<ImageModel> imageItem,
}) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}