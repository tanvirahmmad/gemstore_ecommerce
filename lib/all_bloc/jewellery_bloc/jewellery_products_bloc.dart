import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/jewellery_repository.dart';
import 'package:meta/meta.dart';

part 'jewellery_products_event.dart';
part 'jewellery_products_state.dart';

class JewelleryProductsBloc
    extends Bloc<JewelleryProductsEvent, JewelleryProductsState> {
  final JewelleryProductsRepository jewelleryProductsRepository;
  JewelleryProductsBloc(this.jewelleryProductsRepository)
      : super(JewelleryProductsInitial()) {
    on<JewelleryProductsEvent>((event, emit) async {
      try {
        emit(JewelleryProductsLoading());
        ProductResponse jewelleryproductResponse =
            await jewelleryProductsRepository.getJewelleryProducts();
        emit(JewelleryProductsLoaded(jewelleryproductResponse));
      } catch (e) {
        emit(JewelleryProductsError(e.toString()));
      }
    });
  }
}
