import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey)
            )
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            title: Text("은행 선택", style: TextStyle(color: Colors.grey, fontSize: 25),),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {},
          ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 30, 10, 5),
            labelStyle: TextStyle(
              color: Colors.grey
            ),
            hintText: '계좌번호 입력',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
          ),
        )
      ],
    );
  }
  
  Widget bankChoice() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child: Text("은행 선택"),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(30, (index) => Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.accents[index % Colors.accents.length]
              ),
            ),
          )),)
      ],
    );
  }

  Widget securitiesChoice() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Container(
          child: Text("증권사 선택"),
        ),
        GridView.count(
          crossAxisCount: 3,
          children: List.generate(30, (index) => Card(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.accents[index % Colors.accents.length]
              ),
            ),
          )),)
      ],
    );
  }
}
