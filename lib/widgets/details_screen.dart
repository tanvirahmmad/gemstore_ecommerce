import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/routing/my_routes.dart';
import 'package:gemstore_ecommerce/widgets/fetaure_products_slider.dart';
import 'package:gemstore_ecommerce/widgets/half_filled_icon.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen(this.product, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ScrollController _sliverScrollController = ScrollController();
  final ValueNotifier<bool> isPinned = ValueNotifier<bool>(false);

  @override
  void initState() {
    _sliverScrollController.addListener(() {
      isPinned.value = _sliverScrollController.offset > 400;
    });
  }

  Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
            )
          ),
          child: BottomAppBar(

            color: Colors.black,

            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset(
                        MyAssetsStrings.add_to_bag,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {

                      },
                      child: Text("Add To Cart",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: MyAssetsStrings.productSans,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ),
        ),
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
                background: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          selectedColor ?? Colors.white,
                          BlendMode.modulate,
                        ),
                        child: Image.network(
                          widget.product.thumbnail!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ), //Images.network
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
        Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0,
                  1), // changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'Setting Icon',
                    onPressed: () {},
                  ),
                ), //IconButton
              ],
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(0,
                            1), // changes the position of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.0),
                   ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                  tooltip: 'Setting Icon',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.product.name ?? "-",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: MyAssetsStrings.productSans,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2, // Set the maximum number of lines
                            overflow: TextOverflow
                                .ellipsis, // Handle overflow with ellipsis (...) or other options
                          ),
                        ),
                        Text("\$ 8000",
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: MyAssetsStrings.productSans,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        RatingBar(
                            minRating: 1,
                            maxRating: 5,
                            initialRating: 3,
                            allowHalfRating: true,
                            ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: MyColor.rattingbar_icon_color,
                                ),
                                half: HalfFilledIcon(
                                    icon: Icons.star,
                                    size: 80,
                                    color: MyColor.rattingbar_icon_color),
                                empty: Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                )),
                            onRatingUpdate: (val) {
                              print(val);
                            })
                      ],
                    ),
                    SizedBox(height: 28),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 39,
                          child: Text("Color",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily:
                                      MyAssetsStrings.productSansMedium)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildColorButton(
                                MyColor.pic_changed_color_Normal_Pink),
                            SizedBox(
                              width: 12,
                            ),
                            buildColorButton(Colors.green),
                            SizedBox(
                              width: 12,
                            ),
                            buildColorButton(
                                MyColor.pic_changed_color_DeepPink),
                            SizedBox(
                              width: 12,
                            ),

                          ],
                        ),
                      ],
                    ),
                    Accordion(
                        contentBorderColor: Colors.transparent,
                        headerBackgroundColor: Colors.transparent,
                        rightIcon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.black, size: 26),
                        children: [
                          AccordionSection(
                              isOpen: false,
                              header: Text(
                                "Describtion",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: MyAssetsStrings.productSans),
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...widget.product.description!.map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: MyAssetsStrings
                                                .productsanslight),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          AccordionSection(
                              isOpen: false,
                              header: Text(
                                "Review",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: MyAssetsStrings.productSans),
                              ),
                              content: Text("This site's all product are fantastic."
                              ,  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: MyAssetsStrings
                                          .productsanslight))),
                          AccordionSection(
                              isOpen: false,
                              header: Text(
                                "Similar Product",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: MyAssetsStrings.productSans),
                              ),
                              content: FeatureProductsSlider()),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes the position of the shadow
            ),
          ],
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.white : Colors.transparent,
            width: 6,
          ),
        ),
      ),
    );
  }
}
