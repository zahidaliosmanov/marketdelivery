class ProductClass{
  final String pictureName;
  final String name;
  final String price;
  final String weightNumb;
  final String finalPrice;
  final String selectedUnit;
  ProductClass(this.pictureName, this.name, this.price, this.weightNumb, this.finalPrice, this.selectedUnit);

  @override
  String toString() {
    return ",${this.pictureName},${this.name},${this.price},${this.weightNumb},${this.finalPrice},${this.selectedUnit}";
  }
}