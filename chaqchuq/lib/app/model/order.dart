


class Order {
    final int id ;
    final DateTime date ;
    final String status;
    final List<String> images;

    Order({required this.id, required this.date, required this.status, required this.images});

    Order copyWith({
        int? id,
        DateTime? date,
        String? status,
        List<String>? priimagesce,
    }) {
        return Order(
            id: id ?? this.id, 
            date: date ?? this.date, 
            status: status ?? this.status,
            images: images,
        );
    }
}