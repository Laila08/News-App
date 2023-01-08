import 'package:flutter/material.dart';
import 'package:newsapp/constants/constant.dart';
import 'package:newsapp/modules/web-view-page.dart';

class BuildArticalItem extends StatelessWidget{
  Map artical;
  BuildArticalItem(this.artical);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        navigateTo(context,WebViewScreen(artical['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('${artical['urlToImage']??'https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg'}'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('${artical['title']}',
                        style:Theme.of(context).textTheme.bodyText1 ,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      )),
                      Text('${artical['publishedAt']}',style: TextStyle(color: Colors.grey),
                      )]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}