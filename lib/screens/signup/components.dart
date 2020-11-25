import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {

  FieldTitle({this.title, this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 3.0, bottom: 4.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        
        children: [
          Text(
            '$title  ',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16.0,
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    )
    ;
  }
}
