import 'package:agriplant/core/utils/enums/order_status.dart';

import 'models/order.dart';
import 'products.dart';

List<Order> orders = [
  Order(
      id: "202404a5",
      products: products.reversed.take(3).toList(),
      date: DateTime.utc(2024),
      status: OrderStatus.delivered),
  Order(
      id: "202204jm",
      products: products.take(1).toList(),
      date: DateTime.utc(2022),
      status: OrderStatus.processing),
  Order(
      id: "201904vc",
      products: products.reversed.skip(2).toList(),
      date: DateTime.utc(2019),
      status: OrderStatus.shipping),
  Order(
      id: "20230404vc",
      products: products.reversed.skip(2).take(1).toList(),
      date: DateTime.utc(2024),
      status: OrderStatus.picking),
  Order(
      id: "20230904vc",
      products: products.reversed.skip(2).take(2).toList(),
      date: DateTime.utc(2023),
      status: OrderStatus.picking),
  Order(
      id: "2022004vc",
      products: products.reversed.skip(2).toList(),
      date: DateTime.utc(2024),
      status: OrderStatus.processing),
  Order(
      id: "201704hc",
      products: products.reversed.skip(2).toList(),
      date: DateTime.utc(2017),
      status: OrderStatus.shipping),
];
