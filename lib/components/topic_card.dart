import 'package:flutter/material.dart';
import 'package:weaver/theme.dart';
import 'package:weaver/utils/number_formatter.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    super.key,
    required this.genre,
    required this.topic,
    required this.postsCount,
    required this.topicId,
  });

  final String genre;
  final String topic;
  final int postsCount;
  final int topicId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          0,
          defaultMargin,
          defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              genre,
              style: subtitleTextStyle.copyWith(fontSize: 12, fontWeight: bold),
            ),
            const SizedBox(height: 4),
            Text(
              topic,
              style: primaryTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
            const SizedBox(height: 4),
            Text(
              '${formatWithComma(postsCount)} posts',
              style: subtitleTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
