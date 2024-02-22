import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:gemstore_ecommerce/models/product_response.dart';
import 'package:gemstore_ecommerce/repository/sharees_reposetory.dart';
import 'package:meta/meta.dart';

part 'shrees_products_event.dart';
part 'shrees_products_state.dart';

class ShreesProductsBloc extends Bloc<ShreesProductsEvent, ShareesProductsState> {
  final ShareesProductsRepository shareesProductsReposetory;

  ShreesProductsBloc(this.shareesProductsReposetory)
      : super(ShreesProductsInitial()) {
    on<ShreesProductsEvent>((event, emit) async {
      try {
        emit(ShareesProductsLoading());

        ProductResponse shareesResponse = await shareesProductsReposetory
            .getShareesProducts();
        emit(ShareesProductsLoaded(shareesResponse));
      } catch (e) {
        emit(ShareesProductsError(e.toString()));
      }
    });
  }
}
