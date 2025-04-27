import 'package:flutter/material.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/theme.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: primaryTextColor,
        backgroundColor: backgroundPrimaryColor,
        title: Text(
          'Create a New Post',
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        elevation: 0,
      ),
      backgroundColor: backgroundPrimaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            right: defaultMargin,
            left: defaultMargin,
            bottom: defaultMargin,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
                      ),
                      radius: 24,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        style: primaryTextStyle.copyWith(fontSize: 16),
                        maxLines: null, // <-- allow unlimited lines
                        keyboardType:
                            TextInputType.multiline, // <-- multiline keyboard
                        expands: true, // <-- expand to fill available height
                        decoration: InputDecoration(
                          hintText: 'Share your story',
                          hintStyle: subtitleTextStyle.copyWith(fontSize: 16),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.zero, // <-- remove default padding
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.image_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.gif_box_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.location_on_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButtonStateless(
                      buttonText: 'Post',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
