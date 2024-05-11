import 'package:flutter/material.dart';
import 'package:untitled/reels/components/reels_view.dart';
import 'package:untitled/reels/models/reel_comment_model.dart';
import 'package:untitled/reels/models/reel_model.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List<ReelModel> reelsList = [
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/f8e3c0813ed1cb0e78dee3a611f10d82/manifest/video.m3u8',
        'Darshan Patil',
        likeCount: 2000,
        isLiked: true,
        musicName: 'In the name of Love',
        reelDescription: "Life is better when you're laughing.",
        profileUrl:
            'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
        commentList: [
          ReelCommentModel(
            comment: 'Nice...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Raj',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Superr...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Jenish',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Great...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Parth',
            commentTime: DateTime.now(),
          ),
        ]),
    ReelModel(
      isFollow: false,
      'https://cloudflarestream.com/f8e3c0813ed1cb0e78dee3a611f10d82/manifest/video.m3u8?clientBandwidthHint=2.5',
      'Pavan',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://cloudflarestream.com/79281f248de759b1307671af44289504/manifest/video.m3u8?clientBandwidthHint=2.5',
      'Dhaval',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
      'Raju',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://cloudflarestream.com/2b7841da5b33f99d187887a7c5daa576/manifest/video.m3u8?clientBandwidthHint=2.5',
      'Piyush',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
      'Rajen',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
      'virat',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      isFollow: false,
      'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
      'Nayan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                reelsList.length,
                (index) => ReelsView(
                  item: reelsList[index],
                  onShare: (url) {},
                  onLike: (url) {},
                  onFollow: () {},
                  onComment: (comment) {},
                  onClickMoreBtn: () {},
                  showVerifiedTick: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
