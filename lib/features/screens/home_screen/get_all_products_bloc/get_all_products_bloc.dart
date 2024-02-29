import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/get_tag_products.dart';
import 'package:meta/meta.dart';

import '../../../../models/enum.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

class GetAllProductsBloc extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  final GetAllProductsRepository getAllProductsRepository;

  GetAllProductsBloc(this.getAllProductsRepository) : super(GetAllProductsInitial()) {
    on<GetAllProducts>((event, emit) async {
      try {
        emit(GetAllProductsLoading());

        ProductResponse getallproductResponse = await getAllProductsRepository.getFeaturesProducts(
          page: event.page,
          productTags: event.producTags,
        );

        emit(GetAllProductsLoaded(getallproductResponse));
      } catch (e) {
        emit(GetAllProductsError(e.toString()));
      }
    });
  }
}
