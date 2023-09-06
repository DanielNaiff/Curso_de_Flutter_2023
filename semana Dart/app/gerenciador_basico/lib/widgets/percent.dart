import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class PercenteIndicator extends StatefulWidget {
  final double contador;
  final int length;
  const PercenteIndicator(
      {super.key, required this.contador, required this.length});

  @override
  State<PercenteIndicator> createState() => _PercenteIndicatorState();
}

class _PercenteIndicatorState extends State<PercenteIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 15.0,
      percent: widget.contador / widget.length,
      center: Text("${((widget.contador / widget.length) * 100).round()}%"),
      progressColor: Colors.blue,
    );
  }
}
