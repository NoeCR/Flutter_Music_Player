import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Add funcionality for icons
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // TODO: close App
            Icon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            // TODO: Change Icon and select current song as favorite
            Icon(FontAwesomeIcons.commentAlt),
            SizedBox(width: 20),
            // TODO: Change Icon and open forlder with songs
            Icon(FontAwesomeIcons.headphonesAlt),
            SizedBox(width: 20),
            // TODO: Change Icon and open app settings
            Icon(FontAwesomeIcons.externalLinkAlt),
          ],
        ),
      ),
    );
  }
}
