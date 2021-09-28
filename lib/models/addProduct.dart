class addProduct {
  String barcoderesult;
  String name;
  DateTime startDate;
  DateTime endDate;
  double quantity;
  String category;

  addProduct(this.barcoderesult, this.name, this.startDate, this.endDate,
      this.quantity, this.category);

  Map<String, dynamic> toJson() => {
        'barcoderesult': barcoderesult,
        'name': name,
        'startDate': startDate,
        'endDate': endDate,
        'quantity': quantity,
        'category': category,
      };
}
