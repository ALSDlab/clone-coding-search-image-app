import 'dart:ui';

import 'package:clone_coding_image_search_app/data/model/image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_state.freezed.dart';

part 'image_state.g.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState({
    @Default([]) List<ImageModel> imageItems,
    @Default(false) bool isLoading,
  }) = _ImageState;

  factory ImageState.fromJson(Map<String, Object?> json) => _$ImageStateFromJson(json);
}
