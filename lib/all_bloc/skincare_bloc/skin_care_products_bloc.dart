import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/skin_care_repository.dart';
import 'package:meta/meta.dart';

part 'skin_care_products_event.dart';
part 'skin_care_products_state.dart';

class SkinCareProductsBloc
    extends Bloc<SkinCareProductsEvent, SkinCareProductsState> {
  final SkinCareProductsRepository skincareProductsRepository;
  SkinCareProductsBloc(this.skincareProductsRepository)
      : super(SkinCareProductsInitial()) {
    on<SkinCareProductsEvent>((event, emit) async {
      try {
        emit(SkinCareProductsLoading());
        ProductResponse skincareproductResponse =
            await skincareProductsRepository.getSkinCareProducts();
        emit(SkinCareProductsLoaded(skincareproductResponse));
      } catch (e) {
        emit(SkinCareProductsError(e.toString()));
      }
    });
  }
}
