import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/recommended_repository.dart';
import 'package:meta/meta.dart';

part 'recommended_products_event.dart';
part 'recommended_products_state.dart';

class RecommendedProductsBloc extends Bloc<RecommendedProductsEvent, RecommendedProductsState> {
  final RecommendedProductsRepository recommendedProductsRepository;
  RecommendedProductsBloc(this.recommendedProductsRepository) : super(RecommendedProductsInitial()) {
    on<GetRecommendedProducts>((event, emit) async{
      try {
        emit(RecommendedProductsLoading());


          ProductResponse recommendedResponse = await
          recommendedProductsRepository.getRecommendedProducts(page:event.page);
          emit(RecommendedProductsLoaded(recommendedResponse));

        } catch (e) {
          emit(RecommendedProductsError(e.toString()));
        }
      });
    }
        }

