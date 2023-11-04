
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data/cash/Cash_helper.dart';
import 'package:news_app/data/dio/dio_helper.dart';
import 'package:news_app/presentation/screens/business_screen.dart';
import 'package:news_app/presentation/screens/science_screen.dart';
import 'package:news_app/presentation/screens/sport_screen.dart';

part 'cubits_state.dart';

class CubitsCubit extends Cubit<CubitsState> {
  CubitsCubit() : super(CubitsInitial());

  static CubitsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomVBINewsList = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNav());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '1fa8a8274fd94f14badadf38da9dd335'
    }).then((value) {
      business = value.data['article'];
      if (kDebugMode) {
        print(business[0]['title']);
      }
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': '1fa8a8274fd94f14badadf38da9dd335'
    }).then((value) {
      sports = value.data['articles'];
      if (kDebugMode) {
        print(sports[0]['title']);
      }
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(path: 'v2/everything', query: {
      'q': value,
      'apikey': '1fa8a8274fd94f14badadf38da9dd335'
    }).then((value) {
      search = value.data['article'];
      if (kDebugMode) {
        print(search[0]['title']);
      }
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());

    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': '1fa8a8274fd94f14badadf38da9dd335'
    }).then((value) {
      science = value.data['articles'];
      if (kDebugMode) {
        print(science[0]['title']);
      }
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  bool isDark = false;
  void changeDarkMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;

      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      CashHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }
}
