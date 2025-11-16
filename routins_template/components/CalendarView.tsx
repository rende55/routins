import { useState } from 'react';
import { ChevronLeft, ChevronRight, Filter } from 'lucide-react';
import { Card, CardContent } from './ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from './ui/tabs';
import { Badge } from './ui/badge';

const daysOfWeek = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];

const monthEvents = [
  { day: 15, category: 'finance', title: 'Kira Ödemesi', color: 'bg-emerald-500' },
  { day: 16, category: 'health', title: 'Yoga', color: 'bg-rose-500' },
  { day: 16, category: 'education', title: 'İngilizce', color: 'bg-blue-500' },
  { day: 18, category: 'work', title: 'Toplantı', color: 'bg-amber-500' },
  { day: 20, category: 'work', title: 'Proje Teslim', color: 'bg-amber-500' },
  { day: 22, category: 'health', title: 'Doktor', color: 'bg-rose-500' },
  { day: 25, category: 'finance', title: 'Fatura', color: 'bg-emerald-500' },
];

const weekSchedule = [
  {
    day: 'Pazartesi',
    date: '18 Kas',
    events: [
      { time: '09:00', title: 'Kira Ödemesi', category: 'Finans', color: 'bg-emerald-500' },
      { time: '18:30', title: 'Spor Salonu', category: 'Sağlık', color: 'bg-rose-500' },
    ],
  },
  {
    day: 'Salı',
    date: '19 Kas',
    events: [
      { time: '14:00', title: 'Ekip Toplantısı', category: 'İş', color: 'bg-amber-500' },
      { time: '20:00', title: 'Online Kurs', category: 'Eğitim', color: 'bg-blue-500' },
    ],
  },
  {
    day: 'Çarşamba',
    date: '20 Kas',
    events: [
      { time: '17:00', title: 'Proje Teslimi', category: 'İş', color: 'bg-amber-500' },
    ],
  },
];

const todaySchedule = [
  { time: '07:00', title: 'Sabah Koşusu', category: 'Sağlık', color: 'bg-rose-500', completed: true },
  { time: '09:00', title: 'Takım Toplantısı', category: 'İş', color: 'bg-amber-500', completed: true },
  { time: '14:00', title: 'Müşteri Görüşmesi', category: 'İş', color: 'bg-amber-500', completed: false },
  { time: '18:30', title: 'Yoga Dersi', category: 'Sağlık', color: 'bg-rose-500', completed: false },
  { time: '21:00', title: 'Günlük Okuma', category: 'Eğitim', color: 'bg-blue-500', completed: false },
];

function generateCalendarDays() {
  const days = [];
  const today = 15; // November 15, 2025
  const firstDayOfMonth = 6; // Saturday (0 = Sunday, 6 = Saturday)
  const daysInMonth = 30;

  // Add empty cells for days before the first day of the month
  for (let i = 0; i < firstDayOfMonth; i++) {
    days.push(null);
  }

  // Add all days of the month
  for (let i = 1; i <= daysInMonth; i++) {
    days.push(i);
  }

  return { days, today };
}

export function CalendarView() {
  const [view, setView] = useState<'day' | 'week' | 'month'>('month');
  const { days, today } = generateCalendarDays();

  const getEventsForDay = (day: number | null) => {
    if (!day) return [];
    return monthEvents.filter((event) => event.day === day);
  };

  return (
    <div className="p-6 space-y-6 pb-8">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <button className="p-2 hover:bg-slate-100 rounded-lg transition-colors">
            <ChevronLeft className="w-5 h-5 text-slate-700" />
          </button>
          <div>
            <h2 className="text-slate-900">Kasım 2025</h2>
            <p className="text-slate-500 text-sm">Cumartesi, 15 Kasım</p>
          </div>
          <button className="p-2 hover:bg-slate-100 rounded-lg transition-colors">
            <ChevronRight className="w-5 h-5 text-slate-700" />
          </button>
        </div>
        <button className="p-2 hover:bg-slate-100 rounded-lg transition-colors">
          <Filter className="w-5 h-5 text-slate-700" />
        </button>
      </div>

      {/* View Tabs */}
      <Tabs value={view} onValueChange={(v) => setView(v as 'day' | 'week' | 'month')}>
        <TabsList className="grid w-full grid-cols-3">
          <TabsTrigger value="day">Günlük</TabsTrigger>
          <TabsTrigger value="week">Haftalık</TabsTrigger>
          <TabsTrigger value="month">Aylık</TabsTrigger>
        </TabsList>

        {/* Monthly View */}
        <TabsContent value="month" className="mt-6 space-y-4">
          <Card className="border-slate-200">
            <CardContent className="p-4">
              {/* Days of week header */}
              <div className="grid grid-cols-7 gap-1 mb-2">
                {daysOfWeek.map((day) => (
                  <div key={day} className="text-center text-xs text-slate-500 py-2">
                    {day}
                  </div>
                ))}
              </div>

              {/* Calendar grid */}
              <div className="grid grid-cols-7 gap-1">
                {days.map((day, index) => {
                  const events = getEventsForDay(day);
                  const isToday = day === today;

                  return (
                    <div
                      key={index}
                      className={`min-h-[60px] p-1 rounded-lg border ${
                        day ? 'border-slate-100 hover:bg-slate-50 cursor-pointer' : 'border-transparent'
                      } ${isToday ? 'bg-indigo-50 border-indigo-200' : ''}`}
                    >
                      {day && (
                        <>
                          <div
                            className={`text-sm text-center mb-1 ${
                              isToday ? 'text-indigo-600' : 'text-slate-700'
                            }`}
                          >
                            {day}
                          </div>
                          <div className="space-y-0.5">
                            {events.slice(0, 2).map((event, i) => (
                              <div
                                key={i}
                                className={`${event.color} h-1 rounded-full`}
                              />
                            ))}
                          </div>
                        </>
                      )}
                    </div>
                  );
                })}
              </div>
            </CardContent>
          </Card>

          {/* Event List for Selected Day */}
          <div>
            <h3 className="text-slate-900 mb-3">15 Kasım - Bugün</h3>
            <div className="space-y-2">
              {monthEvents
                .filter((e) => e.day === today)
                .map((event, i) => (
                  <Card key={i} className="border-slate-200">
                    <CardContent className="p-3 flex gap-3">
                      <div className={`${event.color} w-1 rounded-full`} />
                      <div className="flex-1">
                        <p className="text-slate-900">{event.title}</p>
                        <p className="text-xs text-slate-500 mt-1">{event.category}</p>
                      </div>
                    </CardContent>
                  </Card>
                ))}
            </div>
          </div>
        </TabsContent>

        {/* Weekly View */}
        <TabsContent value="week" className="mt-6 space-y-3">
          {weekSchedule.map((day, i) => (
            <Card key={i} className="border-slate-200">
              <CardContent className="p-4">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <p className="text-slate-900">{day.day}</p>
                    <p className="text-xs text-slate-500">{day.date}</p>
                  </div>
                  <Badge variant="secondary" className="bg-slate-100 text-slate-700">
                    {day.events.length}
                  </Badge>
                </div>
                <div className="space-y-2">
                  {day.events.map((event, j) => (
                    <div key={j} className="flex gap-3 p-2 rounded-lg bg-slate-50">
                      <div className={`${event.color} w-1 rounded-full`} />
                      <div className="flex-1">
                        <div className="flex items-center justify-between">
                          <p className="text-slate-900 text-sm">{event.title}</p>
                          <span className="text-xs text-slate-500">{event.time}</span>
                        </div>
                        <p className="text-xs text-slate-500 mt-0.5">{event.category}</p>
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          ))}
        </TabsContent>

        {/* Daily View */}
        <TabsContent value="day" className="mt-6">
          <Card className="border-slate-200">
            <CardContent className="p-4 space-y-3">
              {todaySchedule.map((event, i) => (
                <div
                  key={i}
                  className={`flex gap-3 p-3 rounded-lg border ${
                    event.completed ? 'bg-slate-50 border-slate-200' : 'bg-white border-slate-200'
                  }`}
                >
                  <div className="flex flex-col items-center gap-2">
                    <span className="text-sm text-slate-500">{event.time}</span>
                    <input
                      type="checkbox"
                      checked={event.completed}
                      className="w-4 h-4 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500"
                      readOnly
                    />
                  </div>
                  <div className={`${event.color} w-1 rounded-full`} />
                  <div className="flex-1">
                    <p className={`text-slate-900 ${event.completed ? 'line-through text-slate-400' : ''}`}>
                      {event.title}
                    </p>
                    <p className="text-xs text-slate-500 mt-1">{event.category}</p>
                  </div>
                </div>
              ))}
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  );
}
