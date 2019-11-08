import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final Color color;

  AppSlider({this.onChanged, this.color = Colors.green});

  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: widget.color,
          inactiveTrackColor: Colors.grey,
          thumbColor: widget.color),
      child: Slider(
        value: sliderValue,
        onChanged: (value) {
          print("Silder on change: $value");
          widget.onChanged(value);
          setState(
            () {
              sliderValue = value;
            },
          );
        },
      ),
    );
  }
}
