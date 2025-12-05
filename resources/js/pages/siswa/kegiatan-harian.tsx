import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import AppLayout from '@/layouts/app-layout';
import { Head, Link, router } from '@inertiajs/react';
import { Calendar as CalendarIcon, Check } from 'lucide-react';
import { useState } from 'react';

interface Activity {
    id: number;
    title: string;
    icon: string;
    color: string;
    completed: boolean;
}

interface Submission {
    id: number;
    date: string;
    status: string;
    activity_id: number;
}

interface KegiatanHarianProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
            religion?: string;
        };
    };
    activities: Activity[];
    submissions: Record<number, Submission[]>;
}

export default function KegiatanHarian({ auth, activities, submissions }: KegiatanHarianProps) {
    const [selectedDate, setSelectedDate] = useState(new Date());
    const [checkedDays, setCheckedDays] = useState<Record<string, Set<number>>>({});
    const [selectedEmojis, setSelectedEmojis] = useState<Record<number, string>>({});
    const currentDate = new Date();

    const emojis = ['😍', '😊', '😐', '😕', '😢'];

    // Toggle emoji selection
    const toggleEmoji = (activityId: number, emoji: string) => {
        setSelectedEmojis(prev => ({
            ...prev,
            [activityId]: prev[activityId] === emoji ? '' : emoji
        }));
    };

    // Initialize checked days from submissions
    const initializeCheckedDays = () => {
        const checked: Record<string, Set<number>> = {};
        activities.forEach(activity => {
            const activitySubmissions = submissions[activity.id] || [];
            const days = new Set<number>();
            activitySubmissions.forEach(sub => {
                if (sub.status === 'approved') {
                    const subDate = new Date(sub.date);
                    days.add(subDate.getDate());
                }
            });
            checked[activity.id] = days;
        });
        return checked;
    };

    // Toggle day selection
    const toggleDay = (activityId: number, day: number) => {
        setCheckedDays(prev => {
            const newChecked = { ...prev };
            if (!newChecked[activityId]) {
                newChecked[activityId] = new Set();
            }
            const daySet = new Set(newChecked[activityId]);
            
            if (daySet.has(day)) {
                daySet.delete(day);
            } else {
                daySet.add(day);
            }
            
            newChecked[activityId] = daySet;
            return newChecked;
        });
    };

    // Check if a day is selected
    const isDayChecked = (activityId: number, day: number) => {
        return checkedDays[activityId]?.has(day) || false;
    };

    const getDaysInMonth = (date: Date) => {
        const year = date.getFullYear();
        const month = date.getMonth();
        const daysInMonth = new Date(year, month + 1, 0).getDate();
        return daysInMonth;
    };

    const getMonthName = (date: Date) => {
        const months = [
            'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
            'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
        ];
        return months[date.getMonth()];
    };

    const daysInMonth = getDaysInMonth(selectedDate);
    const monthName = getMonthName(selectedDate);

    // Generate array of days in the month
    const days = Array.from({ length: daysInMonth }, (_, i) => i + 1);

    // Count completed activities per day
    const getCompletedCount = (day: number) => {
        const dateStr = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
        let count = 0;
        Object.values(submissions).forEach((activitySubmissions) => {
            if (activitySubmissions.some(s => s.date === dateStr && s.status === 'approved')) {
                count++;
            }
        });
        return count;
    };

    // Activity icons and colors mapping
    const activityConfig: Record<string, { emoji: string; color: string }> = {
        'BERIBADAH': { emoji: '🙏', color: '#FFD700' },
        'BANGUN PAGI': { emoji: '☀️', color: '#FFD700' },
        'BEROLAHRAGA': { emoji: '⚽', color: '#FFD700' },
        'MAKAN SEHAT DAN BERGIZI': { emoji: '🍎', color: '#FFD700' },
        'GEMAR BELAJAR': { emoji: '📚', color: '#FFD700' },
        'BERMASYARAKAT': { emoji: '👥', color: '#FFD700' },
        'TIDUR CEPAT': { emoji: '😴', color: '#FFD700' },
    };

    return (
        <AppLayout>
            <Head title="Kegiatan Harian" />

            <div className="min-h-screen bg-gradient-to-b from-blue-50 to-blue-100 py-8">
                <div className="container mx-auto px-4">
                    {/* Header */}
                    <div className="mb-8">
                        <h1 className="text-3xl font-bold text-gray-800 mb-2">Kegiatan Harian</h1>
                        <p className="text-gray-600">Klik jika kamu melakukan kegiatan tersebut!</p>
                    </div>

                    <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                        {/* Left Column - Calendar */}
                        <div className="lg:col-span-1">
                            <Card className="shadow-lg border-2 border-gray-800 bg-white">
                                <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
                                    <div className="flex items-center justify-between">
                                        <CardTitle className="text-xl">BULAN:</CardTitle>
                                        <input 
                                            type="date" 
                                            value={selectedDate.toISOString().split('T')[0]}
                                            onChange={(e) => setSelectedDate(new Date(e.target.value))}
                                            className="px-3 py-1 rounded bg-white text-gray-800 text-sm"
                                        />
                                    </div>
                                </CardHeader>
                                <CardContent className="p-6 bg-white">
                                    <div className="mb-4">
                                        <h3 className="text-2xl font-bold text-center text-blue-700 mb-4">
                                            Bangun Pagi
                                        </h3>
                                        <div className="grid grid-cols-10 gap-2 mb-4">
                                            {days.map((day) => (
                                                <div
                                                    key={day}
                                                    className={`aspect-square rounded-full flex items-center justify-center text-sm font-semibold ${
                                                        day === currentDate.getDate() &&
                                                        selectedDate.getMonth() === currentDate.getMonth() &&
                                                        selectedDate.getFullYear() === currentDate.getFullYear()
                                                            ? 'bg-red-500 text-white'
                                                            : 'bg-gray-200 text-gray-700'
                                                    }`}
                                                >
                                                    {day}
                                                </div>
                                            ))}
                                        </div>
                                    </div>

                                    <div className="text-center">
                                        <p className="text-sm text-gray-600 mb-2">
                                            Perasaanku dengan hasil yang aku dapatkan
                                        </p>
                                        <div className="flex justify-center gap-2">
                                            {emojis.map((emoji) => (
                                                <button
                                                    key={emoji}
                                                    onClick={() => toggleEmoji(0, emoji)}
                                                    className={`text-2xl transition-all hover:scale-125 p-1 rounded ${
                                                        selectedEmojis[0] === emoji 
                                                            ? 'bg-blue-100 scale-125 ring-2 ring-blue-500' 
                                                            : 'hover:bg-gray-100'
                                                    }`}
                                                >
                                                    {emoji}
                                                </button>
                                            ))}
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>

                            {/* Calendar */}
                            <Card className="shadow-lg mt-6">
                                <CardContent className="p-4">
                                    <img 
                                        src="/images/calendar-2025.png" 
                                        alt="Kalender 2025" 
                                        className="w-full rounded"
                                        onError={(e) => {
                                            // Fallback if image doesn't exist
                                            e.currentTarget.style.display = 'none';
                                        }}
                                    />
                                </CardContent>
                            </Card>
                        </div>

                        {/* Right Column - Activity Cards */}
                        <div className="lg:col-span-2">
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                {activities.map((activity) => {
                                    const config = activityConfig[activity.title.toUpperCase()] || { emoji: '⭐', color: '#FFD700' };
                                    const activitySubmissions = submissions[activity.id] || [];
                                    const completedDays = activitySubmissions.filter(s => s.status === 'approved').length;

                                    return (
                                        <Card key={activity.id} className="shadow-lg hover:shadow-xl transition-shadow border-2 border-gray-800 bg-white">
                                            <CardHeader className="bg-gradient-to-r from-blue-500 to-blue-600 text-white rounded-t-lg">
                                                <CardTitle className="text-lg font-bold text-center">
                                                    {activity.title}
                                                </CardTitle>
                                            </CardHeader>
                                            <CardContent className="p-6 bg-white">
                                                <div className="grid grid-cols-10 gap-1 mb-4">
                                                    {Array.from({ length: 31 }, (_, i) => {
                                                        const day = i + 1;
                                                        const dateStr = `${selectedDate.getFullYear()}-${String(selectedDate.getMonth() + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
                                                        const hasSubmission = activitySubmissions.some(s => s.date === dateStr && s.status === 'approved');
                                                        const isChecked = isDayChecked(activity.id, day);
                                                        
                                                        return (
                                                            <button
                                                                key={i}
                                                                onClick={() => toggleDay(activity.id, day)}
                                                                className={`aspect-square rounded-md flex items-center justify-center text-xs transition-all hover:scale-110 border-2 ${
                                                                    isChecked
                                                                        ? 'bg-blue-500 text-white shadow-md border-blue-600' 
                                                                        : 'bg-white hover:bg-gray-50 border-gray-300'
                                                                }`}
                                                            >
                                                                {isChecked && <Check className="w-3 h-3" strokeWidth={3} />}
                                                            </button>
                                                        );
                                                    })}
                                                </div>
                                                
                                                <div className="text-center">
                                                    <p className="text-sm text-gray-600 mb-2">
                                                        Perasaanku dengan hasil yang aku dapatkan
                                                    </p>
                                                    <div className="flex justify-center gap-2">
                                                        {emojis.map((emoji) => (
                                                            <button
                                                                key={emoji}
                                                                onClick={() => toggleEmoji(activity.id, emoji)}
                                                                className={`text-2xl transition-all hover:scale-125 p-1 rounded ${
                                                                    selectedEmojis[activity.id] === emoji 
                                                                        ? 'bg-blue-100 scale-125 ring-2 ring-blue-500' 
                                                                        : 'hover:bg-gray-100'
                                                                }`}
                                                            >
                                                                {emoji}
                                                            </button>
                                                        ))}
                                                    </div>
                                                </div>
                                            </CardContent>
                                        </Card>
                                    );
                                })}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AppLayout>
    );
}
