import 'package:equatable/equatable.dart';
import 'package:flutter_media_markt/data/models/user_model.dart';

class IssuesModel extends Equatable {
  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final User user;
  final String state;
  final bool locked;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime closedAt;
  final String authorAssociation;
  final String body;

  IssuesModel({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.state,
    this.locked,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.body,
  });

  factory IssuesModel.fromJson(Map<String, dynamic> json) {
    return IssuesModel(
      url: json['url'],
      repositoryUrl: json['repository_url'],
      labelsUrl: json['labels_url'],
      commentsUrl: json['comments_url'],
      eventsUrl: json['events_url'],
      htmlUrl: json['html_url'],
      id: json['id'],
      nodeId: json['node_id'],
      number: json['number'],
      title: json['title'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      state: json['state'],
      locked: json['locked'],
      comments: json['comments'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      closedAt:
          json['closed_at'] != null ? DateTime.parse(json['closed_at']) : null,
      authorAssociation: json['author_association'],
      body: json['body'],
    );
  }

  @override
  List<Object> get props => [
        this.url,
        this.repositoryUrl,
        this.labelsUrl,
        this.commentsUrl,
        this.eventsUrl,
        this.htmlUrl,
        this.id,
        this.nodeId,
        this.number,
        this.title,
        this.user,
        this.state,
        this.locked,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.closedAt,
        this.authorAssociation,
        this.body,
      ];
}
