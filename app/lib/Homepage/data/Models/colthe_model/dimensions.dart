import 'package:equatable/equatable.dart';

class Dimensions extends Equatable {
  final double? width;
  final double? height;
  final double? depth;

  const Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json['width'] as num?)?.toDouble(),
        height: (json['height'] as num?)?.toDouble(),
        depth: (json['depth'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
        'depth': depth,
      };

  @override
  List<Object?> get props => [width, height, depth];
}
