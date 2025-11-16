import { Target, TrendingUp, CheckCircle2, Circle } from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle } from './ui/card';
import { Progress } from './ui/progress';
import { Badge } from './ui/badge';

const goals = [
  {
    id: 1,
    title: '10.000 TL Tasarruf',
    category: 'Finans',
    categoryColor: 'bg-emerald-500',
    current: 6500,
    target: 10000,
    deadline: '31 Ara 2025',
    icon: '💰',
  },
  {
    id: 2,
    title: '50 Kitap Okuma',
    category: 'Eğitim',
    categoryColor: 'bg-blue-500',
    current: 32,
    target: 50,
    deadline: '31 Ara 2025',
    icon: '📚',
  },
  {
    id: 3,
    title: '100 Yoga Seansı',
    category: 'Sağlık',
    categoryColor: 'bg-rose-500',
    current: 78,
    target: 100,
    deadline: '31 Ara 2025',
    icon: '🧘',
  },
  {
    id: 4,
    title: 'Web Projesi Tamamla',
    category: 'İş',
    categoryColor: 'bg-amber-500',
    current: 8,
    target: 10,
    deadline: '30 Kas 2025',
    icon: '💻',
  },
];

const milestones = [
  { id: 1, title: '5.000 TL tasarruf edildi', completed: true, date: '15 Eyl' },
  { id: 2, title: '25 kitap okundu', completed: true, date: '10 Ağu' },
  { id: 3, title: '50 yoga seansı tamamlandı', completed: true, date: '20 Tem' },
  { id: 4, title: 'İlk müşteri projesi teslim edildi', completed: true, date: '05 Haz' },
];

export function Goals() {
  return (
    <div className="p-6 space-y-6 pb-8">
      {/* Header */}
      <div>
        <h2 className="text-slate-900">Hedeflerim 🎯</h2>
        <p className="text-slate-500 mt-1">İlerlemenizi takip edin</p>
      </div>

      {/* Goals Overview */}
      <div className="grid grid-cols-2 gap-3">
        <Card className="border-slate-200 bg-gradient-to-br from-indigo-50 to-purple-50">
          <CardContent className="p-4">
            <div className="flex items-center gap-2 mb-2">
              <div className="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
                <Target className="w-4 h-4 text-white" />
              </div>
            </div>
            <p className="text-slate-900">Toplam Hedef</p>
            <p className="text-slate-500 text-sm mt-1">4 Aktif</p>
          </CardContent>
        </Card>

        <Card className="border-slate-200 bg-gradient-to-br from-emerald-50 to-teal-50">
          <CardContent className="p-4">
            <div className="flex items-center gap-2 mb-2">
              <div className="w-8 h-8 bg-emerald-600 rounded-lg flex items-center justify-center">
                <TrendingUp className="w-4 h-4 text-white" />
              </div>
            </div>
            <p className="text-slate-900">Ortalama İlerleme</p>
            <p className="text-slate-500 text-sm mt-1">72%</p>
          </CardContent>
        </Card>
      </div>

      {/* Active Goals */}
      <div>
        <h3 className="text-slate-900 mb-3">Aktif Hedefler</h3>
        <div className="space-y-3">
          {goals.map((goal) => {
            const progress = Math.round((goal.current / goal.target) * 100);
            const isNearComplete = progress >= 75;

            return (
              <Card key={goal.id} className="border-slate-200 hover:shadow-md transition-shadow">
                <CardContent className="p-4">
                  <div className="flex gap-3">
                    <div className="text-2xl">{goal.icon}</div>
                    <div className="flex-1">
                      <div className="flex items-start justify-between mb-2">
                        <div>
                          <p className="text-slate-900">{goal.title}</p>
                          <div className="flex items-center gap-2 mt-1">
                            <div className={`${goal.categoryColor} w-2 h-2 rounded-full`} />
                            <span className="text-xs text-slate-500">{goal.category}</span>
                          </div>
                        </div>
                        <Badge
                          variant="outline"
                          className={`${
                            isNearComplete
                              ? 'border-emerald-200 bg-emerald-50 text-emerald-700'
                              : 'border-slate-200 bg-slate-50 text-slate-600'
                          }`}
                        >
                          {progress}%
                        </Badge>
                      </div>

                      <Progress value={progress} className="h-2 mb-2" />

                      <div className="flex items-center justify-between text-xs text-slate-500">
                        <span>
                          {goal.current.toLocaleString('tr-TR')} / {goal.target.toLocaleString('tr-TR')}
                        </span>
                        <span>{goal.deadline}</span>
                      </div>
                    </div>
                  </div>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>

      {/* Milestones */}
      <div>
        <h3 className="text-slate-900 mb-3">Başarılar 🏆</h3>
        <Card className="border-slate-200">
          <CardContent className="p-4 space-y-3">
            {milestones.map((milestone, index) => (
              <div
                key={milestone.id}
                className={`flex items-start gap-3 pb-3 ${
                  index !== milestones.length - 1 ? 'border-b border-slate-100' : ''
                }`}
              >
                {milestone.completed ? (
                  <CheckCircle2 className="w-5 h-5 text-emerald-500 mt-0.5 flex-shrink-0" />
                ) : (
                  <Circle className="w-5 h-5 text-slate-300 mt-0.5 flex-shrink-0" />
                )}
                <div className="flex-1">
                  <p
                    className={`${
                      milestone.completed ? 'text-slate-700' : 'text-slate-400'
                    }`}
                  >
                    {milestone.title}
                  </p>
                  <span className="text-xs text-slate-500 mt-1 block">{milestone.date}</span>
                </div>
              </div>
            ))}
          </CardContent>
        </Card>
      </div>

      {/* Motivation Card */}
      <Card className="border-slate-200 bg-gradient-to-r from-indigo-500 to-purple-600">
        <CardContent className="p-6 text-center text-white">
          <p className="text-lg mb-2">🌟</p>
          <p className="mb-1">"Küçük adımlar büyük değişimler yaratır"</p>
          <p className="text-indigo-100 text-sm">Hedefinize %72 yakınsınız!</p>
        </CardContent>
      </Card>
    </div>
  );
}
