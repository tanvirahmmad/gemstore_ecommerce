import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen(this.product, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

List<Color> myColor = [
  Colors.pinkAccent.shade100,
  Colors.black,
  Colors.pinkAccent
];
Color primarycolor = myColor[0];

class _DetailsScreenState extends State<DetailsScreen> {

  final ScrollController _sliverScrollController = ScrollController();
  final ValueNotifier<bool> isPinned = ValueNotifier<bool>(false);


  @override
  void initState() {
    _sliverScrollController.addListener(() {
      isPinned.value = _sliverScrollController.offset > 400;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _sliverScrollController,
        slivers: [
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
              Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  widget.product.thumbnail!,
                  fit: BoxFit.fitWidth,
                ) //Images.network
            ),
            title: ValueListenableBuilder(
              valueListenable: isPinned,
              builder: (context, value, _) {
                return Text(
                  value ? widget.product.name ?? "-" : "",
                  style: const TextStyle(color: Colors.black),
                );
              },
            ),
            expandedHeight: 500,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_border,color: Colors.amber,),
                tooltip: 'Setting Icon',
                onPressed: () {},
              ), //IconButton
            ],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.amber,),
              tooltip: 'Setting Icon',
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.name ?? "-"),

                  SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite),
                          Icon(Icons.favorite),
                          Icon(Icons.favorite),
                          Icon(Icons.favorite),
                          Icon(Icons.favorite),
                          Text("(100)"),
                        ],
                      ),


                      Text("\$ 8000"),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );


    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(MyAssetsStrings.sports_wear),
                ),
              ),
            ),
            Positioned(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Color(int.parse(MyColor.myColorOne)),
                      borderRadius: BorderRadius.circular(70.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          // Set the shadow color
                          spreadRadius: 2,
                          // Set the spread radius of the shadow
                          blurRadius: 5,
                          // Set the blur radius of the shadow
                          offset: Offset(0, 1), // Set the offset of the shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(70.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), // Set the shadow color
                        spreadRadius: 2, // Set the spread radius of the shadow
                        blurRadius: 5, // Set the blur radius of the shadow
                        offset: Offset(0, 1), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                ),
              ],
            ))
          ],
        ),
        // buildColorIcons(),
        // buildAmountTag(),
      ],
    );
  }

  Widget buildIconBtn(Color myColor) => Container(
          child: Stack(children: [
        Positioned(
          top: 12.5,
          left: 12.5,
          child: Icon(
            Icons.check,size:20,
            color:
                primarycolor == myColor ? myColor : Colors.transparent,
          ),
        ),
            IconButton(onPressed: (){
              setState(() {
                primarycolor=myColor;
              });
            }, icon: Icon(Icons.circle,
            color: myColor.withOpacity(0.65),size: 30,))
      ]));
  Widget buildAmountTag()=>Container(
    child: Text("\$80.00"),
  );
  Widget buildColorIcons()=>Positioned(bottom: 35,
    right: 10,
    child: Row(
      children: [
        for(var i =0;i<3;i)buildIconBtn(myColor[i])
      ],
    ),
  );
}
