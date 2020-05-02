import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // SafeArea wirget para respetar los notch o agujeros en pantalla
      body: SafeArea(
        child: Text('Hola mundo!!!!')
        ),
    );
  }
}