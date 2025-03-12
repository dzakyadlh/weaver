import 'package:flutter/material.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/models/post.dart';
import 'package:weaver/theme.dart';
import 'package:weaver/utils/number_formatter.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isLiked = true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(defaultMargin),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white30, width: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.post.user.imageUrl!),
                      radius: 24,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.user.name,
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          '@${widget.post.user.username}',
                          style: subtitleTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    color: subtitleTextColor,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.post.caption,
              style: primaryTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.start,
            ),
            widget.post.media.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.network(
                    widget.post.media[0].url,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                )
                : const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubIconButton(
                  icon: Icons.comment_outlined,
                  buttonText: '128',
                  iconSize: 14,
                  textSize: 14,
                  onTap: () {},
                ),
                SubIconButton(
                  icon: isLiked ? Icons.favorite : Icons.favorite_outline,
                  buttonText: '1228',
                  iconSize: 14,
                  textSize: 14,
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                SubIconButton(
                  icon: Icons.bar_chart_rounded,
                  buttonText: '128',
                  iconSize: 14,
                  textSize: 14,
                  onTap: () {},
                ),
                SubIconButton(
                  icon: Icons.bookmark_outline,
                  buttonText: '128',
                  iconSize: 14,
                  textSize: 14,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
