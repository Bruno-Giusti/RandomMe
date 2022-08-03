import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_user/widgets/appbar_widget.dart';

import '../model/friend.dart';

class FriendListPage extends StatefulWidget {
  const FriendListPage({Key? key}) : super(key: key);

  @override
  State<FriendListPage> createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const FriendList(),
    );
  }
}



class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  late bool loading;
  List<Friend>? friends;

  @override
  void initState() {
    friends = [];
    loading = true;

    _loadUsers();
    super.initState();
  }

  void _loadUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=15'));
    final json = jsonDecode(response.body);
    List<Friend> _friends = [];
    for (var jsonUser in json['results']) {
      _friends.add(Friend.fromjson(jsonUser));
    }
    setState(() {
      friends = _friends;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(friends![index].fullName!),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(friends![index].photoUrl!),
          ),
        );
      },
      itemCount: friends!.length,
    );
  }
}
