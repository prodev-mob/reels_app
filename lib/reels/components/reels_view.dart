import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:untitled/reels/components/url_checker.dart';
import 'package:untitled/reels/models/reel_model.dart';
import 'screen_options.dart';

class ReelsView extends StatefulWidget {
  final ReelModel item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;

  const ReelsView({
    super.key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
  });

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  BetterPlayerController? _betterPlayerController;
  bool _liked = false;
  bool loading = true;
  bool isIconVisible = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    loading = true;
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      _initBetterPlayer();
    }
  }

  play() {
    _betterPlayerController?.play();
  }

  pause() {
    _betterPlayerController?.pause();
  }

  _initBetterPlayer() async {
    try {
      _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          autoPlay: true,
          autoDispose: true,
          looping: true,
          controlsConfiguration: const BetterPlayerControlsConfiguration(
            showControls: false,
            showControlsOnInitialize: false,
            enableMute: true,
          ),
          showPlaceholderUntilPlay: true,
          fit: BoxFit.cover,
          expandToFill: false,
          errorBuilder: (context, error) {
            return Center(
              child: Text(error.toString()),
            );
          },
        ),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          widget.item.url,
        ),
      );

      _betterPlayerController?.addEventsListener((event) async {
        if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
          setState(() {
            loading = false;
          });
        }
        if (event.betterPlayerEventType == BetterPlayerEventType.pause) {}
        if (event.betterPlayerEventType == BetterPlayerEventType.exception) {}
      });
    } catch (e) {
      debugPrint('error   ${e.toString()}');
    }
  }

  @override
  void dispose() {
    _betterPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _betterPlayerController != null && loading == false
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  onTap: () async {
                    timer?.cancel();
                    setState(() {
                      isIconVisible = true;
                    });
                    if (_betterPlayerController?.isPlaying() == true) {
                      pause();
                    } else {
                      play();
                    }
                    timer = Timer(const Duration(seconds: 2), () {
                      setState(() {
                        isIconVisible = false;
                      });
                      timer?.cancel();
                    });
                  },
                  onDoubleTap: () {
                    _liked = ! _liked;
                    setState(() {

                    });
                    widget.onLike!(widget.item.url);
                  },
                  child: BetterPlayer(
                    controller: _betterPlayerController!,
                  ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),

        ScreenOptions(
          isLike: _liked,
          onClickMoreBtn: widget.onClickMoreBtn,
          onComment: widget.onComment,
          onFollow: widget.onFollow,
          onLike: (url){
            setState(() {
              _liked = ! _liked;
            });
            if(widget.onLike != null){
              widget.onLike!(url);
            }
          },
          onShare: widget.onShare,
          showVerifiedTick: widget.showVerifiedTick,
          item: widget.item,
        ),
        Visibility(
          visible: isIconVisible,
          child: GestureDetector(
            onTap: () async {
              setState(() {
                isIconVisible = true;
              });
              if (_betterPlayerController?.isPlaying() == true) {
                pause();
              } else {
                play();
              }
              await Future.delayed(const Duration(seconds: 4));
              setState(() {
                isIconVisible = false;
              });
            },
            child: Icon(
              _betterPlayerController?.isPlaying() == true
                  ? Icons.pause
                  : Icons.play_arrow_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
