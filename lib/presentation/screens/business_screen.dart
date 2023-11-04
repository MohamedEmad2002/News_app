import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussniess/cubits/cubit/cubits_cubit.dart';
import 'package:news_app/constants/constatnts.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitsCubit, CubitsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List businessList = CubitsCubit.get(context).business;
        return articleBuilder(businessList, context, itemCount: 10);
      },
    );
  }
}
