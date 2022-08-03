import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagegPath;
  final VoidCallback onClicked;

  const ProfileWidget(
      {Key? key, required this.imagegPath, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagegPath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }
}
