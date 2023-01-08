import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/bloc-observer.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/mode-cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/dio/dio-helper.dart';
import 'package:newsapp/layout/news-layout.dart';
import 'package:newsapp/shared-prefrences.dart';
import 'package:newsapp/constants/themes.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (BuildContext context)=>NewsCubit()..getDataBusiness()..getDataScience()..getDataSports(),),
      BlocProvider(create: (BuildContext context)=>ModeCubit()..changeMode(),)
    ], child: BlocConsumer<ModeCubit,NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:lightTheme,
          darkTheme:darkTheme ,
          themeMode:ModeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home:  NewsLayout(),
        );
      } ,
    ))
    ;
  }
}