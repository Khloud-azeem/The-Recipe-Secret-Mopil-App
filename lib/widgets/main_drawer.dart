import 'package:flutter/material.dart';
// import 'package:recipes_secrests/screens/favourites_screen.dart';
import 'package:recipes_secrests/screens/filters_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  void _tabHandler(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  Widget _buildListTile(String title, IconData icon, tabHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Robotocondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          _buildListTile(
            'Meals',
            Icons.restaurant,
            () => _tabHandler(context, '/'),
          ),
          _buildListTile(
            'Filters',
            Icons.settings,
            () => _tabHandler(context, FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
//pass data from pop an retreive it in push by then, not when youre done pushing but when that page it removed/poped
