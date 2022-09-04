import 'package:first_flutter_application/layout/news_app/cubit/cubit.dart';
import 'package:first_flutter_application/layout/news_app/cubit/states.dart';
import 'package:first_flutter_application/shared/app_cupit/app_cupit.dart';
import 'package:first_flutter_application/shared/components/componets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state){

        var list = NewsCubit.get(context).buisness;

        return list.length > 0 ?
        ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(list[index], context),
          separatorBuilder: (context, index) =>  Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
            itemCount: 10,
        ):
        Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
