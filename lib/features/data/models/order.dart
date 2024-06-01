import '../../../core/utils/enums/order_status.dart';
import 'product.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime date;
  final OrderStatus status ;

  Order({
    required this.id,
    required this.products,
    required this.date,
    required this.status
  });
}
