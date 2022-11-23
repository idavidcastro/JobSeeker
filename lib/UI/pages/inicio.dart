import 'package:flutter/material.dart';

class PageInicio extends StatefulWidget {
  const PageInicio({Key? key}) : super(key: key);

  @override
  State<PageInicio> createState() => _PageInicioState();
}

class _PageInicioState extends State<PageInicio> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de incio'),
    );
  }
}
