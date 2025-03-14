



class MyAddressModel {
    final int? id;
    final String addressName;
    final String street;
    final String city;
    final String region;
    final double latitude;
    final double longitude;

    MyAddressModel({
        this.id,
        this.addressName = "", 
        this.street = "", 
        this.city = "", 
        this.region = "", 
        this.latitude = 41.311155, 
        this.longitude= 69.279732, 
      
    });

    MyAddressModel copyWith({
        int? id,
        String? addressName,
        String? street,
        String? city,
        String? region,
        double? latitude,
        double? longitude,
    }) {
        return MyAddressModel(
            id: id ?? this.id,
            addressName: addressName ?? this.addressName,
            street: street ?? this.street,
            city: city ?? this.city,
            region: region ?? this.region,       
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            
        );
    }

    factory MyAddressModel.fromJson(Map<String, dynamic> json) {
        return MyAddressModel(
            id: json['id'],
            addressName: json['addressName'] ?? "", 
            street: json['street'] ?? "",           
            city: json['city'] ?? "",               
            region: json['region'] ?? "",                         
            latitude: (json['latitude'] ?? 41.311155).toDouble(),
            longitude: (json['longitude'] ?? 69.279732).toDouble(),
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'addressName': addressName,
            'street': street,
            'city': city,
            'region': region,
            'latitude': latitude,
            'longitude': longitude,
        };
    }


    static List<MyAddressModel> fromJsonList(List<dynamic> jsonList) {
        return jsonList.map((json) => MyAddressModel.fromJson(json)).toList();
    }
} 