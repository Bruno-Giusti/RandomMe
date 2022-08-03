class Friend {
  String? fullName, photoUrl;

  Friend(this.fullName, this.photoUrl);

  Friend.fromjson(Map<String, dynamic> json)
      : fullName = json['name']['first'] + ' ' + json['name']['last'],
        photoUrl = json['picture']['medium'];
}
