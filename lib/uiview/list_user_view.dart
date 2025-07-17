import 'dart:convert';

import 'package:client_server_vita/uiview/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/model_users.dart';


class ListUserView extends StatefulWidget {
  const ListUserView({super.key});

  @override
  State<ListUserView> createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {

  bool isLoading = false;
  List<ModelUsers> listUsers = [];

  //do in background untuk fetching data
  Future getUser() async{

    try{
      setState(() {
        isLoading = true;
      });

      //proses untuk akses url
      http.Response res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      var data = res.body;

      setState(() {
        var decodedData = json.decode(data);
        for (var i in decodedData){
          listUsers.add(ModelUsers.fromJson(i));
        }
        isLoading = false; // set loading to false when data is fetched
      });

    }catch(e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: listUsers.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Card(
              child: InkWell(
                onTap: () {
                  // Navigate to detail page when card is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(user: listUsers[index]),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(listUsers[index].name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listUsers[index].email),
                      Text(listUsers[index].username),
                      Text(listUsers[index].address.city),

                      //memanggil string di dalam string
                      Text("Email : " + listUsers[index].email),
                      Text("Username : ${listUsers[index].username}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}