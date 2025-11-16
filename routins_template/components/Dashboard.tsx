import { Calendar, DollarSign, BookOpen, Heart, Briefcase, Clock, ChevronRight } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from './ui/card';
import { Badge } from './ui/badge';

const categories = [
  { id: 'finance', name: 'Finans', icon: DollarSign, color: 'bg-emerald-500', count: 3 },
  { id: 'education', name: 'Eğitim', icon: BookOpen, color: 'bg-blue-500', count: 5 },
  { id: 'health', name: 'Sağlık', icon: Heart, color: 'bg-rose-500', count: 2 },
  { id: 'work', name: 'İş', icon: Briefcase, color: 'bg-amber-500', count: 4 },
];

const upcomingEvents = [
  {
    id: 1,
    title: 'Kira Ödemesi',
    category: 'finance',
    categoryColor: 'bg-emerald-500',
    date: '18 Kas',
    time: '09:00',
    type: 'payment',
  },
  {
    id: 2,
    title: 'Yoga Dersi',
    category: 'health',
    categoryColor: 'bg-rose-500',
    date: '16 Kas',
    time: '18:30',
    type: 'routine',
  },
  {
    id: 3,
    title: 'İngilizce Kursu',
    category: 'education',
    categoryColor: 'bg-blue-500',
    date: '16 Kas',
    time: '20:00',
    type: 'routine',
  },
  {
    id: 4,
    title: 'Proje Teslimi',
    category: 'work',
    categoryColor: 'bg-amber-500',
    date: '20 Kas',
    time: '17:00',
    type: 'deadline',
  },
  {
    id: 5,
    title: 'Doktor Randevusu',
    category: 'health',
    categoryColor: 'bg-rose-500',
    date: '22 Kas',
    time: '14:00',
    type: 'appointment',
  },
];

const todayRoutines = [
  { id: 1, title: 'Sabah Koşusu', time: '07:00', completed: true, category: 'health' },
  { id: 2, title: 'Günlük Okuma', time: '21:00', completed: false, category: 'education' },
  { id: 3, title: 'Bütçe Kontrolü', time: '22:00', completed: false, category: 'finance' },
];

export function Dashboard() {
  const today = new Date().toLocaleDateString('tr-TR', { 
    weekday: 'long', 
    year: 'numeric', 
    month: 'long', 
    day: 'numeric' 
  });

  return (
    <div className="p-6 space-y-6 pb-8">
      {/* Welcome Section */}
      <div>
        <h2 className="text-slate-900">Hoş Geldiniz 👋</h2>
        <p className="text-slate-500 mt-1">{today}</p>
      </div>

      {/* Categories Grid */}
      <div>
        <h3 className="text-slate-900 mb-3">Kategoriler</h3>
        <div className="grid grid-cols-2 gap-3">
          {categories.map((category) => {
            const Icon = category.icon;
            return (
              <Card key={category.id} className="hover:shadow-md transition-shadow cursor-pointer border-slate-200">
                <CardContent className="p-4">
                  <div className="flex items-start justify-between">
                    <div className={`${category.color} w-10 h-10 rounded-lg flex items-center justify-center`}>
                      <Icon className="w-5 h-5 text-white" />
                    </div>
                    <Badge variant="secondary" className="bg-slate-100 text-slate-700">
                      {category.count}
                    </Badge>
                  </div>
                  <p className="mt-3 text-slate-900">{category.name}</p>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Today's Routines */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h3 className="text-slate-900">Bugünkü Rutinler</h3>
          <button className="text-indigo-600 text-sm flex items-center gap-1">
            Tümü
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
        <Card className="border-slate-200">
          <CardContent className="p-4 space-y-3">
            {todayRoutines.map((routine, index) => (
              <div
                key={routine.id}
                className={`flex items-center gap-3 pb-3 ${
                  index !== todayRoutines.length - 1 ? 'border-b border-slate-100' : ''
                }`}
              >
                <input
                  type="checkbox"
                  checked={routine.completed}
                  className="w-5 h-5 rounded border-slate-300 text-indigo-600 focus:ring-indigo-500"
                  readOnly
                />
                <div className="flex-1">
                  <p className={`text-slate-900 ${routine.completed ? 'line-through text-slate-400' : ''}`}>
                    {routine.title}
                  </p>
                  <div className="flex items-center gap-2 mt-1">
                    <Clock className="w-3 h-3 text-slate-400" />
                    <span className="text-xs text-slate-500">{routine.time}</span>
                  </div>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>
      </div>

      {/* Upcoming Events */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h3 className="text-slate-900">Yaklaşan Etkinlikler</h3>
          <button className="text-indigo-600 text-sm flex items-center gap-1">
            Tümü
            <ChevronRight className="w-4 h-4" />
          </button>
        </div>
        <div className="space-y-3">
          {upcomingEvents.map((event) => (
            <Card key={event.id} className="border-slate-200 hover:shadow-md transition-shadow cursor-pointer">
              <CardContent className="p-4">
                <div className="flex gap-3">
                  <div className={`${event.categoryColor} w-1 rounded-full`} />
                  <div className="flex-1">
                    <div className="flex items-start justify-between">
                      <div>
                        <p className="text-slate-900">{event.title}</p>
                        <div className="flex items-center gap-2 mt-1">
                          <Calendar className="w-3 h-3 text-slate-400" />
                          <span className="text-xs text-slate-500">{event.date}</span>
                          <Clock className="w-3 h-3 text-slate-400 ml-2" />
                          <span className="text-xs text-slate-500">{event.time}</span>
                        </div>
                      </div>
                      <Badge
                        variant="outline"
                        className="text-xs border-slate-200 text-slate-600"
                      >
                        {event.type === 'payment' && 'Ödeme'}
                        {event.type === 'routine' && 'Rutin'}
                        {event.type === 'deadline' && 'Deadline'}
                        {event.type === 'appointment' && 'Randevu'}
                      </Badge>
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}
