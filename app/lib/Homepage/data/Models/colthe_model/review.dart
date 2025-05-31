import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  const Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json['rating'] as int?,
        comment: json['comment'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        reviewerName: json['reviewerName'] as String?,
        reviewerEmail: json['reviewerEmail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
        'date': date?.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };

  @override
  List<Object?> get props {
    return [
      rating,
      comment,
      date,
      reviewerName,
      reviewerEmail,
    ];
  }
}
