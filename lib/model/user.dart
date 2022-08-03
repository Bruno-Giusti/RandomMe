class User {
  final String profileImagePath;
  final String userName;
  final String userEmail;
  final String userAbout;
  final bool isDarkeMode;

  const User({
    required this.profileImagePath,
    required this.userName,
    required this.userEmail,
    required this.userAbout,
    required this.isDarkeMode,
  });
}
