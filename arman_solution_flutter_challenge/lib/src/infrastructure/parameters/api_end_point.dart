class ApiEndPoint {
  static const String baseUrl = 'https://interview.aval.dev/api/';

  static const String loginUrl = 'login';
  static const String getAllTasksUrl = 'todo-list/list';
  static const String addTaskUrl = 'todo-list/add';

  static String changeTaskStateUrl(final int id) => 'todo-list/change-done/$id';

  static String updateTaskUrl(final int id) => 'todo-list/update/$id';

  static String getTaskByIdUrl(final int id) => 'todo-list/show/$id';

  static String logoutUrl() => 'logout';
}
