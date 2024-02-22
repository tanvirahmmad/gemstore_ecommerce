import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/sports_repository.dart';
import 'package:meta/meta.dart';

part 'sports_products_event.dart';
part 'sports_products_state.dart';

class SportsProductsBloc
    extends Bloc<SportsProductsEvent, SportsProductsState> {
  final SportsProductsRepository sportsProductsRepository;

  SportsProductsBloc(this.sportsProductsRepository)
      : super(SportsProductsInitial()) {
    on<SportsProductsEvent>((event, emit) async {
      try {
        emit(SportsProductsLoading());
        ProductResponse sportsproductResponse =
            await sportsProductsRepository.getSportsProducts();
        emit(SportsProductsLoaded(sportsproductResponse));
      } catch (e) {
        emit(SportsProductsError(e.toString()));
      }
    });
  }
}
