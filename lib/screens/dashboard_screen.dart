import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('EEEE, d MMMM y', 'tr_TR').format(DateTime.now());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hoş Geldiniz 👋',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A), // slate-900
                ),
              ),
              const SizedBox(height: 4),
              Text(
                today,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B), // slate-500
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Categories Section
          const Text(
            'Kategoriler',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: const [
              CategoryCard(
                name: 'Finans',
                icon: Icons.attach_money,
                color: Color(0xFF10B981), // emerald-500
                count: 3,
              ),
              CategoryCard(
                name: 'Eğitim',
                icon: Icons.school_outlined,
                color: Color(0xFF3B82F6), // blue-500
                count: 5,
              ),
              CategoryCard(
                name: 'Sağlık',
                icon: Icons.favorite_outline,
                color: Color(0xFFF43F5E), // rose-500
                count: 2,
              ),
              CategoryCard(
                name: 'İş',
                icon: Icons.work_outline,
                color: Color(0xFFF59E0B), // amber-500
                count: 4,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Today's Routines
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bugünkü Rutinler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right, size: 16),
                label: const Text('Tümü'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF4F46E5),
                  textStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildRoutineItem(
                    title: 'Sabah Koşusu',
                    time: '07:00',
                    completed: true,
                    isLast: false,
                  ),
                  _buildRoutineItem(
                    title: 'Günlük Okuma',
                    time: '21:00',
                    completed: false,
                    isLast: false,
                  ),
                  _buildRoutineItem(
                    title: 'Bütçe Kontrolü',
                    time: '22:00',
                    completed: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Upcoming Events
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Yaklaşan Etkinlikler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right, size: 16),
                label: const Text('Tümü'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF4F46E5),
                  textStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const EventCard(
            title: 'Kira Ödemesi',
            categoryColor: Color(0xFF10B981),
            date: '18 Kas',
            time: '09:00',
            type: 'Ödeme',
          ),
          const SizedBox(height: 12),
          const EventCard(
            title: 'Yoga Dersi',
            categoryColor: Color(0xFFF43F5E),
            date: '16 Kas',
            time: '18:30',
            type: 'Rutin',
          ),
          const SizedBox(height: 12),
          const EventCard(
            title: 'İngilizce Kursu',
            categoryColor: Color(0xFF3B82F6),
            date: '16 Kas',
            time: '20:00',
            type: 'Rutin',
          ),
          const SizedBox(height: 12),
          const EventCard(
            title: 'Proje Teslimi',
            categoryColor: Color(0xFFF59E0B),
            date: '20 Kas',
            time: '17:00',
            type: 'Deadline',
          ),
          const SizedBox(height: 80), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildRoutineItem({
    required String title,
    required String time,
    required bool completed,
    required bool isLast,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: completed,
              onChanged: (value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: completed
                          ? const Color(0xFF94A3B8)
                          : const Color(0xFF0F172A),
                      decoration:
                          completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 12,
                        color: Color(0xFF94A3B8),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLast)
          const Divider(
            height: 24,
            color: Color(0xFFF1F5F9),
          ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final int count;

  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final Color categoryColor;
  final String date;
  final String time;
  final String type;

  const EventCard({
    super.key,
    required this.title,
    required this.categoryColor,
    required this.date,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  color: categoryColor,
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
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF475569),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
