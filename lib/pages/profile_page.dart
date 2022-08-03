import 'package:flutter/material.dart';
import 'package:random_user/model/user.dart';
import 'package:random_user/utils/user_preferences.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/button_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagegPath: user.profileImagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(
            child: buildFollowersButton(),
          ),
          const SizedBox(height: 24),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.userName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.userEmail,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildFollowersButton() => ButtonWidget(
        text: 'Lista de Amigos',
        onClicked: () => Navigator.of(context).pushNamed('/friendList'),
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sobre ' + user.userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              user.userAbout,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            )
          ],
        ),
      );
}
