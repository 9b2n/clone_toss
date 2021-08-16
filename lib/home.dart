import 'package:clone_toss/remittance/remittancePage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
            children: <Widget>[
            UserInfoTile(),
            Divider(color: Colors.black26),
            AccountBox(),
            Divider(color: Colors.black26),
            CardBox(),
            Divider(color: Colors.black26),
            LoanBox(),
            Divider(color: Colors.black26),
            InsuranceBox(),
            Divider(color: Colors.black26),
            AddtionTile(),
          ],),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Visibility(
          child: Text("홈"),
          // visible: false,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.sms, color: Colors.grey,)
          ),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.add_alert, color: Colors.grey,)
          ),
        ],
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.person,
        size: 50,
      ),
      title: Text("방규빈"),
      subtitle: Text(
        "신용 점수 보기",
        style: TextStyle(
            color: Colors.grey
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Remittance()
          ));
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue[100],
            onPrimary: Colors.blueAccent
        ),
        child: Text("송금"),
      ),
    );
  }
}

class AccountBox extends StatelessWidget {
  final List<dynamic> banks = [['토스머니', '99,999 원'], ['KB국민은행 계좌', '잔액보기'], ['우리은행 계좌', '잔액보기'], ['공동설계 계좌', '0 원'], ['토스증권 계좌 만들기', '수수료 무료 혜택']];
  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
      if (index == 0)
        return ListTile(
          leading: Text("계좌", style: TextStyle(fontSize: 20),),
          trailing: Icon(Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 15,
          )
        );
      else return AccountTile(banks[index-1]);
    },
      itemCount: banks.length + 1,
    );
  }
}

class AccountTile extends StatelessWidget {
  AccountTile(this._account);

  final List _account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank, size: 40,),
      title: Text(_account[0], style: TextStyle(fontSize: 12, color: Colors.grey),),
      subtitle: Text(_account[1], style: TextStyle(fontSize: 18, color: Colors.black),),
      trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Remittance()
            ));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.grey[200],
              onPrimary: Colors.black45,
              minimumSize: Size(50, 35),
              elevation: 0
          ),
          child: Text("송금", style: TextStyle(fontSize: 13),),
        ),
    );
  }
}

class CardBox extends StatelessWidget {
  final List<dynamic> cards = [['토스머니카드', 0], ['나라사랑카드', 9999999], ['위비 Five 체크',0]];

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    var sum = 0;
    cards.forEach((element) {
      sum += element[1] as int;
      }
    );
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == 0)
          return ListTile(
              leading: Text("카드", style: TextStyle(fontSize: 20),),
              title: Text(intToMoney(sum)+" 원", textAlign: TextAlign.end, style: TextStyle(color: Colors.grey),),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 15,
              )
          );
        else return CardTile(cards[index-1]);
      },
      itemCount: cards.length + 1,
    );
  }
}

class CardTile extends StatelessWidget {
  CardTile(this._card);

  final _card;
  final Pattern pattern = RegExp(r'(.{3})(?!$)');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank, size: 40,),
      title: Text(_card[0], style: TextStyle(fontSize: 12, color: Colors.grey),),
      subtitle: Text(intToMoney(_card[1])+" 원", style: TextStyle(fontSize: 18, color: Colors.black),),
    );
  }
}

class LoanBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == 0)
          return ListTile(
              leading: Text("대출", style: TextStyle(fontSize: 20),),
              title: Text("내가 받을 수 있는 대출", textAlign: TextAlign.end, style: TextStyle(color: Colors.grey),),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 15,
              )
          );
        else return LoanTile();
      },
      itemCount: 2,
    );
  }
}


class LoanTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank, size: 40,),
      title: Text("32개 금융사 대기중", style: TextStyle(fontSize: 12, color: Colors.grey),),
      subtitle: Text("나는 얼마까지 대출 받을 수 있을까?", style: TextStyle(fontSize: 18, color: Colors.black),),
    );
  }
}

class InsuranceBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == 0)
          return ListTile(
              leading: Text("보험", style: TextStyle(fontSize: 20),),
              title: Text("999,9999 원", textAlign: TextAlign.end, style: TextStyle(color: Colors.grey),),
              trailing: Icon(Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                size: 15,
              )
          );
        else return InsuranceTile();
      },
      itemCount: 2,
    );
  }
}


class InsuranceTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_box_outline_blank, size: 40,),
      title: Text("내 보험", style: TextStyle(fontSize: 12, color: Colors.grey),),
      subtitle: Text("괜찮은지 알아보기", style: TextStyle(fontSize: 18, color: Colors.black),),
    );
  }
}

class AddtionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("추가", style: TextStyle(fontSize: 20, color: Colors.grey),),
      trailing: Icon(Icons.add, size: 30, color: Colors.grey,),
    );
  }
}

String intToMoney(int price) {
  String value = price.toString();
  if (value.length > 2) {
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
  }
  return value;
}

// Widget _buildList() {
//
// }
