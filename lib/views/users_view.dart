import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({required Key key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(uid: '1', name: 'Maria', email: 'test1@test.com', online: true),
    User(uid: '2', name: 'Jose', email: 'test2@test.com', online: false),
    User(uid: '3', name: 'Juan', email: 'test3@test.com', online: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
          )
        ],
      ),
      body: PullToRefreshNotification(
        onRefresh: _uploadUsers,
        controller: _refreshController,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, i) => _userListTile(users[i]),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: users.length,
        ),
      ),
    );
  }

  Future<bool> _uploadUsers() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    return true; // Indicate that the refresh operation was successful
  }

  ListTile _userListTile(User user) {
    return ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[200],
          child: Text(user.name.substring(0, 2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red[600],
            borderRadius: BorderRadius.circular(100),
          ),
        ));
  }
}
