import 'package:flutter/material.dart';
import 'package:flutter_media_markt/domain/entities/page_params.dart';
import 'package:flutter_media_markt/presentation/arguments/filter_arguments.dart';

class FilterSettingsPage extends StatefulWidget {
  final SortType sortType;
  final StateType stateType;

  const FilterSettingsPage({Key key, this.sortType, this.stateType})
      : super(key: key);

  @override
  _FilterSettingsPageState createState() => _FilterSettingsPageState();
}

class _FilterSettingsPageState extends State<FilterSettingsPage> {
  SortType _sortType;
  StateType _stateType;

  @override
  void initState() {
    super.initState();
    _sortType = this.widget.sortType;
    _stateType = this.widget.stateType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'State',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            CheckboxListTile(
              title: Text('Open'),
              value: this._stateType == StateType.open,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: this._sortType == SortType.comments
                  ? null
                  : (bool value) {
                      if (value) {
                        this._stateType = StateType.open;
                      } else {
                        this._stateType = null;
                      }
                      setState(() {});
                    },
            ),
            CheckboxListTile(
              title: Text('Closed'),
              value: this._stateType == StateType.closed,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: this._sortType == SortType.comments
                  ? null
                  : (bool value) {
                      if (value) {
                        this._stateType = StateType.closed;
                      } else {
                        this._stateType = null;
                      }
                      setState(() {});
                    },
            ),
            CheckboxListTile(
              title: Text('All'),
              value: this._stateType == StateType.all,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: this._sortType == SortType.comments
                  ? null
                  : (bool value) {
                      if (value) {
                        this._stateType = StateType.all;
                      } else {
                        this._stateType = null;
                      }
                      setState(() {});
                    },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Sort',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            CheckboxListTile(
              title: Text('Created'),
              value: this._sortType == SortType.created,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                if (value) {
                  this._sortType = SortType.created;
                } else {
                  this._sortType = null;
                }
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('Updated'),
              value: this._sortType == SortType.updated,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                if (value) {
                  this._sortType = SortType.updated;
                } else {
                  this._sortType = null;
                }
                setState(() {});
              },
            ),
            CheckboxListTile(
              title: Text('Comments'),
              value: this._sortType == SortType.comments,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool value) {
                if (value) {
                  this._sortType = SortType.comments;
                  this._stateType = null;
                } else {
                  this._sortType = null;
                }
                setState(() {});
              },
            ),
            Center(
              child: RaisedButton(
                child: Text('Search'),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pop(
                  context,
                  FilterArguments(
                    stateType: this._stateType,
                    sortType: this._sortType,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
