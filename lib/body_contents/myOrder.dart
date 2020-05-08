import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return Column(
      children: <Widget>[
        SizedBox(height: 100),
        Row(
          children: <Widget>[
            Icon(
              LineAwesomeIcons.arrow_left, size: 30,
            ),
          ],
        ),
      ],
    );
  }
}

