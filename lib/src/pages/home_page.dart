import 'package:flutter/material.dart';
import 'package:food_delivery/src/scoped_models/food_model.dart';
import 'package:food_delivery/src/widgets/bought_foods.dart';
import '../widgets/home_top_info.dart';
import '../widgets/food_category.dart';
import '../widgets/search_file.dart';
import 'package:polygon_clipper/polygon_clipper.dart';


// Data
import '../data/food_data.dart';

// Model
import '../models/food_model.dart';

var meatImage =
    'https://images.unsplash.com/photo-1532597311687-5c2dc87fff52?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var foodImage =
    'https://images.unsplash.com/photo-1520218508822-998633d997e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80';

var burgerImage =
    'https://images.unsplash.com/photo-1534790566855-4cb788d389ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';
var chickenImage =
    'https://images.unsplash.com/photo-1532550907401-a500c9a57435?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

// COLORS
var textYellow = Color(0xFFf6c24d);
var iconYellow = Color(0xFFf4bf47);

var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

class HomePage extends StatefulWidget {
  final FoodModel foodModel;

  HomePage(this.foodModel);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;

  @override
  void initState() {
    widget.foodModel.fetchFoods();
    super.initState();
  }

  var textColor = 0xff006c00;
  var appColor = 0xffc1ffe9;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc1ffe9),
        body: Container(
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 16.0),
              HomeTopInfo(),
              SizedBox(height: 16.0),
              SearchField(),
              SizedBox(height: 16.0),
              FoodListview(),
              SizedBox(height: 16.0),
              MenuItemsList()
            ],
          ),
        ));
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.home),
                  Text('Home', style: TextStyle(fontSize: 12.0))
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.search, color: Colors.black45),
                  Text('Search', style: TextStyle(fontSize: 12.0))
                ],
              ),
              Container(width: 100.0,),
              Column(
                children: <Widget>[
                  Icon(Icons.shop, color: Colors.black45),
                  Text('Wishlist', style: TextStyle(fontSize: 12.0),)
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.shopping_cart, color: Colors.black45,),
                  Text('Cart', style: TextStyle(fontSize: 12.0))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MenuItemsList extends StatelessWidget {
  const MenuItemsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16.0),
          MenuItem(),
          MenuItem(),
          MenuItem(),
          MenuItem(),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Image.network(
              burgerImage,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Special Chicken Burger',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 200.0,
                  child: Text(
                    '4th block, koramangala',
                    style: TextStyle(color: Colors.grey),
                  )
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '4km away',
                      )
                    ),
                    SizedBox(width:30.0),
                    Container(
                      child: Text(
                        '4 Stars'
                      ),
                    )
                  ]  
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class FoodListview extends StatelessWidget {
  const FoodListview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 160.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            ItemCard(),
            ItemCard(),
            ItemCard(),
            ItemCard(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.grid_on,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('Location', style: TextStyle(color: Colors.black54),),
              Text(
                'West bay, Qatar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
          height: 160.0,
          width: 300.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(meatImage), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Container(
                height: 160.0,
                width: 300.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.1), Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      '25% OFF',
                      style: TextStyle(
                          color: textYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          letterSpacing: 1.1),
                    ),
                    Text(
                      'ON FIRST 3 ORDERS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 1.1),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
