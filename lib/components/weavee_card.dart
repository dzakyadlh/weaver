import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weaver/models/weavee.dart';
import 'package:weaver/theme.dart';

class WeaveeCard extends StatelessWidget {
  const WeaveeCard({super.key, required this.weavee});

  final Weavee weavee;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(defaultMargin, 12, defaultMargin, 12),
        child: Row(
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
                            weavee.name,
                            style: primaryTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            '@${weavee.username}',
                            style: subtitleTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Text(
                          'Weave',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    weavee.bio ?? 'No Bio',
                    style: primaryTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
