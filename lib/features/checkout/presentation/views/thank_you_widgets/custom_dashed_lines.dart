import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDashedLines extends StatelessWidget {
  const CustomDashedLines({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.sizeOf(context).height * 0.25,
      child: FractionalTranslation(
        translation: Offset(0, -8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: List.generate(50, (index) {
              return Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Color(0xFFB7B7B7)
                          : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
