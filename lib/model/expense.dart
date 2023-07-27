import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  Food,
  Clothing,
  Travel,
  Leisure,
  Work,
  Rent,
  Other
}

const categoryIcons = {
  Category.Food: Icons.fastfood,
  Category.Clothing: Icons.shopping_bag,
  Category.Travel: Icons.flight_takeoff,
  Category.Leisure: Icons.movie,
  Category.Work: Icons.work,
  Category.Rent: Icons.house,
  Category.Other: Icons.money
};

class Expense {

  Expense(
      {
        required this.title,
        required this.amount,
        required this.date,
        required this.category
      }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate{
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;

    // Course
    // for (final expense in expenses) {

    // Copilot
    // return expenses.fold(0.0, (previousValue, expense) => previousValue + expense.amount);
  }
}