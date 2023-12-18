import 'package:flutter/material.dart';

import 'package:learn_api/model/user.dart';
import 'package:learn_api/services/user_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Users> users = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Api call"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (
            context,
            index,
          ) {
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                child: Image.network(user.picture.medium),
              ),
              title: Text(user.fullName),
              subtitle: Text(user.name.first),
              trailing: Text(user.dob.date.toString()),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final data = await UserApi.fetchUsers();

    setState(() {
      users = data;
    });
  }
}
