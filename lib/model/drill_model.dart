class Drill {
  String drillName;
  int count;
  Drill({required this.drillName, required this.count});
  factory Drill.fromJson(Map<String, dynamic> json) {
    return Drill(
      drillName: json['drillName'] as String,
      count: json['count'] as int,
    );
  }
}
