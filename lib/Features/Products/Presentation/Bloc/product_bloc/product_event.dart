sealed class ProductEvent {}

class FetchProductEvent extends ProductEvent {}

class FetchProductByIdtEvent extends ProductEvent {
  final int id;
  FetchProductByIdtEvent({required this.id});
}
