import 'package:flutter/material.dart';

class FreeRemittancePage extends StatelessWidget {
  final phonebook = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 30; i++) {
      phonebook.add(['아무개', '010-0000-0000']);
    }
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.grey[300],
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: "검색/직접 입력"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: phonebook.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    title: Text(phonebook[index][0]),
                    subtitle: Text(phonebook[index][1]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
