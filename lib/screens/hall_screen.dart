import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:halles_city/UI_componants/hall_properties.dart';
import 'package:halles_city/constants.dart' as constant;

class HallScreen extends StatefulWidget {

  // intializing a new room a defualt one


  @override
  _HallScreenState createState() => _HallScreenState();
}

class _HallScreenState extends State<HallScreen> {

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
                    color: constant.card_backgrund,
                    child: CarouselSlider.builder(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return Image(
                          image: constant.network_image3,
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
                                      'Hall name',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 4),
                                    child: Text('Events'),
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
                                isEnabled: false,
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
                      ],
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
                                'Properties',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: constant.main_dark_color),
                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(left:2.0,bottom: 1),
//                                child: Text(
//                                  '${widget.roomData.pricePerhoure}\$/hr',
//                                  style: TextStyle(color: Colors.black54),
//                                ),
//                              )
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
                          property: 'Price',
                          value: '500\$/day',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Number Of chairs',
                          value: '5',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Chairs Level',
                          value: 'amphitheater/OneLevel',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                            property: 'Tables',
                            value: 'Not Available'
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                            property: 'Stage',
                            value: 'Avilable'
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Scenes',
                          value: 'Not Available',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Screen/Data Show ',
                          value: 'Available',
                        ),
                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Sound System',
                          value: 'Avialble',
                        ),

                        constant.custom_divider,
                        HallProperties.creatHallproperty(
                          property: 'Air condition',
                          value: 'not Available',
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
                        child: HallProperties.cusomButton(
                            context: this.context,
                            text: 'Rent Now'
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