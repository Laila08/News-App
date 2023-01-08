import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/component/artical-item.dart';
import 'package:newsapp/component/build-artical-widget.dart';
import 'package:newsapp/component/custom-form.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SearchScreen extends StatelessWidget{
  TextEditingController searchController = TextEditingController();
  validateNull(String text){
    if (text==null){
      return 'search must not be empty';
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state){},
      builder:(context, state){
        var list = NewsCubit.get(context).searchList;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormFieldWidget(
                  title: 'Search',
                  validator:validateNull ,
                  controller: searchController,
                  onChanged:(value){
                    NewsCubit.get(context).searchData(value);
                  },
                  textInputType: TextInputType.text,
                ),
              ),
              Expanded(
                  child:BuildArticalWidget(list,isSearch: true,)
              )
            ],
          ),
        );
      }  );
  }

}