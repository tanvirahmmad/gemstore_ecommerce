import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemstore_ecommerce/common/color/my_color.dart';
import 'package:gemstore_ecommerce/common/my_assets_strings/my_assets_strings.dart';
import 'package:gemstore_ecommerce/common/my_strings.dart';
import 'package:gemstore_ecommerce/features/screens/home_screen/home_bloc.dart';
import 'package:gemstore_ecommerce/models/catagory_models.dart';
import 'package:gemstore_ecommerce/widgets/catagory_card_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop(); // Use SystemNavigator.pop to exit the app
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => _onWillPop(context),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc()..add(CatagoriesLoadedEvent()),
          ),
          BlocProvider<HomeBannerBloc>(
            create: (context) => HomeBannerBloc()..add(BannerLoadedEvent()),
          ),
          // Add more BlocProviders as needed
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    MyStrings.home_page_status,
                    style: TextStyle(
                      fontFamily: MyAssetsStrings.productSans,
                      fontSize: 20,
                      color: Color(int.parse(MyColor.myColorTwo)),
                    ),
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            actions: [
              Container(
                child: IconButton(
                  icon: Image.asset(
                    MyAssetsStrings.bell_icon,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state is CatagoriesLoadingState) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                } else if (state is CatagoriesLoadedState) {
                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.catagorymodel.data?.length ,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: CatagoriesCardList(
                                image: state.catagorymodel.data?[index].image,
                                text: state.catagorymodel.data?[index].name));
                      },
                    ),
                  );
                } else if (state is CatagoriesLoadingErrorState) {
                  return Center(child: Text(state.errormessege));
                }
                return const SizedBox();
              }),
              SizedBox(height: 30,),

              BlocBuilder<HomeBannerBloc, HomeState>(builder: (context, state) {
                if (state is BannerLoadingState) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                } else if (state is BannerLoadedState) {
                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child:Text(state.products[index].title!.toString()));

                      },
                    ),
                  );
                } else if (state is BannerLoadingErrorState) {
                  return Center(child: Text(state.ermessege));
                }
                return const SizedBox();
              }),

            ],
          ),
        ),
      ),
    );
  }
}
