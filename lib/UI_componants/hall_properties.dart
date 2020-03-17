import 'package:flutter/material.dart';

import '../constants.dart';

class HallProperties {
  // this func creates a new room property with the name and its value as Row
  static Widget creatHallproperty({String property, String value}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(property), Text(value)],
      ),
    );
  }

  static Widget prepertyIcon(
      {@required IconData iconName, bool isEnabled = false}) {
    return Padding(
      padding: all_sides_padding,
      child: Icon(
        iconName,
        color: isEnabled ? Colors.grey : main_light_color,
        size: 24.0,
      ),
    );
  }

  static Widget cusomButton({text, context, nextPage}) {
    return ClipRRect(
      borderRadius: circularBorder,
      child: MaterialButton(
        //setting a height of the button to fill the row height
        height: 50,
        color: main_light_color,
        // button color which is lighter than app bar
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        },
      ),
    );
  }
}
