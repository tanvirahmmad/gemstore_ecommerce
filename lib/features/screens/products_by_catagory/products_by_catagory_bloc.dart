import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/catagory_products_id.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/products_by_catagory_repository.dart';
import 'package:meta/meta.dart';

part 'products_by_catagory_event.dart';
part 'products_by_catagory_state.dart';

class ProductsByCatagoryBloc extends Bloc<ProductsByCatagoryEvent, ProductsByCatagoryState> {
  final GetProductsByCatagoryReppository getProductsByCatagoryReppository;
  ProductsByCatagoryBloc(this.getProductsByCatagoryReppository) : super(ProductsByCatagoryInitial()) {
    on<GetProductsByCategory >((event, emit) async{
      try {
        emit(ProductsByCatagoryLoading());

        ProductResponse getproductsbycatagoryResponse = await getProductsByCatagoryReppository.getProductsByCatagory(
          page: event.page,
          catagoryName: event.catagoryName,
        );

        emit(ProductsByCatagoryLoaded(getproductsbycatagoryResponse));
      } catch (e) {
        emit(ProductsByCatagoryError(e.toString()));
      }
    });
  }
}

