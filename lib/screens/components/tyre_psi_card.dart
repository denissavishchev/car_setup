import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/typePsi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.isBottomTwoTyre,
    required this.tyrePsi,
  }) : super(key: key);

  final bool isBottomTwoTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        border: Border.all(
            color: tyrePsi.isLowPressure ? redColor : primaryColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tyrePsi.isLowPressure
                    ? lowPressureText(context)
                    : Container(),
                const Spacer(),
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(context, psi: tyrePsi.psi.toString()),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                tyrePsi.isLowPressure
                    ? lowPressureText(context)
                    : Container(),
              ],
            ),
    );
  }

  Column lowPressureText(BuildContext context) {
    return Column(
      children: const [
        Text(
          'LOW',
          style: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text(
          'PRESSURE',
          style: TextStyle(
              color: Colors.white54, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Text psiText(BuildContext context, {required String psi}) {
    return Text.rich(TextSpan(
        text: psi,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        children: const [
          TextSpan(
            text: 'psi',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          )
        ]));
  }
}
