import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussniess/cubits/cubit/cubits_cubit.dart';
import 'package:news_app/constants/constatnts.dart';
import 'package:news_app/presentation/screens/search.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitsCubit, CubitsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CubitsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    CubitsCubit.get(context).changeDarkMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.teal,
            
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
            items: cubit.bottomVBINewsList,
          ),
        );
      },
    );
  }
}
