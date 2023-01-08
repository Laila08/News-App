import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/shared-prefrences.dart';

class ModeCubit extends Cubit<NewsStates>{
  ModeCubit():super(NewsInitialState());
  static ModeCubit get(context) => BlocProvider.of(context);
// --------------------- Theme Mode ----------------------------
  bool isDark = false;
  void changeMode({bool? modeValue}){
    if(modeValue!=null){
      isDark=modeValue;
      emit(NewsThemeModeState());
    }else{
      isDark=!isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value){
        emit(NewsThemeModeState());
      });
    }
  }
}