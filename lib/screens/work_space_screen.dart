import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halles_city/UI_componants/circle_tab_indicator.dart';
import 'package:halles_city/UI_componants/get_netWork_image.dart';
import 'package:halles_city/UI_componants/hall_properties.dart';

import '../constants.dart' as constant;


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
        backgroundColor: constant.light_gray_color,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(

                floating: true,
                pinned: true,
                expandedHeight: 279,
                leading: IconButton(
                  icon: constant.back_icon,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(bottom: 47.0),
                    child: Column(
                      children: <Widget>[
                        CarouselSlider.builder(
                          viewportFraction: 1.0,
                          autoPlay: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int itemIndex) {
                            return Image(
                              image: itemIndex == 0
                                  ? constant.network_image2
                                  : constant.network_image3,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                backgroundColor: constant.light_gray_color,
                bottom: TabBar(
                  unselectedLabelColor: Colors.blueGrey,
                  labelColor: constant.main_dark_color,
                  indicator: CircleTabIndicator(
                      color: constant.main_light_color, radius: 3),
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 15
                  ),
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
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: constant.all_sides_padding,
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 27.0,
                                backgroundImage: constant.network_image1,
                                backgroundColor: Colors.transparent,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: constant.main_dark_color,
                                  size: 42.0,
                                  semanticLabel:
                                  'Text to announce in accessibility modes',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: <Widget>[
                              HallProperties.prepertyIcon(
                                iconName: Icons.wifi,
                                isEnabled: true,
                              ),
                              HallProperties.prepertyIcon(
                                  iconName: Icons.kitchen,
                                  isEnabled: false
                              ),
                              HallProperties.prepertyIcon(
                                iconName: Icons.local_drink,
                              ),
                              HallProperties.prepertyIcon(
                                iconName: Icons.wc,

                              ), Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding: constant.all_sides_padding,
                                child: RatingBar(
                                  itemSize: 22,
                                  initialRating: 3.5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(),
                                  itemBuilder: (context, _) =>
                                      Icon(
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
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                            property: 'Shared Area',
                            value: 'Available'
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                            property: 'Open Area',
                            value: 'Not Available'
                        ),
                        constant.custom_divider,
                      ],
                    ),
                  ),
                ),
              ),
              GridView.builder(
                  itemCount: 7,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Expanded(
                                    child: get_network_image(
                                      image: constant.network_image1,
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
        ),
      ),
    );
  }


}