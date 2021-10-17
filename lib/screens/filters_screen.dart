import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({Key? key}) : super(key: key);

  static const routeName = 'filters';
  final Function saveFilters;
  final Filters _filters;

  FiltersScreen(this._filters ,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // var _glutenFree = false;
  // var _vegetarian = false;
  // var _vegan = false;
  // var _lactooseFree = false;

  

  Widget buildSwitchListTile(
      String title, bool currentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              widget.saveFilters(widget._filters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  'Gluten-Free',
                  widget._filters.isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        widget._filters.isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Lactose-Free',
                  widget._filters.isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        widget._filters.isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  widget._filters.isVegiterian,
                  (newValue) {
                    setState(
                      () {
                        widget._filters.isVegiterian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  widget._filters.isVegan,
                  (newValue) {
                    setState(
                      () {
                        widget._filters.isVegan = newValue;
                      },
                    );
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
