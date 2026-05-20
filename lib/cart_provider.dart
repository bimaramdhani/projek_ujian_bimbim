// lib/cart_provider.dart
import 'package:flutter/foundation.dart';
import 'models/food_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  String _orderNotes = '';

  List<CartItem> get items => _items;
  String get orderNotes => _orderNotes;

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  void addItem(FoodItem food) {
    final existing = _items.where((i) => i.food.id == food.id).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity++;
    } else {
      _items.add(CartItem(food: food));
    }
    notifyListeners();
  }

  void removeItem(String foodId) {
    final idx = _items.indexWhere((i) => i.food.id == foodId);
    if (idx != -1) {
      if (_items[idx].quantity > 1) {
        _items[idx].quantity--;
      } else {
        _items.removeAt(idx);
      }
    }
    notifyListeners();
  }

  void updateNotes(String notes) {
    _orderNotes = notes;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _orderNotes = '';
    notifyListeners();
  }

  bool isInCart(String foodId) => _items.any((i) => i.food.id == foodId);

  int quantityOf(String foodId) {
    final found = _items.where((i) => i.food.id == foodId).toList();
    return found.isEmpty ? 0 : found.first.quantity;
  }
}
