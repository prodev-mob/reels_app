import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final List<ReelModel> reelsList = [
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

  final Map<int, VideoPlayerController> _controllers = {};
  final Set<int> _failedIndices = {};
  final Debouncer _debouncer = Debouncer(milliseconds: 200);

  bool _isPlaying = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _handleIndexChange(0);
  }

  @override
  void dispose() {
    _debouncer.cancel();
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
    super.dispose();
  }

  Future<void> _handleIndexChange(int index) async {
    currentIndex = index;
    _isPlaying = true;

    // Pause all other controllers immediately
    _controllers.forEach((idx, controller) {
      if (idx != index) {
        try {
          if (controller.value.isInitialized) {
            controller.pause();
            controller.seekTo(Duration.zero);
          }
        } catch (_) {}
      }
    });

    // Dispose controllers that are far away (> 2 steps) to save memory
    final keysToRemove = <int>[];
    _controllers.forEach((idx, controller) {
      if ((idx - index).abs() > 2) {
        keysToRemove.add(idx);
        try {
          controller.dispose();
        } catch (_) {}
      }
    });
    for (final key in keysToRemove) {
      _controllers.remove(key);
    }

    // Play target index
    await _initAndPlay(index);

    // Preload next and previous adjacent videos
    if (index + 1 < reelsList.length) {
      _preload(index + 1);
    }
    if (index - 1 >= 0) {
      _preload(index - 1);
    }
  }

  Future<void> _initAndPlay(int index) async {
    if (index < 0 || index >= reelsList.length) return;

    VideoPlayerController? controller = _controllers[index];

    if (controller == null) {
      controller = VideoPlayerController.networkUrl(Uri.parse(reelsList[index].url));
      _controllers[index] = controller;
      try {
        await controller.initialize();
        _failedIndices.remove(index);
      } catch (e) {
        debugPrint('Error initializing video at index $index: $e');
        _failedIndices.add(index);
        if (mounted) setState(() {});
        return;
      }
    }

    if (controller.value.isInitialized) {
      if (currentIndex == index) {
        await controller.setLooping(true);
        await controller.play();
        _isPlaying = true;
      }
    }
    if (mounted) setState(() {});
  }

  Future<void> _preload(int index) async {
    if (index < 0 || index >= reelsList.length) return;
    if (_controllers.containsKey(index)) return;

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(reelsList[index].url));
      _controllers[index] = controller;
      await controller.initialize();
      _failedIndices.remove(index);
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Error preloading video at index $index: $e');
      _failedIndices.add(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Swiper(
          physics: const AlwaysScrollableScrollPhysics(),
          loop: false,
          scrollDirection: Axis.vertical,
          itemCount: reelsList.length,
          onIndexChanged: (index) {
            _debouncer.run(() {
              _handleIndexChange(index);
            });
          },
          itemBuilder: (context, index) {
            final controller = _controllers[index];
            final hasError = _failedIndices.contains(index) || (controller?.value.hasError ?? false);
            final isInitialized = controller != null && controller.value.isInitialized && !hasError;

            if (hasError) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline_rounded, color: Colors.white70, size: 50),
                          const SizedBox(height: 12),
                          const Text(
                            'Video playback failed',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Swipe up or down to continue',
                            style: TextStyle(color: Colors.white54, fontSize: 13),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              _failedIndices.remove(index);
                              _controllers.remove(index)?.dispose();
                              setState(() {});
                              _initAndPlay(index);
                            },
                            icon: const Icon(Icons.refresh, size: 18),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: ScreenOptions(
                      item: reelsList[index],
                      isLike: reelsList[index].isLiked,
                      showVerifiedTick: true,
                      onFollow: () {},
                      onLike: (v) {},
                      onComment: (v) {},
                      onClickMoreBtn: () {},
                      onShare: (v) {},
                    ),
                  ),
                ],
              );
            }

            if (!isInitialized) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.5,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: ScreenOptions(
                      item: reelsList[index],
                      isLike: reelsList[index].isLiked,
                      showVerifiedTick: true,
                      onFollow: () {},
                      onLike: (v) {},
                      onComment: (v) {},
                      onClickMoreBtn: () {},
                      onShare: (v) {},
                    ),
                  ),
                ],
              );
            }

            return FadeIn(
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (_isPlaying) {
                    controller.pause();
                    _isPlaying = false;
                  } else {
                    controller.play();
                    controller.setLooping(true);
                    _isPlaying = true;
                  }
                  setState(() {});
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Colors.black,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: VideoPlayer(controller),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: ScreenOptions(
                        item: reelsList[index],
                        isLike: reelsList[index].isLiked,
                        showVerifiedTick: true,
                        onFollow: () {},
                        onLike: (v) {},
                        onComment: (v) {},
                        onClickMoreBtn: () {},
                        onShare: (v) {},
                      ),
                    ),
                    if (!_isPlaying)
                      const Center(
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black45,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Debouncer {
  Debouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
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
