import 'package:car/screens/components/tmp_btn.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../home_controller.dart';

class TempDetails extends StatefulWidget {
  TempDetails({
    Key? key,
    required HomeController controller,
  }) : _controller = controller, super(key: key);

  final HomeController _controller;

  @override
  State<TempDetails> createState() => _TempDetailsState();
}

class _TempDetailsState extends State<TempDetails> {
  var temperature = 29;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                    isActive: widget._controller.isCoolSelected,
                    svgSrc: 'assets/images/coolShape.svg',
                    title: 'COOL',
                    press: widget._controller.updateCoolSelectedTab
                ),
                const SizedBox(width: defaultPadding,),
                TempBtn(
                    isActive: !widget._controller.isCoolSelected,
                    svgSrc: 'assets/images/heatShape.svg',
                    title: 'HEAT',
                    activeColor: redColor,
                    press: widget._controller.updateCoolSelectedTab
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      temperature++;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_up, size: 40, color: Colors.white,)),
              Text('$temperature\u2103', style: TextStyle(fontSize: 86, color: Colors.white),),
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      temperature--;
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down, size: 40, color: Colors.white)),
            ],
          ),

          const Spacer(),
          const Text('CURRENT TEMPERATURE', style: TextStyle(fontSize: 16, color: Colors.white),),
          const SizedBox(height: defaultPadding,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('INSIDE', style: TextStyle(fontSize: 16, color: Colors.white),),
                  Text('20''\u2103', style: TextStyle(fontSize: 20, color: Colors.white),)
                ],
              ),
              const SizedBox(width: defaultPadding,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('OUTSIDE', style: TextStyle(fontSize: 16, color: Colors.white54),),
                  Text('35''\u2103', style: TextStyle(fontSize: 20, color: Colors.white54),)
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}

