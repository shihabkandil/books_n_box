import 'package:flutter/material.dart';

import '../../data/repository/user_data_cache.dart';

class ProfileAvatarCircle extends StatelessWidget {
  ProfileAvatarCircle({super.key});

  final UserDataCache user = UserDataCache();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: CircleAvatar(
            backgroundImage: user
                        .readUserDataCachePreferences()
                        .profilePicturePath !=
                    null
                ? NetworkImage(
                    user.readUserDataCachePreferences().profilePicturePath!)
                : NetworkImage(
                    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg"),
            radius: 60,
          ),
        ),
        Text(
           user.readUserDataCachePreferences().name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
