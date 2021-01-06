import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  Size size;
  String _dropDownValue;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return loading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(150.0),
              child: Container(
                padding: MediaQuery.of(context).padding,
                color: Colors.green,
                child: ExpansionTile(
                  leading: Image.asset(
                    'assets/images/logo_solvace.png',
                    height: 20,
                  ),
                  trailing: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 34),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 12,
                        ),
                        underline: Container(),
                        hint: _dropDownValue == null
                            ? Row(
                          children: [
                            Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 12,
                            ),
                            Container(width: 5,),
                            Text(
                              'Curitiba',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        )
                            : Row(
                          children: [
                            Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 12,
                            ),
                            Container(width: 5,),
                            Text(
                              _dropDownValue,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12
                              ),
                            ),
                          ],
                        ),
                        isExpanded: true,
                        iconSize: 20.0,
                        style: TextStyle(color: Colors.black),
                        items: ['Curitiba'].map(
                              (val) {
                            return DropdownMenuItem<String>(
                                value: val,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.business,
                                      color: Colors.black54,
                                      size: 12,
                                    ),
                                    Container(width: 5,),
                                    Text(
                                      val,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                )
                              //Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _dropDownValue = val;
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 10,),
                      _boxOptions("LEADERSHIP", "assets/images/leadership.png", Colors.red, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("PEOPLE", "assets/images/leadership.png", Colors.green, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("AUTONOMOUS MANAGEMENT", "assets/images/leadership.png", Colors.red, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("PLANNED MAINTENCE", "assets/images/leadership.png", Colors.teal, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("FOCUS IMPROVEMENT", "assets/images/leadership.png", Colors.purple, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("EDUCATION & TRAINING", "assets/images/leadership.png", Colors.lime, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("WORK PROCESS IMPROVEMENT", "assets/images/leadership.png", Colors.teal, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("LEAN FLOW", "assets/images/leadership.png", Colors.lime, (){}),
                      SizedBox(height: 10,),
                      _boxOptions(" ", "assets/images/leadership.png", Colors.black, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("PROGRESSIVE QUALITY", "assets/images/leadership.png", Colors.orange, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("SAFETY AND ENVIROMENT", "assets/images/leadership.png", Colors.red, (){}),
                      SizedBox(height: 10,),
                      _boxOptions("EQUIPAMENT AND PRODUCT MANAGEMENT", "assets/images/leadership.png", Colors.purple[900], (){}),
                      SizedBox(height: 30,),
                      _boxOptions("MANAGEMENT", "assets/images/leadership.png", Colors.teal[900], (){}),
                      SizedBox(height: 10,),
                      _boxOptions("GLOBAL", "assets/images/leadership.png", Colors.green, (){}),
                      SizedBox(height: 10,),
                    ]
                  ),
                ),
              ],
            ),
          );
  }

  _boxOptions(String title, String image, Color color, Function onTap) {
    return GestureDetector(
      child: Container(
        color: color,
        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: MediaQuery.of(context).size.width * 0.35,
              child: Image.asset(
                image,
                height: 100,
                width: 100,
              ),
            ),
            Positioned(
              top: 130,
              left: 5,
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}