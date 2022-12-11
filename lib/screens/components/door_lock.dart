import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.isLock,

  }) : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: AnimatedSwitcher(
          duration: defaultDuration,
          switchInCurve: Curves.easeInOutBack,
          transitionBuilder: (child, animation) =>
              ScaleTransition(
                scale: animation,
                child: child,),
          child: isLock
              ? SvgPicture.asset('assets/images/door_lock.svg',
            key: const ValueKey('lock'),)
              : SvgPicture.asset('assets/images/door_unlock.svg',
            key: const ValueKey('unlock'),),
        ));
  }
}