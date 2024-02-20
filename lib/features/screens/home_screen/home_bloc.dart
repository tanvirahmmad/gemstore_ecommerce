import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/catagoriesnew.dart';
import 'package:http/http.dart' as https;
import 'package:gemstore_ecommerce/models/catagory_models.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<CatagoriesLoadedEvent, HomeState> {
  HomeBloc() : super(ProductsLoadingState());

  @override
  Stream<HomeState> mapEventToState(CatagoriesLoadedEvent event) async* {
    if (event is CatagoriesLoadedEvent) {
      try {
        yield ProductsLoadingState();
        var response =
        await https.get(Uri.parse("https://fluxstore.bengalquiz.xyz/api/products"));
        if (response.statusCode == 200) {
          // Parse the JSON response using productsFromJson function
          Products products = productsFromJson(response.body);
          yield ProductsLoadedState(products);
        } else {
          throw Exception("Failed to load error");
        }
      } catch (e) {
        yield CatagoriesLoadingErrorState(e.toString());
      }
    }
  }
}

class HomeBannerBloc extends Bloc<BannerLoadedEvent, HomeState> {
  HomeBannerBloc() : super(ProductsLoadingState()) {
    on<BannerLoadedEvent>((event, emit) async {
      try {
        emit(BannerLoadingState());
        var response =
        await https.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
          emit(BannerLoadedState(bannerProductsFromJson(response.body)));
        } else {
          throw Exception("Failed to load error");
        }
      } catch (e) {
        emit(BannerLoadingErrorState(e.toString()));
      }
    });
  }
}