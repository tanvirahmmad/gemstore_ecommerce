import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/casual_repository.dart';
import 'package:meta/meta.dart';

part 'casual_products_event.dart';
part 'casual_products_state.dart';

class CasualProductsBloc extends Bloc<CasualProductsEvent, CasualProductsState> {
  final CasualProductsRepository casualProductsRepository;

  CasualProductsBloc(this.casualProductsRepository)
      : super(CasualProductsInitial()) {
    on<CasualProductsEvent>((event, emit) async {
      try {
        emit(CasualProductsLoading());
        ProductResponse casualproductResponse = await casualProductsRepository
            .getCasualProducts();
        emit(CasualProductsLoaded(casualproductResponse));
      } catch (e) {
        emit(CasualProductsError(e.toString()));
      }
    });
  }
}