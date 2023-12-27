class dataDto {
  int total;
  int totalHits;
  List<Hits> hits;

//<editor-fold desc="Data Methods">


  dataDto({
    required this.total,
    required this.totalHits,
    required this.hits,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is dataDto &&
              runtimeType == other.runtimeType &&
              total == other.total &&
              totalHits == other.totalHits &&
              hits == other.hits
          );


  @override
  int get hashCode =>
      total.hashCode ^
      totalHits.hashCode ^
      hits.hashCode;


  @override
  String toString() {
    return 'dataDto{ total: $total, totalHits: $totalHits, hits: $hits,}';
  }


  dataDto copyWith({
    int? total,
    int? totalHits,
    List<Hits>? hits,
  }) {
    return dataDto(
      total: total ?? this.total,
      totalHits: totalHits ?? this.totalHits,
      hits: hits ?? this.hits,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'totalHits': totalHits,
      'hits': hits,
    };
  }

  factory dataDto.fromJson(Map<String, dynamic> map) {
    return dataDto(
      total: map['total'] as int,
      totalHits: map['totalHits'] as int,
      hits: map['hits'] as List<Hits>,
    );
  }


//</editor-fold>
}


class Hits {
  int id;
  String pageURL;
  String type;
  String tags;
  String previewURL;
  int previewWidth;
  int previewHeight;
  String webformatURL;
  int webformatWidth;
  int webformatHeight;
  String largeImageURL;
  int imageWidth;
  int imageHeight;
  int imageSize;
  int views;
  int downloads;
  int collections;
  int likes;
  int comments;
  int user_id;
  String user;
  String userImageURL;

//<editor-fold desc="Data Methods">
  Hits({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.user,
    required this.userImageURL,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hits &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pageURL == other.pageURL &&
          type == other.type &&
          tags == other.tags &&
          previewURL == other.previewURL &&
          previewWidth == other.previewWidth &&
          previewHeight == other.previewHeight &&
          webformatURL == other.webformatURL &&
          webformatWidth == other.webformatWidth &&
          webformatHeight == other.webformatHeight &&
          largeImageURL == other.largeImageURL &&
          imageWidth == other.imageWidth &&
          imageHeight == other.imageHeight &&
          imageSize == other.imageSize &&
          views == other.views &&
          downloads == other.downloads &&
          collections == other.collections &&
          likes == other.likes &&
          comments == other.comments &&
          user_id == other.user_id &&
          user == other.user &&
          userImageURL == other.userImageURL);

  @override
  int get hashCode =>
      id.hashCode ^
      pageURL.hashCode ^
      type.hashCode ^
      tags.hashCode ^
      previewURL.hashCode ^
      previewWidth.hashCode ^
      previewHeight.hashCode ^
      webformatURL.hashCode ^
      webformatWidth.hashCode ^
      webformatHeight.hashCode ^
      largeImageURL.hashCode ^
      imageWidth.hashCode ^
      imageHeight.hashCode ^
      imageSize.hashCode ^
      views.hashCode ^
      downloads.hashCode ^
      collections.hashCode ^
      likes.hashCode ^
      comments.hashCode ^
      user_id.hashCode ^
      user.hashCode ^
      userImageURL.hashCode;

  @override
  String toString() {
    return 'Hits{ id: $id, pageURL: $pageURL, type: $type, tags: $tags, previewURL: $previewURL, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatURL: $webformatURL, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, collections: $collections, likes: $likes, comments: $comments, user_id: $user_id, user: $user, userImageURL: $userImageURL,}';
  }

  Hits copyWith({
    int? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? user_id,
    String? user,
    String? userImageURL,
  }) {
    return Hits(
      id: id ?? this.id,
      pageURL: pageURL ?? this.pageURL,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      previewURL: previewURL ?? this.previewURL,
      previewWidth: previewWidth ?? this.previewWidth,
      previewHeight: previewHeight ?? this.previewHeight,
      webformatURL: webformatURL ?? this.webformatURL,
      webformatWidth: webformatWidth ?? this.webformatWidth,
      webformatHeight: webformatHeight ?? this.webformatHeight,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      collections: collections ?? this.collections,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      user_id: user_id ?? this.user_id,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pageURL': pageURL,
      'type': type,
      'tags': tags,
      'previewURL': previewURL,
      'previewWidth': previewWidth,
      'previewHeight': previewHeight,
      'webformatURL': webformatURL,
      'webformatWidth': webformatWidth,
      'webformatHeight': webformatHeight,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'downloads': downloads,
      'collections': collections,
      'likes': likes,
      'comments': comments,
      'user_id': user_id,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  factory Hits.fromJson(Map<String, dynamic> map) {
    return Hits(
      id: map['id'] as int,
      pageURL: map['pageURL'] as String,
      type: map['type'] as String,
      tags: map['tags'] as String,
      previewURL: map['previewURL'] as String,
      previewWidth: map['previewWidth'] as int,
      previewHeight: map['previewHeight'] as int,
      webformatURL: map['webformatURL'] as String,
      webformatWidth: map['webformatWidth'] as int,
      webformatHeight: map['webformatHeight'] as int,
      largeImageURL: map['largeImageURL'] as String,
      imageWidth: map['imageWidth'] as int,
      imageHeight: map['imageHeight'] as int,
      imageSize: map['imageSize'] as int,
      views: map['views'] as int,
      downloads: map['downloads'] as int,
      collections: map['collections'] as int,
      likes: map['likes'] as int,
      comments: map['comments'] as int,
      user_id: map['user_id'] as int,
      user: map['user'] as String,
      userImageURL: map['userImageURL'] as String,
    );
  }

//</editor-fold>
}