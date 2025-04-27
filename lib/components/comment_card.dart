import 'package:flutter/material.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/models/comment.dart';
import 'package:weaver/theme.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ado.jpg'),
                  foregroundImage: AssetImage('assets/images/ado.jpg'),
                  radius: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      comment.post.user.name,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 14,
                                      color: subtitleTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '@${comment.post.user.username}',
                                style: subtitleTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        comment.post.caption,
                        style: primaryTextStyle.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubIconButton(
                            icon: Icons.comment_outlined,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.favorite_outline,
                            buttonText: '1228',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.bar_chart_rounded,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.bookmark_outline,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ado.jpg'),
                  foregroundImage: AssetImage('assets/images/ado.jpg'),
                  radius: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.commenterName,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                              Text(
                                '@${comment.commenterUsername}',
                                style: subtitleTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        comment.content,
                        style: primaryTextStyle.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubIconButton(
                            icon: Icons.comment_outlined,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.favorite_outline,
                            buttonText: '1228',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.bar_chart_rounded,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                          SubIconButton(
                            icon: Icons.bookmark_outline,
                            buttonText: '128',
                            iconSize: 12,
                            iconColor: subtitleTextColor,
                            textSize: 12,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
