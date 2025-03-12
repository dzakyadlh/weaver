import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weaver/components/comment_card.dart';
import 'package:weaver/components/post_card.dart';
import 'package:weaver/models/comment.dart';
import 'package:weaver/models/post.dart';
import 'package:weaver/providers/comments_notifier.dart';
import 'package:weaver/providers/dummy_user_notifier.dart';
import 'package:weaver/theme.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final userId = ref.read(dummyUserNotifierProvider).value!.id;
      ref.read(commentsNotifierProvider.notifier).fetchUserComments('asdads');
    });
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(dummyUserNotifierProvider);
    final commentsState = ref.watch(commentsNotifierProvider);

    return userState.when(
      data: (userData) {
        return commentsState.when(
          data: (commentData) {
            final user = userData!;
            final comments = commentData;
            return DefaultTabController(
              length: 3,
              child: Container(
                color: backgroundPrimaryColor,
                child: NestedScrollView(
                  headerSliverBuilder:
                      (context, innerBoxIsScrolled) => [
                        SliverAppBar(
                          backgroundColor: backgroundPrimaryColor,
                          expandedHeight: 280,
                          floating: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Padding(
                              padding: EdgeInsets.all(defaultMargin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            user.imageUrl != null
                                                ? NetworkImage(user.imageUrl!)
                                                : const AssetImage(
                                                      'assets/images/ado.jpg',
                                                    )
                                                    as ImageProvider,
                                        radius: 48,
                                      ),
                                      const SizedBox(width: 48),
                                      Column(
                                        children: [
                                          Text(
                                            '225',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Posts',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 28),
                                      Column(
                                        children: [
                                          Text(
                                            '500',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Weaved',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    user.name,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                  Text(
                                    '@${user.username}',
                                    style: subtitleTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    user.bio!,
                                    style: subtitleTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          bottom: TabBar(
                            dividerHeight: 0.1,
                            indicatorColor: primaryColor,
                            labelColor: primaryTextColor,
                            unselectedLabelColor: subtitleTextColor,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Posts',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Replies',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Tagged',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: semibold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                  body: Container(
                    color: backgroundPrimaryColor,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildPostList(user.posts),
                        _buildRepliesList(comments),
                        _buildTaggedList(user.posts),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (e, _) {
            return Center(child: Text(e.toString(), style: errorTextStyle));
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          },
        );
      },
      error: (e, _) {
        return Center(child: Text(e.toString(), style: errorTextStyle));
      },
      loading: () {
        return Center(child: CircularProgressIndicator(color: primaryColor));
      },
    );
  }

  Widget _buildPostList(List<Post> posts) {
    if (posts.isNotEmpty) {
      return Container(
        color: backgroundPrimaryColor, // Apply background color to tab content
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: posts.length,
          itemBuilder: (context, index) => PostCard(post: posts[index]),
        ),
      );
    } else {
      return Text(
        'No posts',
        style: primaryTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
      );
    }
  }

  Widget _buildRepliesList(List<Comment> comments) {
    return Container(
      color: backgroundPrimaryColor,
      child: ListView.separated(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return CommentCard(comment: comments[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.white10, thickness: 0.5);
        },
      ),
    );
  }

  Widget _buildTaggedList(List<Post> posts) {
    return Container();
  }
}
