import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_bazar/Providers/CategoryProvider.dart';
import 'package:online_bazar/Utilities/ThemeOf.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
        builder: (_, catState, __) => ListView(
              children: [

                AdsSection(),
                SizedBox(height: 12,),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  height: 100,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: catState.categoryImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      String name = catState.categoryNames[index];
                      String image = catState.categoryImages[index];
                      return CategoryCard(
                        label: name,
                        image: image,
                        onPressed: () {
                          // setState(() {
                          //   currentCategory = "market";
                          // });
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Row(
                    children: [
                      Text('Products'),
                      Spacer(),
                      Text('See more'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: StaggeredGridView.countBuilder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) =>
                        children[index],
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(1),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                ),
              ],
            ));
  }
}

class SubCategoryCard extends StatelessWidget {
  final String image;

  const SubCategoryCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, '/'),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: theme(context).dividerColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.network(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: theme(context).primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '23 dis.',
                style: theme(context).textTheme.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final String image;
  final Function onPressed;

  const CategoryCard(
      {required this.label, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: theme(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              image,
              color: theme(context).primaryColor,
              width: 35,
              height: 35,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: theme(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class AdsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme(context).primaryColor.withOpacity(0.5),
        border: Border.all(
          width: 1,
          color: theme(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SizedBox.shrink()
    );
  }
}

List<Widget> children = [
  ItemCard(image: image1, itemName: 'Fashion Shoes'),
  ItemCard(image: image2, itemName: 'Wedding Hat'),
  ItemCard(image: image3, itemName: 'Eyeglasses'),
  ItemCard(image: image4, itemName: 'Modern Clothes'),
];

class ItemCard extends StatelessWidget {
  final String image;
  final String itemName;

  const ItemCard({required this.image, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/discount'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color: theme(context).dividerColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(itemName),
            ),
          ],
        ),
      ),
    );
  }
}

const String image1 =
    "https://i.pinimg.com/736x/c4/30/86/c43086baed27cdacb5f4769dfa5531fc.jpg";
const String image2 =
    "https://static.standard.co.uk/s3fs-public/thumbnails/image/2019/03/21/11/john-lewis-hat-header.jpg?width=968&auto=webp&quality=75&crop=968%3A645%2Csmart";
const String image3 =
    "https://www.foreyes.com/media/blog/How_Should_Eyeglasses_Fit_With_Your_Eyebrows_header.jpg";
const String image4 =
    "https://www.telegraph.co.uk/content/dam/men/2018/07/02/TELEMMGLPICT000168190077_trans_NvBQzQNjv4BqpVlberWd9EgFPZtcLiMQfyf2A9a6I9YchsjMeADBa08.jpeg";
