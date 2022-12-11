import 'package:flutter/material.dart';

import '../../constants.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key, required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('220 mi', style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),),
        const Text('62%', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        const Spacer(),
        Text('Charging'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        const Text('18 min remaining', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        SizedBox(height: constraints.maxHeight * 0.14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('22 mi/hr', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Text('232 v', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: defaultPadding,),
      ],
    );
  }
}
