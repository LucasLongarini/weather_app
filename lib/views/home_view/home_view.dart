import 'package:flutter/material.dart';

import '../../config/themes.dart';
import './widgets/home_view_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titleStyle =
        Theme.of(context).textTheme.headline3.copyWith(color: Themes.boldText);

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(left: 32, right: 32),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text("Current Location", style: titleStyle),
                  SizedBox(height: 8),
                  HomeViewItem(),
                  SizedBox(height: 40),
                  Text("Saved Locations", style: titleStyle),
                  SizedBox(height: 8),
                  HomeViewItem(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
