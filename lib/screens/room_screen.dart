import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halles_city/UI_componants/hall_properties.dart';
import 'package:halles_city/models/room.dart';

import '../constants.dart' as constant;

class RoomScreen extends StatefulWidget {
  // intializing a new room a defualt one
  Room roomData = Room(
      hasAirCondition: true,
      hasBoard: true,
      hasDataShow: true,
      hasSoundSystem: true,
      name: 'Room name',
      numberOfChairs: 5,
      numOfTables: 0,
      pricePerhoure: 50,
      imagesPath: [
        constant.network_image1,
        constant.network_image2,
        constant.network_image3
      ]
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
                  child: Container(
                    child: CarouselSlider.builder(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      itemCount: widget.roomData.imagesPath.length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return Image(
                          image: widget.roomData.imagesPath[itemIndex],
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 2, bottom: 1),
                                child: Text(
                                  '${widget.roomData.pricePerhoure}\$/hr',
                                  style: TextStyle(color: Colors.black54),
                                ),
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
                        HallProperties.creatHallproperty(
                          property: 'Number Of chairs',
                          value: widget.roomData.numberOfChairs.toString(),
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Tables',
                          value: widget.roomData.numOfTables == 0
                              ? 'Not Available'
                              : widget.roomData.numOfTables.toString(),
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                            property: 'Board',
                            value: widget.roomData.hasBoard
                                ? 'Avilable'
                                : 'Not Available'),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Screen/Data Show ',
                          value: widget.roomData.hasDataShow
                              ? 'Available'
                              : 'Not Available',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Sound System',
                          value: widget.roomData.hasSoundSystem
                              ? 'Avialble'
                              : 'not Available',
                        ),

                        constant.custom_divider,
                        HallProperties.creatHallproperty(
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
                      //Calling a static custombutton func with class name(HallProperties)
                        child: HallProperties.cusomButton(
                            context: this.context,
                            //setting the current context whitch we are working in
                            text: 'Rent Now' //the text of the putton
                        )
                    ),
                    // a toggle favourite button
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      color: likeColor,
                      onPressed: () {
                        setState(() {
                          isEnabled
                              ? {likeColor = Colors.grey, isEnabled = false}
                              : {likeColor = Colors.red[700], isEnabled = true};
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


}
