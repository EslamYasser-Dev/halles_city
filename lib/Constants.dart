import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';





const main_dark_color = Color(0xFF1A233F);

const main_light_color = Color(0xFF009EE2);

const light_gray_color = Color(0xFFF5F5F5);

final circularBorder = BorderRadius.circular(12.0);

final lightLogo = Image.asset('images/darkLogo.png');

const back_icon = Icon(
  Icons.arrow_back_ios,
  color: main_dark_color,
  size: 24.0,
);

const all_sides_padding = EdgeInsets.all(8.0);

const three_sides_padding = EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0);

const network_image1 = NetworkImage(
  'https://www.novisplaza.ro/wp-content/uploads/2019/10/DSC_2886-800x534.jpg',
);

const network_image2 = NetworkImage(
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE_z1WDzhA_WC4qSF0zrCa9q3-CezKtxSDfD_ZvqAoj9Sogsf0Qg&s',
);
const network_image3 = NetworkImage(
  'https://www.terraevents.ro/wp-content/uploads/2019/07/corporate12313221.jpg',
);
const darkLogo = AssetImage('images/darkLogo.png');
const card_backgrund = Color(0xFFe0e4e5);
const custom_divider = Padding(
  padding: const EdgeInsets.only(left: 10, right: 10),
  child: Divider(
    height: 0,
  ),
);