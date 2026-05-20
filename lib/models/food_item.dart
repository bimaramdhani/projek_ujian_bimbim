// lib/models/food_item.dart

class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final double rating;
  final List<FoodItem> addons;
  int quantity;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.rating = 4.5,
    this.addons = const [],
    this.quantity = 0,
  });
}

class CartItem {
  final FoodItem food;
  int quantity;
  String notes;

  CartItem({
    required this.food,
    this.quantity = 1,
    this.notes = '',
  });

  double get totalPrice => food.price * quantity;
}

// ── Mock Data ──────────────────────────────────────────────────────────────

final List<FoodItem> allFoods = [
  FoodItem(
    id: '1',
    name: 'Nasi Uduk',
    description:
        'Nasi uduk adalah makanan yang gurih, nasi yang dimasak dengan santan, daun salam, sereh, dan rempah lainnya, disajikan dengan berbagai lauk pauk.',
    price: 25000,
    category: 'Nasi Uduk',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Nasi_uduk.jpg/1200px-Nasi_uduk.jpg',
    rating: 4.8,
    addons: [],
  ),
  FoodItem(
    id: '2',
    name: 'Nasi Pecel',
    description:
        'Nasi pecel adalah makanan khas Jawa Timur berupa nasi yang disajikan dengan berbagai sayuran rebus dan disiram bumbu pecel (sambal kacang).',
    price: 20000,
    category: 'Nasi Pecel',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Nasi_Pecel.jpg/1200px-Nasi_Pecel.jpg',
    rating: 4.6,
    addons: [],
  ),
  FoodItem(
    id: '3',
    name: 'Rendang',
    description:
        'Rendang adalah masakan daging sapi yang dimasak dengan santan dan campuran bumbu rempah yang kaya, dimasak hingga kering dan berwarna kecoklatan.',
    price: 35000,
    category: 'Rendang',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Rendang_Padang.jpg/1200px-Rendang_Padang.jpg',
    rating: 4.9,
    addons: [],
  ),
  FoodItem(
    id: '4',
    name: 'Ayam Goreng',
    description:
        'Ayam goreng bumbu rempah khas, digoreng hingga keemasan dan renyah, disajikan dengan sambal dan lalapan segar.',
    price: 28000,
    category: 'All',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Ayam_Goreng.jpg/1200px-Ayam_Goreng.jpg',
    rating: 4.7,
    addons: [],
  ),
  FoodItem(
    id: '5',
    name: 'Soto Ayam',
    description:
        'Soto ayam berkuah kuning segar dengan potongan ayam, mie, dan pelengkap lainnya. Cocok untuk sarapan dan makan siang.',
    price: 22000,
    category: 'All',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Soto_Ayam_Ambengan.jpg/1200px-Soto_Ayam_Ambengan.jpg',
    rating: 4.5,
    addons: [],
  ),
];

// Addon items (used in detail screen)
final List<FoodItem> addonItems = [
  FoodItem(
    id: 'a1',
    name: 'Tempe',
    description: '',
    price: 3000,
    category: '',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Standing_tempe.jpg/1200px-Standing_tempe.jpg',
  ),
  FoodItem(
    id: 'a2',
    name: 'Tahu',
    description: '',
    price: 3000,
    category: '',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Fried_tofu_with_chili_sauce.jpg/1200px-Fried_tofu_with_chili_sauce.jpg',
  ),
  FoodItem(
    id: 'a3',
    name: 'Telur',
    description: '',
    price: 5000,
    category: '',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Ei_Spiegelei.jpg/1200px-Ei_Spiegelei.jpg',
  ),
];
