import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weaver/components/topic_card.dart';
import 'package:weaver/components/weavee_card.dart';
import 'package:weaver/models/weavee.dart';
import 'package:weaver/theme.dart';

class Explore extends ConsumerWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> trendingTopics = [
      {
        'genre': 'Music',
        'topic': 'Adomination',
        'postsCount': 100000,
        'topicId': 1,
      },
      {
        'genre': 'Politics',
        'topic': 'Dark Age',
        'postsCount': 25234,
        'topicId': 2,
      },
      {
        'genre': 'Sports',
        'topic': 'Houston',
        'postsCount': 53700,
        'topicId': 3,
      },
      {
        'genre': 'Business and Finance',
        'topic': 'Monetary Crisis',
        'postsCount': 3935,
        'topicId': 4,
      },
      {
        'genre': 'Movies',
        'topic': 'Avengers: Secret Wars',
        'postsCount': 12312,
        'topicId': 5,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultMargin),
            child: SearchBar(
              hintText: 'Search',
              hintStyle: WidgetStateProperty.all(
                subtitleTextStyle.copyWith(fontSize: 14),
              ),
              leading: Icon(Icons.search, size: 20, color: subtitleTextColor),
              backgroundColor: WidgetStateProperty.all(Colors.white10),
              autoFocus: true,
              onTapOutside: (event) {},
              onChanged: (value) async {
                await Future.delayed(const Duration(milliseconds: 1000));
              },
              elevation: WidgetStateProperty.all(0),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ado.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'March 2025',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
                Text(
                  'Ado Rule the World!',
                  style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _trendingList(trendingTopics),
          const SizedBox(height: 16),
          _peopleToWeave(),
        ],
      ),
    );
  }

  Widget _trendingList(List<Map<String, dynamic>> topics) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            'Trending',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(topics.length, (index) {
            return TopicCard(
              genre: topics[index]['genre'],
              topic: topics[index]['topic'],
              postsCount: topics[index]['postsCount'],
              topicId: topics[index]['topicId'],
            );
          }),
        ),
      ],
    );
  }

  Widget _peopleToWeave() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Text(
            'People to Weave',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(5, (index) {
            return const WeaveeCard(
              weavee: Weavee(
                id: '123',
                email: 'email',
                name: 'User',
                username: 'username',
                bio: 'lorem ipsum dolor sit amet',
                posts: [],
              ),
            );
          }),
        ),
      ],
    );
  }
}

// class Explore extends ConsumerWidget {
//   const Explore({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return DefaultTabController(
//       length: 5,
//       child: Container(
//         color: backgroundPrimaryColor,
//         child: NestedScrollView(
//           headerSliverBuilder:
//               (context, innerBoxIsScrolled) => [
//                 SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   backgroundColor: backgroundPrimaryColor,
//                   floating: false,
//                   pinned: true,
//                   expandedHeight: 150,
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: Padding(
//                       padding: EdgeInsets.all(defaultMargin),
//                       child: Column(
//                         children: [
//                           SearchBar(
//                             hintText: 'Search',
//                             hintStyle: WidgetStateProperty.all(
//                               subtitleTextStyle.copyWith(fontSize: 14),
//                             ),
//                             leading: Icon(
//                               Icons.search,
//                               size: 20,
//                               color: subtitleTextColor,
//                             ),
//                             backgroundColor: WidgetStateProperty.all(
//                               Colors.white10,
//                             ),
//                             autoFocus: true,
//                             onTapOutside: (event) {},
//                             onChanged: (value) async {
//                               await Future.delayed(
//                                 const Duration(milliseconds: 1000),
//                               );
//                             },
//                             elevation: WidgetStateProperty.all(0),
//                             shape: WidgetStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   bottom: TabBar(
//                     isScrollable: true,
//                     tabAlignment: TabAlignment.start,
//                     dividerHeight: 0.1,
//                     indicatorColor: primaryColor,
//                     labelColor: primaryTextColor,
//                     unselectedLabelColor: subtitleTextColor,
//                     tabs: [
//                       Tab(
//                         child: Text(
//                           'For You',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: semibold,
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Trending',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: semibold,
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'News',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: semibold,
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Entertainments',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: semibold,
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Sports',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: semibold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//           body: TabBarView(
//             children: [
//               _dummyExploreData(),
//               _dummyExploreData(),
//               _dummyExploreData(),
//               _dummyExploreData(),
//               _dummyExploreData(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _dummyExploreData() {
//     return const Column(children: [Text('data')]);
//   }
// }
