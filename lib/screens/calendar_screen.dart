import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedDay = 15;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F5F9),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kasım 2025',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Text(
                      'Cumartesi, 15 Kasım',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F5F9),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F5F9),
                ),
              ),
            ],
          ),
        ),

        // Tabs
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            labelColor: const Color(0xFF0F172A),
            unselectedLabelColor: const Color(0xFF64748B),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: 'Günlük'),
              Tab(text: 'Haftalık'),
              Tab(text: 'Aylık'),
            ],
          ),
        ),

        // Tab Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDailyView(),
              _buildWeeklyView(),
              _buildMonthlyView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonthlyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Days of week header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz']
                        .map((day) => SizedBox(
                              width: 40,
                              child: Text(
                                day,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
                  // Calendar grid
                  _buildCalendarGrid(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '15 Kasım - Bugün',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          _buildEventItem(
            title: 'Kira Ödemesi',
            category: 'Finans',
            color: const Color(0xFF10B981),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // November 2025 starts on Saturday (index 5)
    final firstDayOffset = 5;
    final daysInMonth = 30;
    final totalCells = ((firstDayOffset + daysInMonth) / 7).ceil() * 7;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        if (index < firstDayOffset || index >= firstDayOffset + daysInMonth) {
          return const SizedBox();
        }

        final day = index - firstDayOffset + 1;
        final isToday = day == _selectedDay;
        final hasEvents = [15, 16, 18, 20, 22, 25].contains(day);

        return InkWell(
          onTap: () {
            setState(() {
              _selectedDay = day;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: isToday ? const Color(0xFFEEF2FF) : null,
              border: isToday
                  ? Border.all(color: const Color(0xFF4F46E5), width: 2)
                  : Border.all(color: const Color(0xFFF1F5F9)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: isToday
                        ? const Color(0xFF4F46E5)
                        : const Color(0xFF334155),
                  ),
                ),
                if (hasEvents) ...[
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3B82F6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeeklyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildWeekDayCard(
            day: 'Pazartesi',
            date: '18 Kas',
            eventCount: 2,
            events: [
              ('09:00', 'Kira Ödemesi', 'Finans', Color(0xFF10B981)),
              ('18:30', 'Spor Salonu', 'Sağlık', Color(0xFFF43F5E)),
            ],
          ),
          const SizedBox(height: 12),
          _buildWeekDayCard(
            day: 'Salı',
            date: '19 Kas',
            eventCount: 2,
            events: [
              ('14:00', 'Ekip Toplantısı', 'İş', Color(0xFFF59E0B)),
              ('20:00', 'Online Kurs', 'Eğitim', Color(0xFF3B82F6)),
            ],
          ),
          const SizedBox(height: 12),
          _buildWeekDayCard(
            day: 'Çarşamba',
            date: '20 Kas',
            eventCount: 1,
            events: [
              ('17:00', 'Proje Teslimi', 'İş', Color(0xFFF59E0B)),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildWeekDayCard({
    required String day,
    required String date,
    required int eventCount,
    required List<(String, String, String, Color)> events,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    eventCount.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF334155),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...events.map((event) {
              final (time, title, category, color) = event;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildDailyEventItem(
                time: '07:00',
                title: 'Sabah Koşusu',
                category: 'Sağlık',
                color: const Color(0xFFF43F5E),
                completed: true,
              ),
              const SizedBox(height: 12),
              _buildDailyEventItem(
                time: '09:00',
                title: 'Takım Toplantısı',
                category: 'İş',
                color: const Color(0xFFF59E0B),
                completed: true,
              ),
              const SizedBox(height: 12),
              _buildDailyEventItem(
                time: '14:00',
                title: 'Müşteri Görüşmesi',
                category: 'İş',
                color: const Color(0xFFF59E0B),
                completed: false,
              ),
              const SizedBox(height: 12),
              _buildDailyEventItem(
                time: '18:30',
                title: 'Yoga Dersi',
                category: 'Sağlık',
                color: const Color(0xFFF43F5E),
                completed: false,
              ),
              const SizedBox(height: 12),
              _buildDailyEventItem(
                time: '21:00',
                title: 'Günlük Okuma',
                category: 'Eğitim',
                color: const Color(0xFF3B82F6),
                completed: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyEventItem({
    required String time,
    required String title,
    required String category,
    required Color color,
    required bool completed,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: completed ? const Color(0xFFF8FAFC) : Colors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              Checkbox(
                value: completed,
                onChanged: (value) {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Container(
            width: 4,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: completed
                        ? const Color(0xFF94A3B8)
                        : const Color(0xFF0F172A),
                    decoration: completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem({
    required String title,
    required String category,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
