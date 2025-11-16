import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/routine.dart';
import '../providers/routine_provider.dart';

class AddRoutineScreen extends StatefulWidget {
  final Routine? routine;

  const AddRoutineScreen({super.key, this.routine});

  @override
  State<AddRoutineScreen> createState() => _AddRoutineScreenState();
}

class _AddRoutineScreenState extends State<AddRoutineScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String _selectedCategory = 'Sağlık';

  final List<String> _categories = [
    'Sağlık',
    'Spor',
    'Eğitim',
    'İş',
    'Kişisel Gelişim',
    'Hobi',
    'Diğer',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.routine?.title ?? '');
    _descriptionController = TextEditingController(text: widget.routine?.description ?? '');
    if (widget.routine != null) {
      _selectedCategory = widget.routine!.category;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveRoutine() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<RoutineProvider>(context, listen: false);

      if (widget.routine == null) {
        // Yeni rutin ekle
        final routine = Routine(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: _titleController.text,
          description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
          category: _selectedCategory,
          completedDays: List.filled(7, false),
          createdAt: DateTime.now(),
        );
        provider.addRoutine(routine);
      } else {
        // Mevcut rutini güncelle
        final updatedRoutine = widget.routine!.copyWith(
          title: _titleController.text,
          description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
          category: _selectedCategory,
        );
        provider.updateRoutine(updatedRoutine);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.routine != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Rutini Düzenle' : 'Yeni Rutin Ekle'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Rutin Adı',
                hintText: 'Örn: Sabah Koşusu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.title),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen bir rutin adı girin';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Açıklama (Opsiyonel)',
                hintText: 'Rutin hakkında notlar...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.category),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _saveRoutine,
              icon: const Icon(Icons.check),
              label: Text(isEditing ? 'Güncelle' : 'Kaydet'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
