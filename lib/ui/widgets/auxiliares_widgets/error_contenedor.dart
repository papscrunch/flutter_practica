import 'package:flutter/material.dart';


class ErrorContenedor extends StatelessWidget {
  const ErrorContenedor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
          child: Text(
        "Lo Sentimos hubo un error, intente de nuevo",
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }
}