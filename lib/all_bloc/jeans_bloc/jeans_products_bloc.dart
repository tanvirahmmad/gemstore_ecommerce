import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/jeans_repsitory.dart';
import 'package:meta/meta.dart';

part 'jeans_products_event.dart';
part 'jeans_products_state.dart';

class JeansProductsBloc extends Bloc<JeansProductsEvent, JeansProductsState> {
  final JeansProductsRepository jeansProductsRepository;
  JeansProductsBloc(this.jeansProductsRepository)
      : super(JeansProductsInitial()) {
    on<JeansProductsEvent>((event, emit) async {
      try {
        emit(JeansProductsLoading());
        ProductResponse jeansproductResponse =
            await jeansProductsRepository.getJeansProducts();
        emit(JeansProductsLoaded(jeansproductResponse));
      } catch (e) {
        emit(JeansProductsError(e.toString()));
      }
    });
  }
}
