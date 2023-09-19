import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  //notifier + state
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null)
        ]);

  void addTodo() {
    state = [
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      ...state
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;
      if (todo.done) return todo.copyWith(completed: null);
      return todo.copyWith(completed: DateTime.now());
      //return todo;
    }).toList();
  }
}
