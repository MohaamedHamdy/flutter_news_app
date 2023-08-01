import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeIndex(index);
            cubit.toggleNavIcon();
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(left: 50.0),
                // child: cubit.isToggle
                //     ? Icon(Icons.home)
                //     : Icon(Icons.home_outlined),
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              // icon: cubit.isToggle ? Icon(Icons.search) : Icon(Icons.saved_search_outlined),
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(right: 50.0),
                // child: cubit.isToggle
                //     ? Icon(Icons.person_2)
                //     : Icon(Icons.person_2_outlined),
                child: Icon(Icons.person_2),
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
