import 'package:flutter/material.dart';
import 'package:flutter_media_markt/domain/entities/app_error.dart';

class CustomErrorWidget extends StatelessWidget {
  final AppError appError;
  final VoidCallback onPressed;

  const CustomErrorWidget({
    Key key,
    @required this.appError,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('${appError.message}'),
          ),
          RaisedButton(
            child: Text('Retry'),
            color: Theme.of(context).primaryColor,
            onPressed: this.onPressed,
          ),
        ],
      ),
    );
  }
}
