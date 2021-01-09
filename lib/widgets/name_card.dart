import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  final String title;

  const NameCard({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Expanded(
      child: Container(
        color: _theme.cardTheme.color,
        padding: const EdgeInsets.all(8.0),
        constraints: BoxConstraints(minWidth: 100.0),
        child: Center(
          child: Text(
            title,
            style: _theme.textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
