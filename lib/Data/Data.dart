// ignore_for_file: file_names

class Data {
  List<Product> products = [
    Product(
        id: 1,
        name: "Bath & Beuty Hand Wash Pear Scent",
        description: "Armut kokusuna sahip el sabunu",
        imageUrl: "pearscent1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "hijyen",
        currency: "TL",
        secondImageUrl: "pearscent2.jpg"),
    Product(
        id: 2,
        name: "Bath & Beuty Hand Wash Fresh Scent",
        description: "El sabunu",
        imageUrl: "freshscent1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "hijyen",
        currency: "TL",
        secondImageUrl: "freshscent2.jpg"),
    Product(
        id: 3,
        name: "Bath & Beuty Nail Polish Remover Regular",
        description: "Kozmetik ürünü",
        imageUrl: "nailpolishremoverregular1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "nailpolishremoverregular2.jpg"),
    Product(
        id: 4,
        name: "Bath & Beuty Char Coal Acne Scrub",
        description: "Akne karşıtı maske",
        imageUrl: "charcoalacnescrub1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "charcoalacnescrub2.jpg"),
    Product(
        id: 5,
        name: "Bath & Beuty Shave Gel",
        description: "Erkeklere özel tıraş jeli",
        imageUrl: "shavegel1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "shavegel2.jpg"),
    Product(
        id: 6,
        name: "Bath & Beuty Nail Polish Remover Strengthening",
        description: "Tırnak temizleyicisi",
        imageUrl: "nailpolishremoverstrengthening1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "nailpolishremoverstrengthening2.jpg"),
    Product(
        id: 7,
        name: "Bath & Beuty Nail Shave Gel Aloavera",
        description: "Erkeklere özel alovera'lı tıraş jeli",
        imageUrl: "shavegelaloavera1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "shavegelaloavera2.jpg"),
    Product(
        id: 8,
        name: "Bath & Beuty Nail Polish Remover None-Acetone",
        description: "El sabunu",
        imageUrl: "nailpolishremovernoneacetone1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "nailpolishremovernoneacetone2.jpg"),
    Product(
        id: 9,
        name: "Bath & Beuty Nail Polish Remover Acetone",
        description: "ırnak temizleyicisi",
        imageUrl: "nailpolishremoveracetone1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "nailpolishremoveracetone2.jpg"),
    Product(
        id: 10,
        name: "Bath & Beuty Nail Polish Remover %100 Acetone",
        description: "Tırnak temizleyicisi",
        imageUrl: "nailpolishremover100acetone1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "kozmetik",
        currency: "TL",
        secondImageUrl: "nailpolishremover100acetone2.jpg"),
    Product(
        id: 11,
        name: "Bath & Beuty Melon&plum Body Mist",
        description: "Vücut spreyi",
        imageUrl: "melonplumbodymist1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "hijyen",
        currency: "TL",
        secondImageUrl: "melonplumbodymist1.jpg"),
    Product(
        id: 12,
        name: "Bath & Beuty Cherry&Blossom Body Mist",
        description: "Vücut spreyi",
        imageUrl: "cherryblossombodymist1.jpg",
        price: 25.99,
        trendyolUrl: "http://example.com",
        categoryName: "hijyen",
        currency: "TL",
        secondImageUrl: "cherryblossombodymist2.jpg"),
  ];
}

class Product {
  int id;
  String name;
  String description;
  String imageUrl;
  String secondImageUrl;
  double price;
  String trendyolUrl;
  String categoryName;
  String? detailedDesc;
  String currency;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.trendyolUrl,
      required this.categoryName,
      required this.secondImageUrl,
      required this.currency,
      this.detailedDesc});
}
