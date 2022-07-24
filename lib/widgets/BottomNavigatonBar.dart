import 'package:flutter/material.dart';

import '../appRouter.dart';
import '../screens/Home.dart';
import '../screens/Messages.dart';
import '../screens/Posts.dart';

class buttomNavigationBar extends StatelessWidget {
  String screenName;
  double screen_width;
  buttomNavigationBar({required this.screen_width, required this.screenName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: screen_width / 3,
            child: IconButton(
              onPressed: () {
                AppRouter.NavigateToWidget(Posts());
              },
              icon: screenName == Posts.ScreenName
                  ? Image.asset('assets/images/Post_active.png')
                  : Image.asset('assets/images/Post_.png'),
            ),
          ),
          SizedBox(
            width: screen_width / 3,
            child: IconButton(
              onPressed: () {
                AppRouter.NavigateToWidget(Home());
              },
              icon: screenName == Home.ScreenName
                  ? Image.asset('assets/images/Home_active.png')
                  : Image.asset('assets/images/Home.png'),
            ),
          ),
          SizedBox(
            width: screen_width / 3,
            child: IconButton(
              onPressed: () {
                AppRouter.NavigateToWidget(Messages());
              },
              icon: screenName == Messages.ScreenName
                  ? Image.asset('assets/images/Messages_active.png')
                  : Image.asset('assets/images/Messages_.png'),
            ),
          ),
        ],
      ),
    );
  }
}
