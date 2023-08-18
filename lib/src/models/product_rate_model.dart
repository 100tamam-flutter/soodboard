class ProductRateModel {
  final int count;
  final double rate;

  const ProductRateModel({required this.count, required this.rate});

  factory ProductRateModel.fromJson(Map<String, dynamic> json) {
    return ProductRateModel(
      count: json['count'] as int,
      rate: json['rate'] as double,
    );
  }
}
