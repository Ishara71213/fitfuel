import 'package:fitfuel/config/theme/theme_const.dart';
import 'package:flutter/material.dart';

class SliderBarWithLabel extends StatefulWidget {
  final ValueChanged<double> onChangeCallBack;
  final double currentValue;
  final double maxValue;
  final String labelSufixMetrics;
  final int steps;
  final String label;

  const SliderBarWithLabel({
    super.key,
    required this.onChangeCallBack,
    required this.label,
    this.labelSufixMetrics = "",
    this.steps = 0,
    this.maxValue = 100,
    this.currentValue = 0,
  });

  @override
  State<SliderBarWithLabel> createState() => _SliderBarWithLabelState();
}

class _SliderBarWithLabelState extends State<SliderBarWithLabel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: kInputFieldText,
              ),
              Text(
                "${widget.currentValue.round().toString()}${widget.labelSufixMetrics}",
                style: kInputFieldText,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SliderTheme(
          data: SliderThemeData(
            valueIndicatorTextStyle: TextStyle(
              color: DarkTheme.inputBoxTextColor, // Adjust label text color
            ),
          ),
          child: Slider(
            value: widget.currentValue,
            max: widget.maxValue,
            divisions: widget.steps != 0 ? widget.steps : null,
            activeColor: DarkTheme.kPrimaryColor,
            inactiveColor: DarkTheme.kDarkGreyShade,
            label: widget.currentValue.round().toString(),
            onChanged: widget.onChangeCallBack,
          ),
        ),
      ],
    );
  }
}
