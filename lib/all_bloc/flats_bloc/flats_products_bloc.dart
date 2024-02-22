import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/flats_repository.dart';
import 'package:meta/meta.dart';

part 'flats_products_event.dart';
part 'flats_products_state.dart';

class FlatsProductsBloc extends Bloc<FlatsProductsEvent, FlatsProductsState> {
  final FlatsProductsRepository flatsProductsRepository;
  FlatsProductsBloc(this.flatsProductsRepository) : super(FlatsProductsInitial()) {
    on<FlatsProductsEvent>((event, emit)async {
      try {
        emit(FlatsProductsLoading());
        ProductResponse flatsproductResponse = await flatsProductsRepository
            .getFlatsProducts();
        emit(FlatsProductsLoaded(flatsproductResponse));
      } catch (e) {
        emit(FlatsProductsError(e.toString()));
      }
    });
  }
}
