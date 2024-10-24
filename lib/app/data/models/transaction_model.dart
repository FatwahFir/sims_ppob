class Transaction {
  String? invoiceNumber;
  String? transactionType;
  String? description;
  int? totalAmount;
  String? createdOn;

  Transaction(
      {this.invoiceNumber,
      this.transactionType,
      this.description,
      this.totalAmount,
      this.createdOn});

  Transaction.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoice_number'];
    transactionType = json['transaction_type'];
    description = json['description'];
    totalAmount = json['total_amount'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['invoice_number'] = invoiceNumber;
    data['transaction_type'] = transactionType;
    data['description'] = description;
    data['total_amount'] = totalAmount;
    data['created_on'] = createdOn;
    return data;
  }
}
