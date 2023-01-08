import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/artical-item.dart';
import 'package:newsapp/component/my-divider.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class BuildArticalWidget extends StatelessWidget{
  List list;
  bool isSearch;
  BuildArticalWidget(this.list,{this.isSearch=false});
  @override
  Widget build(BuildContext context) {
    return list.length==0 ?
    isSearch?Container():Center(child: CircularProgressIndicator(),):
    ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      separatorBuilder:(BuildContext context, int index)=>MyDivider() ,
      itemBuilder:(BuildContext context, int index)=>BuildArticalItem(list[index]) ,
    );
  }

}