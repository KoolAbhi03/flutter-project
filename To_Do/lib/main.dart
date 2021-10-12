// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:To_Do/list_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List todo = <String>[];
  List isdone = <String>[];
  String temp = '';
  String temp2 = '0';
  var i = Icon(Icons.circle);

  void initState() {
    super.initState();
    getlist();
  }

  getlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todo = (prefs.getStringList('todo') ?? <String>[]);
    });
  }

  putlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (temp != '') {
        todo = (prefs.getStringList('todo') ?? <String>[]);
        todo.add(temp);
        prefs.setStringList('todo', todo);
        print(todo);
        temp = '';
        print(todo);
      }
    });
  }

  removetask(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      todo = (prefs.getStringList('todo') ?? <String>[]);
      todo.remove(s);
      prefs.setStringList('todo', todo);

      print(todo);
    });
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        backgroundColor: Colors.grey[850],
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: [
            Expanded(
              child: new TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (task) {
                  setState(() {
                    if (task != '') {
                      temp = task;
                    }
                  });
                },
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Add Task',
                    labelStyle: TextStyle(color: Colors.amberAccent),
                    hintText: 'eg. 2kg dhaniya lana h',
                    hintStyle: TextStyle(color: Colors.white54)),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: const Text('CANCEL',
                  style: TextStyle(
                    color: Colors.amberAccent,
                  )),
              onPressed: () {
                Navigator.pop(context);
              }),
          FlatButton(
              child: const Text('SAVE',
                  style: TextStyle(
                    color: Colors.amberAccent,
                  )),
              onPressed: () {
                setState(() {
                  putlist();
                  Navigator.pop(context);
                });
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          _showDialog();
        },
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'To Do',
          style: TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...todo.map((task) {
              return Todocard(
                  s: task,
                  del: () {
                    setState(() {
                      removetask(task);
                    });
                  });
            }),
            if (todo.isEmpty)
              Center(
                child: Text('Nothing to do, Add some task',
                    style: TextStyle(
                      color: Colors.amberAccent,
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
