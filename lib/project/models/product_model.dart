class Product {
  final String title;
  final String detail;
  final double price;
  final int weight;
  final WeightUnit weightUnit;
  final List<ProductCategory> categories;
  final String image;

  Product({
    required this.title,
    required this.detail,
    required this.price,
    required this.weight,
    required this.weightUnit,
    required this.categories,
    required this.image,
  });
}

enum WeightUnit {
  kilos(prefix: 'kg'),
  liters(prefix: 'L'),
  millilitre(prefix: 'ml'),
  ;

  final String prefix;

  const WeightUnit({required this.prefix});
}

enum ProductCategory {
  fruits,
  vegetables,
  bakery,
  beverages,
}

final products = [
  Product(
    title: 'Organic Bananas',
    detail:
        'Porta consetetur dignissim te disputationi volutpat cu populo dicta sumo. Nunc iaculis similique iaculis dis natoque ut luctus auctor efficitur. Dicat patrioque suscipit convenire molestiae adipiscing similique sale facilisi. Interesset fabulas aperiri ea eius lacinia neglegentur euripidis aenean. Tamquam nascetur himenaeos ultricies deterruisset ea mel tamquam.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.fruits,
    ],
    image: ('assets/images/fruits/banana.png'),
  ),
  Product(
    title: 'Red Apple',
    detail:
        'Fringilla eleifend possit varius sapien suscipit molestiae in curabitur odio. Reprimique audire his dico porro quo efficitur populo suavitate. Malorum faucibus tamquam regione cubilia fringilla maiestatis nonumy mentitum. Efficiantur alterum postulant volutpat dui causae ac pertinax qui. Etiam delicata aptent aenean referrentur meliore pericula.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.fruits,
    ],
    image: ('assets/images/fruits/apple.png'),
  ),
  Product(
    title: 'Bell Pepper Red',
    detail:
        'Libero sonet perpetua detracto phasellus vero aptent honestatis. Porro semper blandit eius his definitiones quem tellus. Sea consul eripuit definiebas omnesque sapien antiopam. Partiendo ornatus dicant vocent dicit reformidans decore inani. Torquent affert fastidii honestatis splendide nisi repudiandae.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.vegetables,
    ],
    image: ('assets/images/vegetables/bell_pepper_red.png'),
  ),
  Product(
    title: 'Ginger',
    detail:
        'Pharetra lobortis vivendo luptatum convenire accumsan lectus option quaerendum sollicitudin. Ocurreret dolore non utamur magnis liber. Petentium interdum erroribus netus prompta. Sapientem nisi hac ultrices auctor scripta egestas minim wisi. Suas hac duo option fuisset bibendum comprehensam dicta.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.vegetables,
    ],
    image: ('assets/images/vegetables/ginger.png'),
  ),  Product(
    title: 'Egg planet',
    detail:
        'Pharetra lobortis vivendo luptatum convenire accumsan lectus option quaerendum sollicitudin. Ocurreret dolore non utamur magnis liber. Petentium interdum erroribus netus prompta. Sapientem nisi hac ultrices auctor scripta egestas minim wisi. Suas hac duo option fuisset bibendum comprehensam dicta.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.vegetables,
    ],
    image: ('assets/images/vegetables/egg_planet.png'),
  ),
  Product(
    title: 'Mango',
    detail:
        'Splendide tristique luctus velit ridens explicari et docendi egestas repudiandae. Amet electram eum suas quam ceteros. Quis a in mutat per. Sit autem aliquam nunc altera porro. Accusata deserunt quam audire per commune veniam natoque.',
    price: 4.99,
    weight: 1,
    weightUnit: WeightUnit.kilos,
    categories: [
      ProductCategory.fruits,
    ],
    image: ('assets/images/fruits/mango.png'),
  ),
  Product(
    title: 'Apple Grape Juice',
    detail:
        'Agam suscipit persius cras hinc periculis fabulas augue. Commune sale te signiferumque neque oporteat. Ultricies qui cursus brute voluptatibus. Tellus nam invidunt luctus corrumpit cursus electram ex. Mazim offendit postulant consetetur nibh.',
    price: 15.99,
    weight: 2,
    weightUnit: WeightUnit.liters,
    categories: [
      ProductCategory.beverages,
    ],
    image: ('assets/images/beverages/apple_grape_juice.png'),
  ),
  Product(
    title: 'Sprite',
    detail:
        'Agam suscipit persius cras hinc periculis fabulas augue. Commune sale te signiferumque neque oporteat. Ultricies qui cursus brute voluptatibus. Tellus nam invidunt luctus corrumpit cursus electram ex. Mazim offendit postulant consetetur nibh.',
    price: 1.5,
    weight: 325,
    weightUnit: WeightUnit.millilitre,
    categories: [
      ProductCategory.beverages,
    ],
    image: ('assets/images/beverages/sprite_can.png'),
  ),
  Product(
    title: 'Orange Juice',
    detail:
        'Agam suscipit persius cras hinc periculis fabulas augue. Commune sale te signiferumque neque oporteat. Ultricies qui cursus brute voluptatibus. Tellus nam invidunt luctus corrumpit cursus electram ex. Mazim offendit postulant consetetur nibh.',
    price: 15.99,
    weight: 2,
    weightUnit: WeightUnit.liters,
    categories: [
      ProductCategory.beverages,
    ],
    image: ('assets/images/beverages/orange_juice.png'),
  ),
  Product(
    title: 'Diet Coke',
    detail:
        'Agam suscipit persius cras hinc periculis fabulas augue. Commune sale te signiferumque neque oporteat. Ultricies qui cursus brute voluptatibus. Tellus nam invidunt luctus corrumpit cursus electram ex. Mazim offendit postulant consetetur nibh.',
    price: 1.99,
    weight: 355,
    weightUnit: WeightUnit.millilitre,
    categories: [
      ProductCategory.beverages,
    ],
    image: ('assets/images/beverages/diet_coke.png'),
  ),
];
