import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  const CardWidget({
    Key key,
    @required this.title,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Material(
          color: color,
          elevation: 2.0,
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: Text(
                title,
                style: _textTheme.headline4.apply(fontWeightDelta: 4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
