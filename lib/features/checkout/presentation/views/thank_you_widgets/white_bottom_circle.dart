import 'package:flutter/material.dart';

class WhiteBottomCircle extends StatelessWidget {
  final double xOffset;
  final double? right;
  const WhiteBottomCircle({
    super.key,
    required this.xOffset,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.15,
      right: right,
      child: FractionalTranslation(
        translation: Offset(xOffset, 0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
