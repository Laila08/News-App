import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
   final String error;

  NewsGetBusinessErrorState(this.error);
}
class NewsBusinessLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;

  NewsGetSportsErrorState(this.error);
}
class NewsSportsLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}
class NewsScienceLoadingState extends NewsStates{}
class NewsThemeModeState extends NewsStates{}
class NewssSearchSuccessState extends NewsStates{}
class NewsSearchErrorState extends NewsStates{
  final String error;

  NewsSearchErrorState(this.error);
}
class NewsSearchLoadingState extends NewsStates{}