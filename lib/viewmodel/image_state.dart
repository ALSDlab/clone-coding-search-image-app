import 'package:clone_coding_image_search_app/model/image_model.dart';

class ImageState {
  List<ImageModel> imageItems;
  bool isLoading;

//<editor-fold desc="Data Methods">
  ImageState({
    required this.imageItems,
    required this.isLoading,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageState &&
          runtimeType == other.runtimeType &&
          imageItems == other.imageItems &&
          isLoading == other.isLoading);

  @override
  int get hashCode => imageItems.hashCode ^ isLoading.hashCode;

  @override
  String toString() {
    return 'ImageState{ imageItems: $imageItems, isLoading: $isLoading,}';
  }

  ImageState copyWith({
    List<ImageModel>? imageItems,
    bool? isLoading,
  }) {
    return ImageState(
      imageItems: imageItems ?? this.imageItems,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageItems': imageItems,
      'isLoading': isLoading,
    };
  }

  factory ImageState.fromMap(Map<String, dynamic> map) {
    return ImageState(
      imageItems: map['imageItems'] as List<ImageModel>,
      isLoading: map['isLoading'] as bool,
    );
  }

//</editor-fold>
}
