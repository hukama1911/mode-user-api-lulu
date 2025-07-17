import 'package:flutter/material.dart';
import '../model/model_list_user_data.dart';

class UserDataDetail extends StatelessWidget {
  final DataUser user;

  const UserDataDetail({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.avatar ?? ''),
                backgroundColor: Colors.grey.shade200,
                child: user.avatar == null ? Icon(Icons.person, size: 60) : null,
              ),
            ),
            const SizedBox(height: 20),

            // User Information Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('ID'),
                      subtitle: Text('${user.id ?? 'N/A'}'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Full Name'),
                      subtitle: Text('${user.firstName ?? ''} ${user.lastName ?? ''}'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text(user.email ?? 'N/A'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}