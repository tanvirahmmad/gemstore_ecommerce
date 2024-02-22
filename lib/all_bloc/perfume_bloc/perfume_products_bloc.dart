import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/perfume_repository.dart';
import 'package:meta/meta.dart';

part 'perfume_products_event.dart';
part 'perfume_products_state.dart';

class PerfumeProductsBloc extends Bloc<PerfumeProductsEvent, PerfumeProductsState> {
  final PerfumeProductsRepository perfumeProductsRepository;
  PerfumeProductsBloc(this.perfumeProductsRepository) : super(PerfumeProductsInitial()) {
    on<PerfumeProductsEvent>((event, emit)async {
      try {
        emit(PerfumeProductsLoading());
        ProductResponse perfumeproductResponse = await perfumeProductsRepository
            .getPerfumeProducts();
        emit(PerfumeProductsLoaded(perfumeproductResponse));
      } catch (e) {
        emit(PerfumeProductsError(e.toString()));
      }
    });
  }
}
