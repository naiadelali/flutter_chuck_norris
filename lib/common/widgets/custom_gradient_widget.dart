import 'package:flutter/material.dart';

class CustomGradientWidget extends StatelessWidget {
  final List<Color>? colors;
  const CustomGradientWidget({
    Key? key,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              colors ?? [Colors.white, Theme.of(context).colorScheme.primary],
          stops: [0.0, 0.9],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
