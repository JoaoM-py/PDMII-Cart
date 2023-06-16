class Item {
  final String title;
  final String image;

  Item({required this.title, required this.image});

  static getProducts() {
    List<Item> items = [
        Item (
        title: 'Chuteira Society Fifty III Umbro - Preto+Lima',
        image: 'assets/images/fifty.png',
        ),

        Item (
        title: 'Chuteira Society Nike Beco 2 TF - Preto+Branco',
        image: 'assets/images/nike.png',
        ),


        Item (
        title: 'Chuteira Futsal Adidas Artilheira VI - Preto+Pink',
        image: 'assets/images/adidas.png',
        ),

      
    ];
    return items;
  }
}