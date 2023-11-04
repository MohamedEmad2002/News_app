import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussniess/cubits/cubit/cubits_cubit.dart';
import 'package:news_app/data/dio/dio_helper.dart';
import 'package:news_app/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CubitsCubit()
            ..business
            ..science
            ..search
            ..sports,
        )
      ],
      child: BlocConsumer<CubitsCubit, CubitsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleTextStyle:
                      TextStyle(color: Colors.black, fontSize: 20),
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                bottomAppBarTheme: const BottomAppBarTheme(
                  elevation: 0.0,
                )),
            home: const NewsHome(),
          );
        },
      ),
    );
  }
}
