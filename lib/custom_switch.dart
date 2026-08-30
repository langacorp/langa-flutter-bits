import 'package:flutter/material.dart';


class CustomSwitch extends StatefulWidget {
  bool isSwitched;
  final VoidCallback ontap;
  final Color trackColor;
  final Color knobColor;

  CustomSwitch({
    super.key,
    required this.isSwitched,
    required this.ontap,
    this.trackColor = const Color(0xFF1D3557),
    this.knobColor = const Color(0xFFF37F0D),
  });
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.white, width: 1),
          color: widget.isSwitched
              ? widget.trackColor
              : widget.trackColor,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              left: widget.isSwitched ? 30.0 : 0.0,
              right: widget.isSwitched ? 0.0 : 30.0,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: widget.isSwitched
                      ? Container(
                          height: 27,
                          width: 27,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: widget.knobColor),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 21.0,
                            key: UniqueKey(),
                          ),
                        )
                      : Container(
                          height: 27,
                          width: 27,
                          padding: const EdgeInsets.all(1.1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: widget.knobColor),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 21.0,
                            key: UniqueKey(),
                          ),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
