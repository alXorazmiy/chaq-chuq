
class BagEvent {}

class BagInitial extends BagEvent {}



class ProductIncrement extends BagEvent {
  final int id;

  ProductIncrement({required this.id});
}

class ProductDecrement extends BagEvent {
  final int id;
  ProductDecrement({required this.id});
}

class DeleteItemBag extends BagEvent{
    final int id;
    DeleteItemBag({required this.id});
    
}

class DeleteBag extends BagEvent {}