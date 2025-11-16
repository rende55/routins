import { useState } from "react";
import {
  Home,
  Calendar,
  Target,
  Plus,
  Settings,
} from "lucide-react";
import { Dashboard } from "./components/Dashboard";
import { CalendarView } from "./components/CalendarView";
import { Goals } from "./components/Goals";
import { AddEventDialog } from "./components/AddEventDialog";

export default function App() {
  const [activeTab, setActiveTab] = useState("home");
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false);

  const renderContent = () => {
    switch (activeTab) {
      case "home":
        return <Dashboard />;
      case "calendar":
        return <CalendarView />;
      case "goals":
        return <Goals />;
      default:
        return <Dashboard />;
    }
  };

  return (
    <div className="flex flex-col h-screen bg-slate-50 max-w-md mx-auto">
      {/* Header */}
      <header className="bg-gradient-to-r from-indigo-600 to-purple-600 text-white px-6 py-4 shadow-lg">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 bg-white rounded-xl flex items-center justify-center shadow-md">
              <svg
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
              >
                <path
                  d="M12 2L2 7L12 12L22 7L12 2Z"
                  fill="#4F46E5"
                />
                <path
                  d="M2 17L12 22L22 17"
                  stroke="#7C3AED"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
                <path
                  d="M2 12L12 17L22 12"
                  stroke="#7C3AED"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                />
              </svg>
            </div>
            <div>
              <h1 className="tracking-wide">RoutinS</h1>
              <p className="text-indigo-100 text-xs">
                Hayatını Planla
              </p>
            </div>
          </div>
          <button className="p-2 hover:bg-white/10 rounded-lg transition-colors">
            <Settings className="w-5 h-5" />
          </button>
        </div>
      </header>

      {/* Content */}
      <main className="flex-1 overflow-y-auto">
        {renderContent()}
      </main>

      {/* Floating Action Button */}
      <button
        onClick={() => setIsAddDialogOpen(true)}
        className="fixed bottom-24 right-6 w-14 h-14 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-full shadow-lg flex items-center justify-center hover:shadow-xl transition-all hover:scale-110"
      >
        <Plus className="w-6 h-6" />
      </button>

      {/* Bottom Navigation */}
      <nav className="bg-white border-t border-slate-200 px-6 py-3 shadow-lg">
        <div className="flex justify-around items-center">
          <button
            onClick={() => setActiveTab("home")}
            className={`flex flex-col items-center gap-1 px-4 py-2 rounded-lg transition-colors ${
              activeTab === "home"
                ? "text-indigo-600 bg-indigo-50"
                : "text-slate-500 hover:text-slate-700"
            }`}
          >
            <Home className="w-5 h-5" />
            <span className="text-xs">Ana Sayfa</span>
          </button>
          <button
            onClick={() => setActiveTab("calendar")}
            className={`flex flex-col items-center gap-1 px-4 py-2 rounded-lg transition-colors ${
              activeTab === "calendar"
                ? "text-indigo-600 bg-indigo-50"
                : "text-slate-500 hover:text-slate-700"
            }`}
          >
            <Calendar className="w-5 h-5" />
            <span className="text-xs">Takvim</span>
          </button>
          <button
            onClick={() => setActiveTab("goals")}
            className={`flex flex-col items-center gap-1 px-4 py-2 rounded-lg transition-colors ${
              activeTab === "goals"
                ? "text-indigo-600 bg-indigo-50"
                : "text-slate-500 hover:text-slate-700"
            }`}
          >
            <Target className="w-5 h-5" />
            <span className="text-xs">Hedefler</span>
          </button>
        </div>
      </nav>

      {/* Add Event Dialog */}
      <AddEventDialog
        open={isAddDialogOpen}
        onOpenChange={setIsAddDialogOpen}
      />
    </div>
  );
}