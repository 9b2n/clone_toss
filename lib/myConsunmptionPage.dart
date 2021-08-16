import 'package:flutter/material.dart';

class MyConsumption extends StatelessWidget {
  const MyConsumption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              expandedHeight: 80.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                title: Text("7월 내 소비"),
              ),
            )
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }
}
