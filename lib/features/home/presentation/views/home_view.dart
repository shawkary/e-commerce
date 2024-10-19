import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/category_view/category_view.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/favorite_view/favorite_view.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/product_view/product_view.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/settings_view/settings_view.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    int currentIndex = 0;
    List<Widget> screens = [
      const ProductView(),
      const CategoryView(),
      const FavoriteView(),
      const SettingsView(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(label: 'Product', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Category', icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
        ],),
    );
  }
}
