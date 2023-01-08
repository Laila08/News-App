import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/dio/dio-helper.dart';
import 'package:newsapp/modules/business/business.dart';
import 'package:newsapp/modules/sciences/sciences.dart';
import 'package:newsapp/modules/sports/sports.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  // --------------------- Bottom Navigation Bar ----------------------------
int currentIndex =0;

List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
];

List<Widget> screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
];

void changeBottomNavIndex(int index){
  currentIndex=index;
  emit(NewsBottomNavState());
}

// --------------------- Get Business Data ----------------------------
  List<dynamic> businessList=[];
  void getDataBusiness(){
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
        path_url:'v2/top-headlines',
        query:{
          'country':'us',
          'category':'business',
          'apiKey':'0afeb386b4ea421188c057979387482f'
        }).then((value){
          businessList = value.data['articles'];
          print('--------------------------------------------'+businessList[0]['title']);
          emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
      print(error.toString());
      });

 }
// --------------------- Get Sports Data ----------------------------
  List<dynamic> sportsList=[];
  void getDataSports(){
    emit(NewsSportsLoadingState());
    DioHelper.getData(
        path_url:'v2/top-headlines',
        query:{
          'country':'us',
          'category':'sports',
          'apiKey':'0afeb386b4ea421188c057979387482f'
        }).then((value){
          sportsList=value.data['articles'];
          emit(NewsGetSportsSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
      print(error.toString());
    });
  }
// --------------------- Get Sports Data ----------------------------
  List<dynamic> scienceList=[];
  void getDataScience(){
    emit(NewsScienceLoadingState());
    DioHelper.getData(
        path_url:'v2/top-headlines',
        query:{
          'country':'us',
          'category':'science',
          'apiKey':'0afeb386b4ea421188c057979387482f'
        }).then((value){
      scienceList=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error.toString()));
      print(error.toString());
    });
  }
// --------------------- Get Sports Data ----------------------------
  List<dynamic> searchList = [];
  void searchData(String textSearch){
    searchList=[];
    emit(NewsSearchLoadingState());
    DioHelper.getData(
        path_url:'v2/everything' ,
        query:{
          'q':'$textSearch',
          'apiKey':'0afeb386b4ea421188c057979387482f'
        } ).then((value){
          searchList=value.data['articles'];
          emit(NewssSearchSuccessState());
    }).catchError((error){
      emit(NewsSearchErrorState(error));
    });
  }


}