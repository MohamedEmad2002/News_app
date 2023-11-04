// https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&
// apiKey=1fa8a8274fd94f14badadf38da9dd335

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItems(article,context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: article['urlToImage'] !=null
            ?DecorationImage(
              image:NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover)
                : const DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
        )
        )
      ),
        const SizedBox(
        width: 20,
      ),
      Expanded(
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: const TextStyle(
                    color: Colors.grey
                ),
              )
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget articleBuilder(businessList,
    context,{required int itemCount,isSearch=false})=> ConditionalBuilder(
  condition: businessList.length>0,
  builder: (context)=> ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItems(businessList[index],context),
      separatorBuilder:(context ,index)=>dividerWidget() ,
      itemCount:itemCount),
  fallback: (context)=>isSearch?Container():const Center(child: CircularProgressIndicator()),
);

Widget dividerWidget()=>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey,
);

Widget defaultFormText({
  required TextEditingController control,
  required TextInputType type,
  required dynamic validator,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixClicked,
}) => TextFormField(
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      onChanged: (value) {
        onChanged!(value);
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixClicked!();
                  },
                  icon: Icon(suffix),
                )
              : null,
          border: const OutlineInputBorder()),
    );

    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    void navigateTo(context,Widget){
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=> Widget
      ));
}

// ignore: avoid_types_as_parameter_names, non_constant_identifier_names
void navigateAndFinish(context,Widget)=>
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=>Widget),
          (route) => false);
