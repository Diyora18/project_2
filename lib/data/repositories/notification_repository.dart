
import '../../core/client/client.dart';
import '../../core/result.dart';
import '../models/notification_model.dart';

class NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepository({required ApiClient apiClient})
      : _apiClient = apiClient;

  Future<Result<List<NotificationModel>>> getNotifications() async {
    final result = await _apiClient.get('/notifications/list');

    return result.fold(
          (e) => Result.error(e),
          (data) {
        if (data is List) {
          final notifications = data
              .map((x) => NotificationModel.fromJson(x))
              .toList();

          return Result.ok(notifications);
        } else {
          return Result.error(Exception("Xatolik"));
        }
      },
    );
  }
}
