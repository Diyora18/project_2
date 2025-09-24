class NotificationModel {
  final int id;
  final String title;
  final String content;
  final DateTime? date;
  final String icon;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.icon,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
      icon: json['icon'],
    );
  }

  String get timeAgo {
    if (date == null) return "";

    final now = DateTime.now();
    final diff = now.difference(date!);

    if (diff.inSeconds < 60) {
      return "hozirgina";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} daqiqa oldin";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} soat oldin";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} kun oldin";
    } else if (diff.inDays < 30) {
      return "${(diff.inDays / 7).floor()} hafta oldin";
    } else if (diff.inDays < 365) {
      return "${(diff.inDays / 30).floor()} oy oldin";
    } else {
      return "${(diff.inDays / 365).floor()} yil oldin";
    }
  }
}
