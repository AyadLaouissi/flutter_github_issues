import 'package:flutter/material.dart';
import 'package:flutter_media_markt/presentation/widgets/loading_widget.dart';

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: LoadingWidget(),
    );
  }
}
