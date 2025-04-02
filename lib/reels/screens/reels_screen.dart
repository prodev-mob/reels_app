import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:untitled/reels/components/screen_options.dart';
import 'package:untitled/reels/models/reel_comment_model.dart';
import 'package:untitled/reels/models/reel_model.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List<ReelModel> reelsList = [
    ReelModel(
        isFollow: false,
        'https://videos.pexels.com/video-files/4620563/4620563-hd_1080_2048_25fps.mp4',
        'Darshan Patil',
        likeCount: 2000,
        isLiked: true,
        musicName: 'In the name of Love',
        reelDescription: "Life is better when you're laughing.",
        profileUrl: 'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
        commentList: [
          ReelCommentModel(
            comment: 'Nice...',
            userProfilePic: 'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Raj',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Superr...',
            userProfilePic: 'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Jenish',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Great...',
            userProfilePic: 'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Parth',
            commentTime: DateTime.now(),
          ),
        ]),
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/0a419f5f0eaaf63197dc54ea06e972f5/manifest/video.m3u8',
        'User 1',
        likeCount: 1500,
        isLiked: false,
        musicName: 'Song 1',
        reelDescription: "Enjoy the little things.",
        profileUrl:
            'https://plus.unsplash.com/premium_photo-1673757120943-a6d3b9a3f435?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        commentList: []),
    ReelModel(
        isFollow: true,
        'https://cloudflarestream.com/a08e67eaabc2817afad0d6338e731613/manifest/video.m3u8',
        'User 2',
        likeCount: 3000,
        isLiked: true,
        musicName: 'Song 2',
        reelDescription: "Keep smiling.",
        profileUrl:
            'https://images.unsplash.com/photo-1622236297949-eb7f7aa3a3cc?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        commentList: []),
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/fcf56766c47176d140a5dafc4c3304eb/manifest/video.m3u8',
        'User 3',
        likeCount: 2500,
        isLiked: true,
        musicName: 'Song 3',
        reelDescription: "Happiness is homemade.",
        profileUrl:
            'https://images.unsplash.com/photo-1613498382159-0972b7b4c9f1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        commentList: []),
    ReelModel(
        isFollow: true,
        'https://cloudflarestream.com/47e55dbe480cbb84dafe287cb47c995f/manifest/video.m3u8',
        'User 4',
        likeCount: 1200,
        isLiked: false,
        musicName: 'Song 4',
        reelDescription: "Just be yourself.",
        profileUrl:
            'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        commentList: []),
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/16319dccf9a66982ac437440dde7df09/manifest/video.m3u8',
        'User 5',
        likeCount: 1800,
        isLiked: true,
        musicName: 'Song 5',
        reelDescription: "Dream big.",
        profileUrl:
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
        commentList: []),
    ReelModel(
        isFollow: true,
        'https://cloudflarestream.com/119f665ea9f2694bd50a80b86e58eb4d/manifest/video.m3u8',
        'User 6',
        likeCount: 1700,
        isLiked: false,
        musicName: 'Song 6',
        reelDescription: "Stay positive.",
        profileUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D',
        commentList: []),
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/1b1c11a63e0aff63306ff95811b7d891/manifest/video.m3u8',
        'User 7',
        likeCount: 2200,
        isLiked: true,
        musicName: 'Song 7',
        reelDescription: "Be happy.",
        profileUrl:
            'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fHw%3D',
        commentList: []),
    ReelModel(
        isFollow: true,
        'https://cloudflarestream.com/bf2559e4b3e67943cd423422a579b3eb/manifest/video.m3u8',
        'User 8',
        likeCount: 2600,
        isLiked: true,
        musicName: 'Song 8',
        reelDescription: "Family time.",
        profileUrl:
            'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D',
        commentList: []),
    ReelModel(
        isFollow: false,
        'https://cloudflarestream.com/3d721f2d5e5f5489e9001edd3dba0f82/manifest/video.m3u8',
        'User 9',
        likeCount: 1400,
        isLiked: false,
        musicName: 'Song 9',
        reelDescription: "Nature love.",
        profileUrl:
            'https://images.unsplash.com/photo-1527980965255-d3b416303d12?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHx8',
        commentList: []),
  ];

  final videoPlayerController = <VideoPlayerController>[];
  bool _isPlaying = true;
  int currentIndex = 0;
  int focusedIndex = 0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < reelsList.length; i++) {
      videoPlayerController.add(VideoPlayerController.networkUrl(
        Uri.parse(reelsList[i].url),
      ));
    }
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _playNextReel(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Swiper(
          physics: videoPlayerController[currentIndex].value.isInitialized
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          loop: false,
          scrollDirection: Axis.vertical,
          itemCount: videoPlayerController.length,
          onIndexChanged: (index) {
            _isPlaying = true;
            currentIndex = index;
            final debouncer = Debouncer(milliseconds: 200);
            if (index > focusedIndex) {
              debouncer.run(() {
                _playNextReel(index);
              });
            } else {
              debouncer.run(() {
                _playPreviousReel(index);
              });
            }
            focusedIndex = index;
          },
          itemBuilder: (context, index) {
            return focusedIndex == index
                ? videoPlayerController[index].value.isInitialized
                    ? FadeIn(
                        duration: const Duration(milliseconds: 900),
                        child: GestureDetector(
                          onTap: () {
                            if (_isPlaying) {
                              _isPlaying = !_isPlaying;
                              videoPlayerController[index].pause();
                              setState(() {});
                            } else {
                              _isPlaying = !_isPlaying;
                              videoPlayerController[index].play();
                              videoPlayerController[index].setLooping(true);
                              setState(() {});
                            }
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  child: videoPlayerController[index].value.isInitialized
                                      ? AspectRatio(
                                          aspectRatio:
                                              videoPlayerController[index].value.aspectRatio,
                                          child: VideoPlayer(videoPlayerController[index]),
                                        )
                                      : Container(),
                                ),
                              ),
                              ScreenOptions(
                                // isLike: _liked,
                                // onClickMoreBtn: widget.onClickMoreBtn,
                                // onComment: widget.onComment,
                                // onFollow: widget.onFollow,
                                // onLike: (url){
                                //   setState(() {
                                //     _liked = ! _liked;
                                //   });
                                //   if(widget.onLike != null){
                                //     widget.onLike!(url);
                                //   }
                                // },
                                // onShare: widget.onShare,
                                // showVerifiedTick: widget.showVerifiedTick,
                                item: reelsList[index],
                                isLike: reelsList[index].isLiked,
                                showVerifiedTick: true,
                                onFollow: () {},
                                onLike: (v) {},
                                onComment: (v) {},
                                onClickMoreBtn: () {},
                                onShare: (v) {},
                              ),
                              Visibility(
                                visible: !_isPlaying,
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator())
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _playNextReel(int index) {
    _stopControllerAtIndex(index - 1);
    _disposeControllerAtIndex(index - 2);
    _playControllerAtIndex(index);

    /// Initialize [index + 1] controller
    _initializeControllerAtIndex(index + 1);
  }

  void _playPreviousReel(int index) {
    _stopControllerAtIndex(index + 1);
    _disposeControllerAtIndex(index + 2);
    _playControllerAtIndex(index);
    _initializeControllerAtIndex(index - 1);
  }

  void _stopControllerAtIndex(int index) {
    if (reelsList.length > index && index >= 0) {
      final _controller = videoPlayerController[index];
      _controller.pause();
      _controller.seekTo(const Duration());
    }
  }

  void _disposeControllerAtIndex(int index) {
    if (reelsList.length > index && index >= 0) {
      final _controller = videoPlayerController[index];
      _controller.dispose();
    }
  }

  void _playControllerAtIndex(int index) {
    if (reelsList.length > index && index >= 0) {
      final _controller = videoPlayerController[index];
      if (_controller.value.isInitialized) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _initializeControllerAtIndex(index).then((value) {
          videoPlayerController[index].play();
          videoPlayerController[index].setLooping(true);
          setState(() {});
        });
      }
    }
  }

  Future _initializeControllerAtIndex(int index) async {
    if (reelsList.length > index && index >= 0) {
      final _controller = VideoPlayerController.networkUrl(Uri.parse(reelsList[index].url));
      videoPlayerController[index] = _controller;
      await _controller.initialize().then((value) {
        setState(() {});
      });
    }
  }
}

class Debouncer {
  Debouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

// PageView(
//   scrollDirection: Axis.vertical,
//   children: List.generate(
//     reelsList.length,
//     (index) => ReelsView(
//       item: reelsList[index],
//       onShare: (url) {},
//       onLike: (url) {},
//       onFollow: () {},
//       onComment: (comment) {},
//       onClickMoreBtn: () {},
//       showVerifiedTick: true,
//     ),
//   ),
// ),
