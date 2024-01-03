class ImageModel {
  String imageURL;
  String tags;

//<editor-fold desc="Data Methods">
  ImageModel({
    required this.imageURL,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          imageURL == other.imageURL &&
          tags == other.tags);

  @override
  int get hashCode => imageURL.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageModel{ imageURL: $imageURL, tags: $tags,}';
  }

  ImageModel copyWith({
    String? imageURL,
    String? tags,
  }) {
    return ImageModel(
      imageURL: imageURL ?? this.imageURL,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageURL': imageURL,
      'tags': tags,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageURL: map['imageURL'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}