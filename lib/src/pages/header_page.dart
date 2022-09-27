import 'package:curso_desing_1_headear/src/widgets/header.dart';
import 'package:flutter/material.dart';


class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body:HeaderDiagonal(),
    );
  }
}