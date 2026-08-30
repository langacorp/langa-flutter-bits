import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VerticalToggleSwitch extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double iconSize;
  final IconData iconOn;
  final IconData iconOff;
  final Color bgColor;
  final Color offColor;
  final Color iconOnColor;
  final Color iconOffColor;
  final EdgeInsets iconPadding;

  VerticalToggleSwitch({
    this.width = 40,
    this.height = 80,
    this.borderRadius = 20,
    this.iconSize = 30,
    this.iconOn = CupertinoIcons.phone,
    this.iconOff = CupertinoIcons.envelope,
    this.bgColor = Colors.blueAccent,
    this.offColor = Colors.grey,
    this.iconOnColor = Colors.white,
    this.iconOffColor = Colors.white,
    this.iconPadding = const EdgeInsets.all(5),
  });

  @override
  _VerticalToggleSwitchState createState() => _VerticalToggleSwitchState();
}

class _VerticalToggleSwitchState extends State<VerticalToggleSwitch> {
  bool isOn = false;

  void toggleSwitch() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSwitch,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          alignment: isOn ? Alignment.topCenter : Alignment.bottomCenter,
          children: [
            Padding(
              padding: widget.iconPadding,
              child: Icon(
                isOn ? widget.iconOn : widget.iconOff, // Change the icon based on the toggle state
                size: widget.iconSize, // Adjust the icon size
                color: isOn ? widget.iconOnColor : widget.iconOffColor, // Adjust the icon color
              ),
            ),
          ],
        ),
      ),
    );
  }
}