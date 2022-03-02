import 'package:flutter/material.dart';

class ProgressIndicatorPersonal extends StatelessWidget {
  const ProgressIndicatorPersonal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const LinearProgressIndicator(
          backgroundColor: Colors.black,
        ));
  }
}
