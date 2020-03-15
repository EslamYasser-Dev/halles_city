import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halles_city/models/room.dart';
import 'package:halles_city/screens/work_space_screen.dart';

import '../constants.dart' as constant;

class RoomScreen extends StatefulWidget {
  Room roomData = Room(
    hasAirCondition: true,
    hasBoard: true,
    hasDataShow: true,
    hasSoundSystem: true,
    name: 'Room name',
    numberOfChairs: 5,
    numOfTables: 0,
    pricePerhoure: 50,
  );

  RoomScreen();

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  // these two variable are used to toggle favourite button
  bool isEnabled = false; // this to store the state of the button
  Color likeColor = Colors.grey; // and this to store buuton color

  @override
  Widget build(BuildContext context) {
    // to prvent myself from overriding on notification bar
    return SafeArea(
      // the largest widget of material app which contains all other widgets
      child: Scaffold(
        backgroundColor: constant.light_gray_color,
        // creating an app bar
        appBar: AppBar(
          //setting a color for the app bar
          backgroundColor: constant.main_light_color,
          // creating back button at leading
          leading: IconButton(
            // back_icon is aconstant value
            icon: constant.back_icon,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // adding the logo to the flexible space of abb par
          flexibleSpace: Padding(
            padding: constant.all_sides_padding,
            child: Image(
              image: constant.darkLogo,
            ),
          ),
        ),
        // insering all widgets inside a single scroll view to make the scrollable
        body: SingleChildScrollView(
          //all my widgerts will be assigne into a column
          child: Column(
            children: <Widget>[
              //adding a constant pading to the image
              Padding(
                padding: constant.three_sides_padding,
                //making the image border curvy not hard
                child: ClipRRect(
                    borderRadius: constant.circularBorder,
                    child: constant.test_image),
              ),
              // adding pading to the hall details box
              Padding(
                padding: constant.three_sides_padding,
                //maling the box curvey
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  //inserting the column od hall preperties to enable me to change background color
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: constant.all_sides_padding,
                          // creating a row containing room name and price per hour
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.roomData.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: constant.main_dark_color),
                              ),
                              Text(
                                '${widget.roomData.pricePerhoure}\$/hr',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                        ),

                        // a divider with a diffrent padding under room name
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: Divider(
                            height: 0,
                          ),
                        ),

                        // creating all room properties by func creatHallproperty with its two properties
                        // and a custom divider befor each property
                        creatHallproperty(
                          property: 'Number Of chairs',
                          value: widget.roomData.numberOfChairs.toString(),
                        ),
                        constant.custom_divider,
                        creatHallproperty(
                          property: 'Tables',
                          value: widget.roomData.numOfTables == 0
                              ? 'Not Available'
                              : widget.roomData.numOfTables.toString(),
                        ),
                        constant.custom_divider,
                        creatHallproperty(
                            property: 'Board',
                            value: widget.roomData.hasBoard
                                ? 'Avilable'
                                : 'Not Available'),
                        constant.custom_divider,
                        creatHallproperty(
                          property: 'Screen/Data Show ',
                          value: widget.roomData.hasDataShow
                              ? 'Available'
                              : 'Not Available',
                        ),
                        constant.custom_divider,
                        creatHallproperty(
                          property: 'Sound System',
                          value: widget.roomData.hasSoundSystem
                              ? 'Avialble'
                              : 'not Available',
                        ),

                        constant.custom_divider,
                        creatHallproperty(
                          property: 'Air condition',
                          value: widget.roomData.hasAirCondition
                              ? 'Available'
                              : 'not Available',
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Rent now Button in a padding widget
              Padding(
                padding: constant.all_sides_padding,
                // the row consists of two widgets
                //the button and favourite button
                child: Row(
                  children: <Widget>[
                    // putting the button into an expanded widget to fill the
                    // residual space inside the row
                    Expanded(
                      //cliping the button edges with a common radius in the app which is circularBorder
                      child: ClipRRect(
                        borderRadius: constant.circularBorder,
                        child: MaterialButton(
                          //setting a height of the button to fill the row height
                          height: 50,
                          color: Color(0xCA009EE2),
                          // button color which is lighter than app bar
                          child: Text('Rent Now'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkSpaceScreen()));
                          },
                        ),
                      ),
                    ),
                    // a toggle favourite button
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      color: likeColor,
                      onPressed: () {
                        setState(() {
                          isEnabled
                              ? {likeColor = Colors.grey, isEnabled = false}
                              : {likeColor = Colors.red, isEnabled = true};
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this func creates a new room property with the name and its value
  Widget creatHallproperty({String property, String value}) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text(property), Text(value)],
        ));
  }
}
