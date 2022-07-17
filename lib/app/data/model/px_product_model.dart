class PxProducts {
  final String category;
  final String company;
  final String name;
  final String detail;
  final String image;
  final int price;
  final int rank;

  // constructor
  const PxProducts({
    required this.category,
    required this.company,
    required this.name,
    required this.detail,
    required this.image,
    required this.price,
    required this.rank,
  });

  // json -> map 으로....네트웍으로 온 json 을 다트 오브젝트인 Map 으로 (들어오는 데이터?)
  factory PxProducts.fromJson(Map<String, dynamic> json) {
    return PxProducts(
      category: json['category'] ?? "",
      company: json['company'] ?? "",
      name: json['name'] ?? "",
      detail: json['detail'] ?? "",
      image: json['image'] ?? "",
      price: json['price'] ?? 0,
      rank: json['rank'] ?? 0,
    );
  }
  //
  // // 다트 오브젝트인 Map 을 서버에 보낼 json 타입으로 변경  (나가는 데이터?)
  // Map<String, dynamic> toJson() {
  //   return {
  //     'category': category,
  //     'company': company,
  //     'name': name,
  //     'detail': detail,
  //     'image': image,
  //     'price': price,
  //     'rank': rank,
  //   };
  // }
}
