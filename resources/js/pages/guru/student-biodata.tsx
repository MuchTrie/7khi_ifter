import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/app-layout';
import { Head, Link } from '@inertiajs/react';
import { ArrowLeft, Search } from 'lucide-react';
import { useState } from 'react';

interface Student {
    id: number;
    name: string;
    religion: string;
    gender: string;
    photo?: string;
}

interface Biodata {
    hobbies: string[];
    aspirations: string[];
    favorite_foods: string[];
    disliked_foods: string[];
    favorite_animals: string[];
    disliked_items: string[];
}

interface StudentBiodataProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    student: Student;
    biodata?: Biodata;
}

export default function StudentBiodata({ auth, student, biodata }: StudentBiodataProps) {
    const [selectedDate, setSelectedDate] = useState(new Date());
    const [currentMonth, setCurrentMonth] = useState(new Date());
    const [searchQuery, setSearchQuery] = useState('');

    const getDaysInMonth = (date: Date) => {
        const year = date.getFullYear();
        const month = date.getMonth();
        const firstDay = new Date(year, month, 1);
        const lastDay = new Date(year, month + 1, 0);
        const daysInMonth = lastDay.getDate();
        const startingDayOfWeek = firstDay.getDay();

        return { daysInMonth, startingDayOfWeek };
    };

    const { daysInMonth, startingDayOfWeek } = getDaysInMonth(currentMonth);

    const changeMonth = (increment: number) => {
        const newMonth = new Date(currentMonth.setMonth(currentMonth.getMonth() + increment));
        setCurrentMonth(new Date(newMonth));
    };

    const changeYear = (increment: number) => {
        const newYear = new Date(currentMonth.setFullYear(currentMonth.getFullYear() + increment));
        setCurrentMonth(new Date(newYear));
    };

    const formatDate = (date: Date) => {
        return date.toLocaleDateString('id-ID', { day: '2-digit', month: '2-digit', year: 'numeric' });
    };

    const monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    const dayNames = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    // Mock calendar year data
    const currentYear = 2025;
    const months = [
        { name: 'JANUARI', color: 'bg-yellow-200' },
        { name: 'FEBRUARI', color: 'bg-pink-200' },
        { name: 'MARET', color: 'bg-blue-200' },
        { name: 'APRIL', color: 'bg-yellow-100' },
        { name: 'MEI', color: 'bg-pink-100' },
        { name: 'JUNI', color: 'bg-blue-100' },
        { name: 'JULI', color: 'bg-yellow-50' },
        { name: 'AGUSTUS', color: 'bg-teal-200' },
        { name: 'SEPTEMBER', color: 'bg-green-200' },
        { name: 'OKTOBER', color: 'bg-orange-200' },
        { name: 'NOVEMBER', color: 'bg-amber-200' },
        { name: 'DESEMBER', color: 'bg-red-200' },
    ];

    return (
        <AppLayout>
            <Head title={`Biodata ${student.name}`} />

            <div className="min-h-screen bg-gray-50">
                <div className="container mx-auto px-4 py-4 md:py-8">
                    {/* Header */}
                    <div className="mb-4 md:mb-8">
                        <div className="flex items-center gap-2 md:gap-3 mb-4 md:mb-6">
                            <div className="w-10 h-10 md:w-12 md:h-12 bg-blue-600 rounded-full flex items-center justify-center">
                                <span className="text-white font-bold text-lg md:text-xl">J</span>
                            </div>
                            <h1 className="text-xl md:text-2xl font-bold text-blue-700">Jurnal Harian</h1>
                        </div>

                        {/* Breadcrumb */}
                        <div className="flex items-center gap-2 text-xs md:text-sm text-gray-600 mb-4">
                            <Link href="/guru/dashboard" className="hover:text-blue-600">
                                Dashboard
                            </Link>
                            <span>/</span>
                            <Link href={`/guru/siswa/${student.id}/activities`} className="hover:text-blue-600">
                                Siswa {student.name}
                            </Link>
                            <span>/</span>
                            <span className="text-gray-900 font-medium">Biodata Murid</span>
                        </div>
                    </div>

                    {/* Main Content */}
                    <div className="flex flex-col lg:flex-row gap-4 md:gap-8">
                        {/* Left Side - Biodata */}
                        <div className="flex-1">
                            <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 md:p-8">
                                {/* Search Bar */}
                                <div className="mb-6">
                                    <div className="relative">
                                        <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-5 h-5 text-gray-400" />
                                        <Input
                                            type="text"
                                            placeholder="Cari Kegiatan"
                                            value={searchQuery}
                                            onChange={(e) => setSearchQuery(e.target.value)}
                                            className="pl-10"
                                        />
                                    </div>
                                </div>

                                {/* Student Photo and Name */}
                                <div className="flex flex-col items-center mb-8">
                                    <div className="w-32 h-40 md:w-40 md:h-48 mb-4 overflow-hidden rounded-lg border-4 border-red-600">
                                        <img
                                            src={student.photo || `https://ui-avatars.com/api/?name=${encodeURIComponent(student.name)}&size=200&background=dc2626&color=fff&bold=true`}
                                            alt={student.name}
                                            className="w-full h-full object-cover"
                                        />
                                    </div>
                                    <h2 className="text-xl md:text-2xl font-bold text-blue-600">{student.name}</h2>
                                </div>

                                {/* Biodata Content - Two Columns */}
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    {/* Left Column */}
                                    <div className="space-y-6">
                                        {/* Hobi */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Hobi :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                {biodata?.hobbies && biodata.hobbies.length > 0 ? (
                                                    biodata.hobbies.map((hobby, index) => (
                                                        <div key={index}>• {hobby}</div>
                                                    ))
                                                ) : (
                                                    <div className="text-gray-400 italic">Belum diisi</div>
                                                )}
                                            </div>
                                        </div>

                                        {/* Cita-cita */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Cita-cita :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                {biodata?.aspirations && biodata.aspirations.length > 0 ? (
                                                    biodata.aspirations.map((aspiration, index) => (
                                                        <div key={index}>• {aspiration}</div>
                                                    ))
                                                ) : (
                                                    <div className="text-gray-400 italic">Belum diisi</div>
                                                )}
                                            </div>
                                        </div>

                                        {/* Makanan kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Makanan kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                {biodata?.favorite_foods && biodata.favorite_foods.length > 0 ? (
                                                    biodata.favorite_foods.map((food, index) => (
                                                        <div key={index}>• {food}</div>
                                                    ))
                                                ) : (
                                                    <div className="text-gray-400 italic">Belum diisi</div>
                                                )}
                                            </div>
                                        </div>

                                        {/* Minuman kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Minuman kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Hewan kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Hewan kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                {biodata?.favorite_animals && biodata.favorite_animals.length > 0 ? (
                                                    biodata.favorite_animals.map((animal, index) => (
                                                        <div key={index}>• {animal}</div>
                                                    ))
                                                ) : (
                                                    <div className="text-gray-400 italic">Belum diisi</div>
                                                )}
                                            </div>
                                        </div>

                                        {/* Sesuatu yang tidak aku suka */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Sesuatu yang tidak aku suka :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                {biodata?.disliked_items && biodata.disliked_items.length > 0 ? (
                                                    biodata.disliked_items.map((item, index) => (
                                                        <div key={index}>• {item}</div>
                                                    ))
                                                ) : (
                                                    <div className="text-gray-400 italic">Belum diisi</div>
                                                )}
                                            </div>
                                        </div>
                                    </div>

                                    {/* Right Column */}
                                    <div className="space-y-6">
                                        {/* Hobi */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Hobi :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Cita-cita */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Cita-cita :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Makanan kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Makanan kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Minuman kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Minuman kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Hewan kesukaan */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Hewan kesukaan :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>

                                        {/* Sesuatu yang tidak aku suka */}
                                        <div className="bg-gray-100 rounded-lg p-4">
                                            <h3 className="font-bold text-gray-900 mb-3">Sesuatu yang tidak aku suka :</h3>
                                            <div className="space-y-2 text-sm text-gray-700">
                                                <div className="text-gray-400 italic">Belum diisi</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            {/* Back Button */}
                            <div className="mt-6">
                                <Link href={`/guru/siswa/${student.id}/activities`}>
                                    <Button variant="outline" className="border-blue-600 text-blue-600 hover:bg-blue-50">
                                        <ArrowLeft className="w-4 h-4 mr-2" />
                                        Kembali
                                    </Button>
                                </Link>
                            </div>
                        </div>

                        {/* Right Side - Calendar */}
                        <div className="w-full lg:w-80">
                            <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-3 md:p-4 lg:sticky lg:top-4">
                                <div className="text-center mb-3 md:mb-4">
                                    <h3 className="text-lg md:text-xl font-bold text-gray-800">Kalender</h3>
                                    <p className="text-xl md:text-2xl font-bold text-blue-600">{currentYear}</p>
                                </div>

                                <div className="grid grid-cols-2 gap-2 md:gap-3">
                                    {months.map((month, index) => (
                                        <div
                                            key={index}
                                            className={`${month.color} rounded-lg p-2 md:p-3 border border-gray-300`}
                                        >
                                            <div className="text-[10px] md:text-xs font-bold text-gray-700 mb-1 md:mb-2 text-center">
                                                {month.name}
                                            </div>
                                            <div className="grid grid-cols-7 gap-[2px] md:gap-1">
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">S</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">M</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">T</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">W</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">T</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">F</div>
                                                <div className="text-[6px] md:text-[8px] text-center text-gray-600">S</div>
                                                {/* Mock calendar days - simplified */}
                                                {[...Array(31)].map((_, i) => (
                                                    <div
                                                        key={i}
                                                        className="text-[6px] md:text-[8px] text-center text-gray-700"
                                                    >
                                                        {i + 1}
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    ))}
                                </div>

                                <div className="mt-3 md:mt-4 text-right text-[10px] md:text-xs text-gray-500">
                                    Apr 1, 2025 · 9:41 AM
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AppLayout>
    );
}
