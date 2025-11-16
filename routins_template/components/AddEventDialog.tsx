import { useState } from 'react';
import { Calendar, Clock, DollarSign, BookOpen, Heart, Briefcase, Repeat, Tag } from 'lucide-react';
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from './ui/dialog';
import { Label } from './ui/label';
import { Input } from './ui/input';
import { Textarea } from './ui/textarea';
import { Button } from './ui/button';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from './ui/select';
import { Tabs, TabsContent, TabsList, TabsTrigger } from './ui/tabs';

const categories = [
  { id: 'finance', name: 'Finans', icon: DollarSign, color: 'bg-emerald-500' },
  { id: 'education', name: 'Eğitim', icon: BookOpen, color: 'bg-blue-500' },
  { id: 'health', name: 'Sağlık', icon: Heart, color: 'bg-rose-500' },
  { id: 'work', name: 'İş', icon: Briefcase, color: 'bg-amber-500' },
];

interface AddEventDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function AddEventDialog({ open, onOpenChange }: AddEventDialogProps) {
  const [selectedCategory, setSelectedCategory] = useState('');
  const [eventType, setEventType] = useState<'one-time' | 'routine'>('one-time');

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-[90%] rounded-2xl max-h-[85vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>Yeni Etkinlik Ekle</DialogTitle>
        </DialogHeader>

        <Tabs value={eventType} onValueChange={(v) => setEventType(v as 'one-time' | 'routine')}>
          <TabsList className="grid w-full grid-cols-2">
            <TabsTrigger value="one-time">Tek Seferlik</TabsTrigger>
            <TabsTrigger value="routine">Rutin</TabsTrigger>
          </TabsList>

          <TabsContent value="one-time" className="space-y-4 mt-4">
            {/* Event Title */}
            <div className="space-y-2">
              <Label htmlFor="title">Başlık</Label>
              <Input
                id="title"
                placeholder="Örn: Doktor Randevusu"
              />
            </div>

            {/* Category Selection */}
            <div className="space-y-2">
              <Label>Kategori</Label>
              <div className="grid grid-cols-2 gap-2">
                {categories.map((category) => {
                  const Icon = category.icon;
                  return (
                    <button
                      key={category.id}
                      onClick={() => setSelectedCategory(category.id)}
                      className={`flex items-center gap-2 p-3 rounded-lg border-2 transition-all ${
                        selectedCategory === category.id
                          ? 'border-indigo-500 bg-indigo-50'
                          : 'border-slate-200 hover:border-slate-300'
                      }`}
                    >
                      <div className={`${category.color} w-8 h-8 rounded-lg flex items-center justify-center`}>
                        <Icon className="w-4 h-4 text-white" />
                      </div>
                      <span className="text-sm text-slate-700">{category.name}</span>
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Date and Time */}
            <div className="grid grid-cols-2 gap-3">
              <div className="space-y-2">
                <Label htmlFor="date">Tarih</Label>
                <div className="relative">
                  <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                  <Input
                    id="date"
                    type="date"
                    className="pl-10"
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="time">Saat</Label>
                <div className="relative">
                  <Clock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                  <Input
                    id="time"
                    type="time"
                    className="pl-10"
                  />
                </div>
              </div>
            </div>

            {/* Event Type */}
            <div className="space-y-2">
              <Label htmlFor="event-type">Etkinlik Tipi</Label>
              <Select>
                <SelectTrigger id="event-type">
                  <SelectValue placeholder="Seçiniz" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="appointment">Randevu</SelectItem>
                  <SelectItem value="payment">Ödeme</SelectItem>
                  <SelectItem value="deadline">Deadline</SelectItem>
                  <SelectItem value="reminder">Hatırlatma</SelectItem>
                  <SelectItem value="other">Diğer</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {/* Notes */}
            <div className="space-y-2">
              <Label htmlFor="notes">Notlar (Opsiyonel)</Label>
              <Textarea
                id="notes"
                placeholder="Ekstra detaylar..."
                className="resize-none"
                rows={3}
              />
            </div>

            {/* Action Buttons */}
            <div className="flex gap-2 pt-2">
              <Button
                variant="outline"
                className="flex-1"
                onClick={() => onOpenChange(false)}
              >
                İptal
              </Button>
              <Button
                className="flex-1 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700"
                onClick={() => onOpenChange(false)}
              >
                Kaydet
              </Button>
            </div>
          </TabsContent>

          <TabsContent value="routine" className="space-y-4 mt-4">
            {/* Routine Title */}
            <div className="space-y-2">
              <Label htmlFor="routine-title">Başlık</Label>
              <Input
                id="routine-title"
                placeholder="Örn: Sabah Koşusu"
              />
            </div>

            {/* Category Selection */}
            <div className="space-y-2">
              <Label>Kategori</Label>
              <div className="grid grid-cols-2 gap-2">
                {categories.map((category) => {
                  const Icon = category.icon;
                  return (
                    <button
                      key={category.id}
                      onClick={() => setSelectedCategory(category.id)}
                      className={`flex items-center gap-2 p-3 rounded-lg border-2 transition-all ${
                        selectedCategory === category.id
                          ? 'border-indigo-500 bg-indigo-50'
                          : 'border-slate-200 hover:border-slate-300'
                      }`}
                    >
                      <div className={`${category.color} w-8 h-8 rounded-lg flex items-center justify-center`}>
                        <Icon className="w-4 h-4 text-white" />
                      </div>
                      <span className="text-sm text-slate-700">{category.name}</span>
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Frequency */}
            <div className="space-y-2">
              <Label htmlFor="frequency">Tekrar Sıklığı</Label>
              <Select>
                <SelectTrigger id="frequency">
                  <SelectValue placeholder="Seçiniz" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="daily">Her Gün</SelectItem>
                  <SelectItem value="weekdays">Hafta İçi</SelectItem>
                  <SelectItem value="weekends">Hafta Sonu</SelectItem>
                  <SelectItem value="weekly">Haftalık</SelectItem>
                  <SelectItem value="biweekly">İki Haftada Bir</SelectItem>
                  <SelectItem value="monthly">Aylık</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {/* Time */}
            <div className="space-y-2">
              <Label htmlFor="routine-time">Saat</Label>
              <div className="relative">
                <Clock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400" />
                <Input
                  id="routine-time"
                  type="time"
                  className="pl-10"
                />
              </div>
            </div>

            {/* Start and End Date */}
            <div className="grid grid-cols-2 gap-3">
              <div className="space-y-2">
                <Label htmlFor="start-date">Başlangıç</Label>
                <Input
                  id="start-date"
                  type="date"
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="end-date">Bitiş (Opsiyonel)</Label>
                <Input
                  id="end-date"
                  type="date"
                />
              </div>
            </div>

            {/* Notes */}
            <div className="space-y-2">
              <Label htmlFor="routine-notes">Notlar (Opsiyonel)</Label>
              <Textarea
                id="routine-notes"
                placeholder="Ekstra detaylar..."
                className="resize-none"
                rows={3}
              />
            </div>

            {/* Action Buttons */}
            <div className="flex gap-2 pt-2">
              <Button
                variant="outline"
                className="flex-1"
                onClick={() => onOpenChange(false)}
              >
                İptal
              </Button>
              <Button
                className="flex-1 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700"
                onClick={() => onOpenChange(false)}
              >
                Kaydet
              </Button>
            </div>
          </TabsContent>
        </Tabs>
      </DialogContent>
    </Dialog>
  );
}
