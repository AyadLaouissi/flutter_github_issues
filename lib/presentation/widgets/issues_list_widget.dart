import 'package:flutter/material.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:flutter_media_markt/presentation/views/issues_detail_page.dart';

class IssuesListWidget extends StatelessWidget {
  final IssuesModel issuesModel;

  const IssuesListWidget({Key key, @required this.issuesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${issuesModel.title}'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IssuesDetailPage(
            issuesModel: this.issuesModel,
          ),
        ),
      ),
    );
  }
}
