import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_media_markt/di/get_it.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';
import 'package:flutter_media_markt/presentation/arguments/filter_arguments.dart';
import 'package:flutter_media_markt/presentation/blocs/issues/issues_bloc.dart';
import 'package:flutter_media_markt/presentation/views/filter_settings_page.dart';
import 'package:flutter_media_markt/presentation/views/settings_page.dart';
import 'package:flutter_media_markt/presentation/widgets/bottom_loader.dart';
import 'package:flutter_media_markt/presentation/widgets/custom_error_widget.dart';
import 'package:flutter_media_markt/presentation/widgets/issues_list_widget.dart';
import 'package:flutter_media_markt/presentation/widgets/loading_widget.dart';

class IssuesListPage extends StatefulWidget {
  @override
  _IssuesListPageState createState() => _IssuesListPageState();
}

class _IssuesListPageState extends State<IssuesListPage> {
  IssuesBloc _issuesBloc;
  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    this._issuesBloc = getItInstance<IssuesBloc>();
    this._issuesBloc.add(LoadIssues(stateType: StateType.all));
    this._scrollController.addListener(this._loadOnScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _issuesBloc?.close();
  }

  void _loadOnScroll() {
    if (_scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        _scrollThreshold) {
      this._issuesBloc.add(
            LoadMore(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter issues'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final currentState = this._issuesBloc.state;
              StateType stateType;
              SortType sortType;

              if (currentState is IssuesLoadedState) {
                stateType = currentState.stateType;
                sortType = currentState.sortType;
              }

              final FilterArguments filterArguments = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterSettingsPage(
                    stateType: stateType,
                    sortType: sortType,
                  ),
                ),
              );

              if (filterArguments != null) {
                this._issuesBloc.add(
                      LoadIssues(
                        stateType: filterArguments.stateType,
                        sortType: filterArguments.sortType,
                      ),
                    );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider<IssuesBloc>(
        create: (_) => this._issuesBloc,
        child: BlocBuilder<IssuesBloc, IssuesState>(
          builder: (context, state) {
            if (state is IssuesErrorState) {
              return CustomErrorWidget(
                appError: state.appError,
                onPressed: () => this._issuesBloc.add(LoadIssues()),
              );
            } else if (state is IssuesLoadedState) {
              return ListView.builder(
                itemCount: state.hasReachedMax
                    ? state.issues.length
                    : state.issues.length + 1,
                controller: this._scrollController,
                itemBuilder: (context, index) => index >= state.issues.length
                    ? BottomLoader()
                    : IssuesListWidget(
                        issuesModel: state.issues[index],
                      ),
              );
            }

            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
