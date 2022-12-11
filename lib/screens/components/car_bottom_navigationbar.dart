import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class CarBottomNavigationBar extends StatelessWidget {
  const CarBottomNavigationBar({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedTab,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: List.generate(
            navIconSrc.length,
                (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(navIconSrc[index],
                  color: index == selectedTab ? primaryColor : Colors.white54,),
                label: ''))
    );
  }
}

List <String> navIconSrc = [
  'assets/images/Lock.svg',
  'assets/images/Charge.svg',
  'assets/images/Temp.svg',
  'assets/images/Tyre.svg',
];
