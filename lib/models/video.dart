class VideoModel {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.channelTitle,
  });

  factory VideoModel.fromMap(Map<String, dynamic> snippet) {
    return VideoModel(
      id: snippet['resourceId']['VideoModelId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
