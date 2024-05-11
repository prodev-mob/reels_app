import 'package:flutter/material.dart';
import 'package:untitled/reels/components/user_profile_image.dart';
import 'package:untitled/reels/models/reel_model.dart';
import 'comment_bottomsheet.dart';
import 'package:intl/intl.dart';

class ScreenOptions extends StatelessWidget {
  final ReelModel item;
  final bool isLike;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;

  const ScreenOptions({
    super.key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    required this.isLike,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 110),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: item.profileUrl != null,
                          child: UserProfileImage(
                            profileUrl: item.profileUrl ?? '',
                          ),
                        ),
                        Visibility(
                          visible: item.profileUrl == null,
                          child: const CircleAvatar(
                            radius: 16,
                            child: Icon(Icons.person, size: 18),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(item.userName,
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(width: 10),
                        Visibility(
                          visible: showVerifiedTick,
                          child: const Icon(
                            Icons.verified,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        Visibility(
                            visible: showVerifiedTick,
                            child: const SizedBox(width: 6)),
                        Visibility(
                          visible: onFollow != null,
                          child: TextButton(
                            onPressed: onFollow,
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    if (item.reelDescription != null)
                      Text(item.reelDescription ?? '',
                          style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: item.musicName != null,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.music_note,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            'Original Audio - ${item.musicName}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Visibility(
                    visible: onLike != null && !isLike,
                    child: InkWell(
                      child: const Icon(Icons.favorite_outline,
                          color: Colors.white),
                      onTap: () => onLike!(item.url),
                    ),
                  ),
                  Visibility(
                    visible: isLike,
                    child: InkWell(
                      onTap: () => onLike!(item.url),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Text(
                    NumbersToShort.convertNumToShort(item.likeCount),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    icon:
                        const Icon(Icons.comment_rounded, color: Colors.white),
                    onPressed: () {
                      if (onComment != null) {
                        showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (ctx) => CommentBottomSheet(
                            commentList: item.commentList ?? [],
                            onComment: onComment,
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    NumbersToShort.convertNumToShort(
                        item.commentList?.length ?? 0),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: onShare != null,
                    child: InkWell(
                      onTap: () => onShare!(item.url),
                      child: Transform(
                        transform: Matrix4.rotationZ(5.8),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: onClickMoreBtn != null,
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: onClickMoreBtn!,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NumbersToShort {
  static String convertNumToShort(int number) {
    if (number == 0) {
      return '0';
    }
    return NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(number).replaceAll('.00', '');
  }
}
