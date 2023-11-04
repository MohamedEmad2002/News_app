import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussniess/cubits/cubit/cubits_cubit.dart';
import 'package:news_app/constants/constatnts.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CubitsCubit>(
        create: (context) => CubitsCubit(),
        child: BlocConsumer<CubitsCubit, CubitsState>(
          listener: (context, state) {},
          builder: (context, state) {
            List businessList = CubitsCubit.get(context).science;
            return articleBuilder(businessList, context, itemCount: 10);
          },
        ));
  }
}
