import 'package:untitled/reels/models/reel_comment_model.dart';

class ReelModel {
  final String? id;
  final String url;
  final bool isLiked;
  final bool isFollow;
  final int likeCount;
  final String userName;
  final String? profileUrl;
  final String? reelDescription;
  final String? musicName;
  final List<ReelCommentModel>? commentList;

  ReelModel(
    this.url,
    this.userName, {
    this.id,
    this.isLiked = false,
    this.likeCount = 0,
    this.profileUrl,
    this.reelDescription,
    this.musicName,
    this.commentList,
    required this.isFollow,
  });

  ReelModel copyWith({
    String? id,
    String? url,
    bool? isLiked,
    bool? isFollow,
    int? likeCount,
    String? userName,
    String? profileUrl,
    String? reelDescription,
    String? musicName,
    List<ReelCommentModel>? commentList,
  }) {
    return ReelModel(
      url ?? this.url,
      userName ?? this.userName,
      id: id ?? this.id,
      isFollow: isFollow ?? this.isFollow,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
      profileUrl: profileUrl ?? this.profileUrl,
      reelDescription: reelDescription ?? this.reelDescription,
      musicName: musicName ?? this.musicName,
      commentList: commentList ?? this.commentList,
    );
  }
}
