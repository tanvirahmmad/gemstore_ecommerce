import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/shoes_repository.dart';
import 'package:meta/meta.dart';

part 'shoes_products_event.dart';
part 'shoes_products_state.dart';

class ShoesProductsBloc extends Bloc<ShoesProductsEvent, ShoesProductsState> {
  final ShoesProductsRepository shoesProductsRepository;
  ShoesProductsBloc(this.shoesProductsRepository)
      : super(ShoesProductsInitial()) {
    on<ShoesProductsEvent>((event, emit) async {
      try {
        emit(ShoesProductsLoading());
        ProductResponse shoesproductResponse =
            await shoesProductsRepository.getShoesProducts();
        emit(ShoesProductsLoaded(shoesproductResponse));
      } catch (e) {
        emit(ShoesProductsError(e.toString()));
      }
    });
  }
}
