import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants.dart';


class WorkSpaceScreen extends StatefulWidget {
  @override
  _WorkSpaceScreenState createState() => _WorkSpaceScreenState();
}

class _WorkSpaceScreenState extends State<WorkSpaceScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 322,
              leading: IconButton(
                icon: back_icon,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Column(
                  children: <Widget>[
                    Image.network(
                      'https://www.novisplaza.ro/wp-content/uploads/2019/10/DSC_2886-800x534.jpg',
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : Container(
                                height: 140,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.indigo),
                                  ),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
              pinned: true,
              floating: true,
              backgroundColor: main_light_color,
              bottom: TabBar(
                unselectedLabelColor: Colors.blueGrey[500],

                tabs: <Widget>[
                  Tab(
                    text: 'Details',
                  ),
                  Tab(
                    text: 'Rooms',
                  ),
                ],
                controller: _tabController,
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        color: Colors.black12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
//                        mainAxisAlignment: MainAxisAlignment.valu,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CircleAvatar(
                                    radius: 27.0,
                                    backgroundImage: NetworkImage(
                                        "https://greendestinations.org/wp-content/uploads/2019/05/avatar-exemple.jpg"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Work  Space name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18, top: 6),
                                      child: Text('Catigory'),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.location_on,
                                    color: main_dark_color,
                                    size: 42.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.wifi,
                                      color: Colors.black,
                                      size: 24.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.kitchen,
                                      color: Colors.black,
                                      size: 24.0,
                                      semanticLabel:
                                          'Text to announce in accessibility modes',
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RatingBar(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                      itemCount: 7,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Image.network(
                                        'https://www.novisplaza.ro/wp-content/uploads/2019/10/DSC_2886-800x534.jpg',
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, progress) {
                                          return progress == null
                                              ? child
                                              : Container(
                                                  height: 150,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.indigo),
                                                    ),
                                                  ),
                                                );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        Colors.black,
                                        Colors.transparent
                                      ])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Room 1',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text(
                                        '30\$/hr',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
