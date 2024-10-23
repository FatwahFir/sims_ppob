class Service {
  String? serviceCode;
  String? serviceName;
  String? serviceIcon;
  int? serviceTariff;

  Service(
      {this.serviceCode,
      this.serviceName,
      this.serviceIcon,
      this.serviceTariff});

  Service.fromJson(Map<String, dynamic> json) {
    serviceCode = json['service_code'];
    serviceName = json['service_name'];
    serviceIcon = json['service_icon'];
    serviceTariff = json['service_tariff'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['service_code'] = serviceCode;
    data['service_name'] = serviceName;
    data['service_icon'] = serviceIcon;
    data['service_tariff'] = serviceTariff;
    return data;
  }
}
