import 'package:flutter/material.dart';
import 'package:cactus/data.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      title: 'Cactus',
      theme: ThemeData(fontFamily: 'Joane Stencil'),
      home: CactusHome(),
    ));

class CactusHome extends StatefulWidget {
  @override
  _CactusHomeState createState() => _CactusHomeState();
}

class _CactusHomeState extends State<CactusHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFF1F1F6), Color(0xFFFFFF)],
              stops: [0.25, 0.25]),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => debugPrint('menu clicked'),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageIcon(AssetImage('images/menu-icon.png')),
                    ),
                  ),
                  InkWell(
                    onTap: () => debugPrint('search clicked'),
                    customBorder: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(9.0),
                      child: ImageIcon(AssetImage('images/search-icon.png')),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Cactus',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text('For Home', style: TextStyle(fontSize: 40))
                ],
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 15.0),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final double leftPadding = index == 0 ? 50.0 : 15.0;
                      return Container(
                        margin:
                            EdgeInsets.fromLTRB(leftPadding, 10.0, 15.0, 10.0),
                        child: SizedBox(
                          width: 200.0,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0),
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Image.asset(
                                        data[index]['image'],
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .33,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.0,
                                    ),
                                    Text(
                                      '\$ ${data[index]['price']}',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Text('${data[index]['name']}',
                                        style: TextStyle(fontSize: 18.0)),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomLeft,
                                        margin: EdgeInsets.only(bottom: 15.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text('Buy Now',
                                                style:
                                                    TextStyle(fontSize: 18.0)),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.0),
                                              width: 30.0,
                                              height: 2.0,
                                              color: Colors.grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            )),
            SafeArea(
              child: SizedBox(
                height: 50.0,
                child: DefaultTabController(
                    length: 3,
                    child: Theme(
                      data: ThemeData(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent),
                      child: TabBar(
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          labelPadding: EdgeInsets.only(bottom: 10.0),
                          indicator: BoxDecoration(
                              gradient: RadialGradient(
                                  colors: [
                                    Colors.black45,
                                    Colors.black45,
                                    Colors.transparent
                                  ],
                                  center: Alignment(.0, .8),
                                  radius: .1,
                                  tileMode: TileMode.clamp,
                                  stops: [0.3, 0.5, 0.7])),
                          tabs: [
                            Tab(
                              text: 'Popular',
                            ),
                            Tab(
                              text: 'Newest',
                            ),
                            Tab(
                              text: 'Latest',
                            )
                          ]),
                    )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
