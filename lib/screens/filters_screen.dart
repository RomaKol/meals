import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  void initState() {
    this._glutenFree = widget.currentFilters['glutenFree'];
    this._lactoseFree = widget.currentFilters['lactoseFree'];
    this._vegetarian = widget.currentFilters['vegetarian'];
    this._vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    bool value,
    String title,
    String subtitle,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'glutenFree': this._glutenFree,
                'lactoseFree': this._lactoseFree,
                'vegetarian': this._vegetarian,
                'vegan': this._vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  this._glutenFree,
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  (newValue) {
                    setState(() {
                      this._glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  this._vegetarian,
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  (newValue) {
                    setState(() {
                      this._vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  this._vegan,
                  'Vegan',
                  'Only include vegan meals.',
                  (newValue) {
                    setState(() {
                      this._vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  this._lactoseFree,
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  (newValue) {
                    setState(() {
                      this._lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
