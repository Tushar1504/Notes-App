import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                ref.add({
                  'title': title.text,
                  'content': content.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ))
        ],
      ),
      body: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                hintText: 'Title',
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: content,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintText: 'Content',
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
