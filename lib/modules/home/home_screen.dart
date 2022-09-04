
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: Icon(
          Icons.menu
        ),
        title: Text(
          'Rivise App'
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important
            ),
            onPressed: (){
              print('notfication pressed');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search
            ),
            onPressed: (){
              print('searche pressed');
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.purpleAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: Text(
                  'first text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: Text(
                  'seconde text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                child: Text(
                  'third text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}