import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/detail_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Food List'),
      ),
      body: _PageList(
      ),
    );
  }
}
final baseTextStyle = const TextStyle(color:  Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle = baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle = baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle = baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);


class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {

  List<String> theme = [
    'Ramen',
    'Curry Rice',
    'Okonomiyaki',
    'Miso Soup'
  ];
  List<String> subTheme=[
    'Ramen Is A Japanese Noodle Soup Dish',
    'A Curry With Rice Japanese Style',
    'A Tasty Egg With Veggies & Meat',
    'A Tasty Soup With Seafood & Veggies'
  ];
  List<String>images=[
    'assets/images/ramen.jpeg',
    'assets/images/curry_rice.jpg',
    'assets/images/okonomiyaki.jpg',
    'assets/images/miso_soup.jpg'
  ];
  List<String> num=[
    'INGREDIENTS\n\n2 chicken breasts (boneless, skin-on)*\n\nkosher salt and freshly-ground black pepper, to season\n\n1 tbsp unsalted butter\n\n2 tsp sesame or vegetable oil\n\n2 tsp fresh ginger, minced\n\n3 tsp fresh garlic, minced\n\n3 tbsp low-sodium soy sauce\n\n2 tbsp mirin\n\n4 cups rich chicken stock\n\n1 oz dried shitake mushrooms (or 1/2 cup fresh)\n\n1–2 tsp sea salt, to taste\n\n2 large eggs\n\n1/2 cup scallions, sliced\n\n2 (3 oz) packs dried ramen noodles\n\noptional: fresh jalapeño slices, for serving\n\nCook the chicken*: Preheat the oven to 375 degrees. Season the chicken generously with salt and pepper. Melt the butter in a large oven-safe skillet over medium heat. Add the chicken, skin-side down, and cook until the skin is golden brown and releases easily from the pan, about 5-7 minutes. Flip the chicken over and cook for another 4-5 minutes, until golden. Transfer the skillet to the oven and roast for 15-20 minutes, until the chicken is cooked through. Remove from the oven, transfer the chicken to a plate and cover with foil until ready to serve.\n\nMake the ramen broth: Heat the oil in a large pot over medium heat, until shimmering. Add the garlic and ginger, and cook for a few minutes until softened. Add the soy sauce and mirin, and stir to combine. Cook for another minute. Add the stock, cover, and bring to boil. Remove the lid, and let simmer uncovered for 5 minutes, then add the dried mushrooms. Simmer gently for another 10 minutes, and season with salt, to taste.\n\nMake the soft-boiled eggs: Fill a pot with enough water to cover the eggs, and bring to a boil. Gently lower the eggs (still cold from the fridge) into the boiling water, and let simmer for 7 minutes (for a slightly-runny yoke) or 8 minutes (for a soft, but set-up yoke).\n\nMeanwhile, fill a large bowl with ice water. When the timer finishes, transfer the eggs to the ice bath to stop the cooking process. Wait at least 5 minutes, or until cool enough to handle, then carefully peel away the shell and slice in half, lengthwise. Set aside until ready to serve.\n\nAssemble the ramen bowls: Meanwhile, chop the scallions and jalapeño (if using). Slice the chicken into thin pieces. Set aside. When the eggs finish cooking, add the ramen noodles to the boiling water. Cook for 2-3 minutes, until soft, then divide the noodles into two large bowls. Add the sliced chicken and the ramen broth. Top with the fresh scallions, jalapeño and the soft boiled egg. Serve immediately.',
    '50',
    '50',
    '50'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: theme.length,
          itemBuilder: (BuildContext contex, int index ){
            final title = theme[index].toString();
            final subTitle = subTheme[index].toString();
            final numbers = num[index].toString();
            final image = images[index].toString();
            return Container(
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      backgroundImage(image),
                      Container(
                        child: topContent(title, subTitle, numbers),
                      )
                    ],
                  ),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>DetailPage(
                            itemTheme: title,
                            itemSub:subTitle,
                            qty:numbers,
                            itemImage:image)
                    ));
                  }
              ),
            );
          }
      ),
    );
  }

  backgroundImage(String image) {
    return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image:DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5),
                    BlendMode.luminosity),
                image: AssetImage(image)
            )
        )
    );
  }

  topContent(String name, String detail, String stock) {
    return new Container(
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            name, style: bigHeaderTextStyle,
          ),
          Text(
            detail,style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stock, style: footerTextStyle,
          )
        ],
      ),
    );
  }



}






