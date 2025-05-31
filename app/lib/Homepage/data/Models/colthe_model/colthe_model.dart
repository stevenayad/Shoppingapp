import 'package:equatable/equatable.dart';

import 'product.dart';

class ColtheModel extends Equatable {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  const ColtheModel({this.products, this.total, this.skip, this.limit});

  factory ColtheModel.fromJson(Map<String, dynamic> json) => ColtheModel(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  @override
  List<Object?> get props => [products, total, skip, limit];
}
