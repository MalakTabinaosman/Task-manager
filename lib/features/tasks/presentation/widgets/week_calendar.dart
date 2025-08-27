import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/tasks_cubit.dart';

/// A horizontally scrollable week calendar.
/// - Scroll left to go to next week
/// - Scroll right to go to previous week
/// - Tap a date to select it
class WeekCalendar extends StatefulWidget {
  const WeekCalendar({super.key});

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late final PageController _controller;
  static const int _initialPage = 10000; // large to allow infinite-like scroll

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          return PageView.builder(
            controller: _controller,
            onPageChanged: (page) {
              final delta = page - _initialPage;
              context.read<TasksCubit>().shiftWeek(delta);
              _controller.jumpToPage(
                _initialPage,
              ); // reset to center for repeated deltas
            },
            itemBuilder: (context, _) {
              // Ensure week starts on Sunday consistently
              final days = List.generate(
                7,
                (i) => state.weekStart.add(Duration(days: i)),
              );
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: days.map((d) {
                  final isSelected =
                      d.year == state.selectedDate.year &&
                      d.month == state.selectedDate.month &&
                      d.day == state.selectedDate.day;
                  return _DayChip(
                    date: d,
                    selected: isSelected,
                    onTap: () => context.read<TasksCubit>().setSelectedDate(d),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  final DateTime date;
  final bool selected;
  final VoidCallback onTap;
  const _DayChip({
    required this.date,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final label = '${date.day}/${date.month}';
    return AnimatedScale(
      duration: const Duration(milliseconds: 150),
      scale: selected ? 1.1 : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? Theme.of(context).colorScheme.primary.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _weekdayLabel(date.weekday),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 4),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }

  String _weekdayLabel(int weekday) {
    switch (weekday) {
      case DateTime.sunday:
        return 'Sun';
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      default:
        return '';
    }
  }
}
