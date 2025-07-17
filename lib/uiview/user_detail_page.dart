import 'package:flutter/material.dart';
import '../model/model_users.dart';

class UserDetailPage extends StatelessWidget {
  final ModelUsers user;

  const UserDetailPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                Text("Username: ${user.username}"),
                SizedBox(height: 4),

                Text("Email: ${user.email}"),
                SizedBox(height: 4),

                Text("Phone: ${user.phone}"),
                SizedBox(height: 4),

                Text("Address: ${user.address.street}, ${user.address.suite}, ${user.address.city}, ${user.address.zipcode}"),
                SizedBox(height: 4),

                Text("Company: ${user.company.name}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}