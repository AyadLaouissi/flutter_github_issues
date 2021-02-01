import 'package:flutter/material.dart';
import 'package:flutter_media_markt/data/models/issues_model.dart';
import 'package:intl/intl.dart';

class IssuesDetailPage extends StatelessWidget {
  final IssuesModel issuesModel;

  const IssuesDetailPage({
    Key key,
    @required this.issuesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.issuesModel.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  '${this.issuesModel.user.avatarUrl}',
                ),
              ),
              title: Text('${this.issuesModel.user.login}'),
              subtitle: Text(
                'Created ${DateFormat.yMMMd().format(this.issuesModel.createdAt)}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 20.0,
              ),
              child: Text('${issuesModel.body}'),
            ),
          ],
        ),
      ),
    );
  }
}
