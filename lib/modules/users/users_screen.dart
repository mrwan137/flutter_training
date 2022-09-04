import 'package:first_flutter_application/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(name: 'Mrwan', phone: '+201120542916'),
    UserModel(name: 'Alaa', phone: '+201120542916'),
    UserModel(name: 'Ammar', phone: '+201120542916'),
    UserModel(name: 'Mrwan', phone: '+201120542916'),
    UserModel(name: 'Alaa', phone: '+201120542916'),
    UserModel(name: 'Ammar', phone: '+201120542916'),
    UserModel(name: 'Mrwan', phone: '+201120542916'),
    UserModel(name: 'Alaa', phone: '+201120542916'),
    UserModel(name: 'Ammar', phone: '+201120542916'),
    UserModel(name: 'Mrwan', phone: '+201120542916'),
    UserModel(name: 'Alaa', phone: '+201120542916'),
    UserModel(name: 'Ammar', phone: '+201120542916'),
    UserModel(name: 'Mrwan', phone: '+201120542916'),
    UserModel(name: 'Alaa', phone: '+201120542916'),
    UserModel(name: 'Ammar', phone: '+201120542916'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20.0,
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (context, index) => userBuild(users[index]),
            separatorBuilder: (context, index) =>  Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: users.length,
        ),
      ),
    );
  }

  Widget userBuild(UserModel user) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 30.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 35.0,
            ),
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                '${user.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                '${user.phone}',
                style: TextStyle(
                  fontSize: 15.0,
                    color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
