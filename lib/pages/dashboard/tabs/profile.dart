import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weaver/components/post_card.dart';
import 'package:weaver/models/post.dart';
import 'package:weaver/providers/dummy_user_notifier.dart';
import 'package:weaver/theme.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(dummyUserNotifierProvider);

    return userState.when(
      data: (data) {
        final user = data!;
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
                                style: subtitleTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.bio!,
                                style: subtitleTextStyle.copyWith(fontSize: 14),
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
                    _buildRepliesList(user.posts),
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

  Widget _buildRepliesList(List<Post> posts) {
    return Container();
  }

  Widget _buildTaggedList(List<Post> posts) {
    return Container();
  }
}
