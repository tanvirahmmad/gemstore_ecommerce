import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/heels_repository.dart';
import 'package:meta/meta.dart';

part 'heels_products_event.dart';
part 'heels_products_state.dart';

class HeelsProductsBloc extends Bloc<HeelsProductsEvent, HeelsProductsState> {
  final HeelsProductsRepository heelsProductsRepository;

  HeelsProductsBloc(this.heelsProductsRepository)
      : super(HeelsProductsInitial()) {
    on<HeelsProductsEvent>((event, emit) async {
      try {
        emit(HeelsProductsLoading());
        ProductResponse heelsproductResponse =
            await heelsProductsRepository.getHeelsProducts();
        emit(HeelsProductsLoaded(heelsproductResponse));
      } catch (e) {
        emit(HeelsProductsError(e.toString()));
      }
    });
  }
}
