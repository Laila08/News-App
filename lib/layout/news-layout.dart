import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constants/constant.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/mode-cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/dio/dio-helper.dart';
import 'package:newsapp/modules/search-screen.dart';

class NewsLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                title: Text('News App'),
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: (){
                      ModeCubit.get(context).changeMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavIndex(index);
              },
              items: cubit.bottomItems,
            ),
          );
          },);
  }

}