import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/features_products_repository.dart';

part 'features_products_event.dart';
part 'features_products_state.dart';

class FeaturesProductsBloc extends Bloc<FeaturesProductsEvent, FeaturesProductsState> {

  final FeaturesProductsRepository featuresProductsRepository;

  FeaturesProductsBloc(this.featuresProductsRepository) : super(FeaturesProductsInitial()) {
    on<GetFeaturesProducts>((event, emit) async {
      try {
        emit(FeaturesProductsLoading());

        ProductResponse categoryResponse = await
        featuresProductsRepository.getFeaturesProducts(page: event.page);
        emit(FeaturesProductsLoaded(categoryResponse));

      } catch (e) {
        emit(FeaturesProductsError(e.toString()));
      }
    });
  }
}
