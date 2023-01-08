import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/artical-item.dart';
import 'package:newsapp/component/build-artical-widget.dart';
import 'package:newsapp/component/my-divider.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';


class ScienceScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<NewsCubit,NewsStates>(
        listener:(context, state){},
        builder: (context, state){
          var list = NewsCubit.get(context).scienceList;
          return BuildArticalWidget(list);
        }
    );
  }

}