import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_bazar/Components/SearchContainer.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchContainer(),
        categoryWidget(
            context: context,
            title: "Clothes",
            image:
                "https://www.checinternational.org/wp-content/uploads/2020/01/Clothing-Waste.jpg"),
        categoryWidget(
            context: context,
            title: "Posters",
            image: "https://static-cse.canva.com/image/96812/posters.jpg"),
        categoryWidget(
            context: context,
            title: "Computers",
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjHSPr-tXoun-ZR99dQ_wVeP29nvwn86At7g&usqp=CAU"),
        categoryWidget(
            context: context,
            title: "Music",
            image:
                "https://music.com/image-proxy/,q65/https://music.com/image/hero_image/2021-05-03/ea7d336559604083829e7cbb617bb250/desktop.jpg"),
      ],
    );
  }

  Widget categoryWidget(
      {required BuildContext context,
      required String title,
      required String image}) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            // height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image),
              ),
            ),
          ),
          Center(child: Text(title,style: theme(context).textTheme.headline3!.copyWith(color: Colors.white),),)
        ],
      ),
    );
  }
}
