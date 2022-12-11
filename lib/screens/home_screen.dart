import 'dart:ffi';

import 'package:car/constants.dart';
import 'package:car/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/battery_status.dart';
import 'components/car_bottom_navigationbar.dart';
import 'components/door_lock.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animationBattery = CurvedAnimation(
        parent: _batteryAnimationController,
        curve: const Interval(0.0, 0.5));
    _animationBatteryStatus = CurvedAnimation(
        parent: _batteryAnimationController,
        curve: const Interval(0.6, 1));
  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([_controller, _batteryAnimationController]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: CarBottomNavigationBar(
              onTap: (index) {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_controller.selectedBottomTab == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }
                _controller.onBottomNavigationTabChange(index);
              },
              selectedTab: _controller.selectedBottomTab,
            ),
            backgroundColor: Colors.black,
            body: SafeArea(child: LayoutBuilder(builder: (context, constrains) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constrains.maxHeight * 0.1),
                    child: SvgPicture.asset(
                      'assets/images/Car.svg',
                      width: double.infinity,
                    ),
                  ),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isRightDoorLock,
                          press: _controller.updateRightDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isLeftDoorLock,
                          press: _controller.updateLeftDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.25
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isBonnetDoorLock,
                          press: _controller.updateBonnetDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedBottomTab == 0
                          ? constrains.maxWidth * 0.32
                          : constrains.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isTrunkDoorLock,
                          press: _controller.updateTrunkDoorLock,
                        ),
                      )),
                  Opacity(
                    opacity: _animationBattery.value,
                    child: SvgPicture.asset(
                      'assets/images/Battery.svg',
                      width: constrains.maxWidth * 0.45,
                    ),
                  ),
                  Positioned(
                    top: 50 * (1 - _animationBatteryStatus.value),
                    height: constrains.maxHeight,
                    width: constrains.maxWidth,
                    child: Opacity(
                      opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(constraints: constrains,)),
                  )
                ],
              );
            })),
          );
        });
  }
}

