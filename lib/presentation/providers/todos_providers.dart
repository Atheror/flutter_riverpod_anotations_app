import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_anotations_app/config/config.dart';
import 'package:uuid/uuid.dart';

import 'package:riverpod_anotations_app/domain/domain.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void setCurrentFilter(FilterType newFilter) {
    state = newFilter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() => [
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      ];

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(completedAt: todo.done ? null : DateTime.now());
      } else {
        return todo;
      }
    }).toList();
  }

  void createTodo(String description) {
    state = [
      ...state,
      Todo(
        id: uuid.v4(),
        description: description,
        completedAt: null,
      )
    ];
  }
}
