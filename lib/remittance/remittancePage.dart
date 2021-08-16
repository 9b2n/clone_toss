import 'package:clone_toss/remittance/accountPage.dart';
import 'package:clone_toss/remittance/freeRemittancePage.dart';
import 'package:clone_toss/remittance/recommendPage.dart';
import 'package:flutter/material.dart';

class Remittance extends StatefulWidget {
  const Remittance({Key? key}) : super(key: key);

  @override
  _Remittance createState() => _Remittance();
}

class _Remittance extends State<Remittance>
    with SingleTickerProviderStateMixin {
  late TabController ctr;

  int _currentIndex = 0;

  final tabs = [Recommended(), AccountPage(), FreeRemittancePage()];

  @override
  void initState() {
    super.initState();
    ctr = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarTextStyle: TextStyle(),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Text(
              "누구에게 송금할까요?          ",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50)),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade300, width: 4.0),
                    color: Colors.white),
                controller: ctr,
                tabs: <Tab>[
                  Tab(
                    child: Text("추천"),
                  ),
                  Tab(
                    child: Text("계좌"),
                  ),
                  Tab(
                    child: Text("무료송금"),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                children: tabs,
                controller: ctr,
              ),
            )
          ],
        ));
  }
}
