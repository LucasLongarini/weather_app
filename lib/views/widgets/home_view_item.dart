import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff39AFF1), Color(0xff78CEFF)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Las Vegas",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white)),
              SizedBox(height: 4),
              Text("Sunny",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white)),
              SizedBox(height: 8),
              Text("27°",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(color: Colors.white)),
            ],
          ),
          Container(
            child: SvgPicture.asset("assets/weather_icons/Sunny.svg"),
            transform: Matrix4.translationValues(0.0, -40, 0),
          )
        ],
      ),
    );
  }
}
