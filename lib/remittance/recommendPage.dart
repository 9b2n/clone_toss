import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[Accounts(), PhoneBook()],
    );
  }
}

class Accounts extends StatelessWidget {
  final List<dynamic> banks = [
    ['토스머니', '010-0000-0000'],
    ['KB국민은행 계좌', 'KB국민은행'],
    ['우리은행 계좌', '우리은행'],
    ['공동설계 계좌', '돈 같이 모으기']
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0)
              return ListTile(
                leading: Text("내 계좌"),
                title: Text(
                  "n개",
                  textAlign: TextAlign.end,
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              );
            else
              return ListTile(
                leading: Icon(
                  Icons.account_balance_wallet,
                  size: 15,
                ),
                title: Text(banks[index][0]),
                subtitle: Text(banks[index][1]),
                onTap: () {},
              );
          },
          itemCount: 4,
        )
      ],
    );
  }
}

class PhoneBook extends StatefulWidget {
  @override
  _PhoneBookState createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  final phonebooks = [];
  final checked = [];
  Color _iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 10; i++) phonebooks.add(['아무개', '000-0000-0000']);
    for (var i = 0; i < 10; i++) checked.add(false);

    return Column(
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0)
              return ListTile(
                leading: Text("최근"),
              );
            else
              return ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 15,
                ),
                title: Text(phonebooks[index][0]),
                subtitle: Text(phonebooks[index][1]),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        if(checked[index] == true) {
                          _iconColor = Colors.grey;
                          checked[index] = false;
                        }
                        else {
                          _iconColor = Colors.blue;
                          checked[index] = true;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.star,
                      color: _iconColor,
                    )),
                onTap: () {},
              );
          },
          itemCount: phonebooks.length,
        )
      ],
    );
  }
}
