import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/skirts_repository.dart';
import 'package:meta/meta.dart';

part 'skirts_products_event.dart';
part 'skirts_products_state.dart';

class SkirtsProductsBloc
    extends Bloc<SkirtsProductsEvent, SkirtsProductsState> {
  final SkirtsProductsRepository skirtsProductsRepository;
  SkirtsProductsBloc(this.skirtsProductsRepository)
      : super(SkirtsProductsInitial()) {
    on<SkirtsProductsEvent>((event, emit) async {
      try {
        emit(SkirtsProductsLoading());
        ProductResponse topsproductResponse =
            await skirtsProductsRepository.getSkirtsProducts();
        emit(SkirtsProductsLoaded(topsproductResponse));
      } catch (e) {
        emit(SkirtsProductsError(e.toString()));
      }
    });
  }
}
