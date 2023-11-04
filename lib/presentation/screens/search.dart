import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bussniess/cubits/cubit/cubits_cubit.dart';
import 'package:news_app/constants/constatnts.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitsCubit, CubitsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = CubitsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormText(
                      control: searchController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Search Can't be Empty";
                        } else {
                          return null;
                        }
                      },
                      onTap: () {
                        if (kDebugMode) {
                          print(searchController.toString());
                        }
                      },
                      onChanged: (value) {
                        CubitsCubit.get(context).getSearch(value);
                      },
                      onSubmit: (s) {
                        if (kDebugMode) {
                          print(s);
                        }
                      },
                      label: 'Search',
                      prefix: Icons.search),
                ),
                Expanded(
                    child: articleBuilder(list, context,
                        itemCount: list.length, isSearch: true)),
              ],
            ));
      },
    );
  }
}
