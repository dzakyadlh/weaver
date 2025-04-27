import 'package:flutter/material.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/models/post.dart';
import 'package:weaver/theme.dart';
import 'package:weaver/utils/date_formatter.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)?.settings.arguments as Post;
    bool isLiked = false;

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: primaryTextColor,
        backgroundColor: backgroundPrimaryColor,
        elevation: 0,
        title: Text(
          'Post',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultMargin),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white30, width: 0.5),
                  ),
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
                              backgroundImage: NetworkImage(
                                post.user.imageUrl!,
                              ),
                              radius: 24,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.user.name,
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  '@${post.user.username}',
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 14,
                                  ),
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
                      post.caption,
                      style: primaryTextStyle.copyWith(fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                    post.media.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            child: Image.network(
                              post.media[0].url,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )
                        : const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          DateFormatter.toHourMinute(post.updatedAt),
                          style: subtitleTextStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          DateFormatter.toDayMonthYear(post.updatedAt),
                          style: subtitleTextStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(width: 16),

                        Text(
                          '1M Views',
                          style: subtitleTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubIconButton(
                          icon: Icons.comment_outlined,
                          buttonText: '128',
                          iconSize: 14,

                          iconColor: subtitleTextColor,
                          textSize: 14,
                          onTap: () {},
                        ),
                        SubIconButton(
                          icon:
                              isLiked ? Icons.favorite : Icons.favorite_outline,
                          buttonText: '1228',
                          iconSize: 14,

                          iconColor: isLiked ? Colors.pink : subtitleTextColor,
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

                          iconColor: subtitleTextColor,
                          textSize: 14,
                          onTap: () {},
                        ),
                        SubIconButton(
                          icon: Icons.bookmark_outline,
                          buttonText: '128',
                          iconSize: 14,

                          iconColor: subtitleTextColor,
                          textSize: 14,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder:
                    (context, index) =>
                        const Divider(color: Colors.white30, height: 0.5),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: post.comments.length,
                itemBuilder: (context, index) {
                  final comment = post.comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(comment.commenterImageUrl),
                    ),
                    title: Text(
                      comment.commenterName,
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                    subtitle: Text(comment.content, style: subtitleTextStyle),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
