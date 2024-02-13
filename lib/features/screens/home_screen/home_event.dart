part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object>get props=>[];
}

class CatagoriesLoadedEvent extends Equatable{
  @override

  List<Object?> get props =>[];


}
class BannerLoadedEvent extends Equatable{
  @override

  List<Object?> get props => [];

}