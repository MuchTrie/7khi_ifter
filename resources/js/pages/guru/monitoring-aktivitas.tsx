import AppLayout from '@/layouts/app-layout';
import { Head, Link } from '@inertiajs/react';
import { Activity, TrendingUp, Users, CheckCircle, Clock, AlertCircle, BookOpen, Calendar, User } from 'lucide-react';
import { useState } from 'react';

interface ClassData {
    id: number;
    name: string;
    grade: number;
    section: string;
    academic_year: string;
    student_count: number;
}

interface MonitoringAktivitasProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    classes?: ClassData[];
    selectedClass?: ClassData | null;
}

export default function MonitoringAktivitas({ auth, classes = [], selectedClass = null }: MonitoringAktivitasProps) {
    const [selectedPeriod, setSelectedPeriod] = useState<'hari' | 'minggu' | 'bulan'>('bulan');

    const handleClassChange = (classId: string) => {
        if (!classId) return;
        // Navigate with query param to reload page with selected class
        window.location.href = `/guru/monitoring-aktivitas?class_id=${classId}`;
    };

    const handlePeriodChange = (period: 'hari' | 'minggu' | 'bulan') => {
        setSelectedPeriod(period);
        // Nanti bisa ditambahkan logic untuk fetch data berdasarkan period
    };

    // Data dummy untuk demo (nanti akan diganti dengan data dari backend)
    // Data akan berubah berdasarkan selectedPeriod
    const statistikAktivitas = [
        {
            id: 1,
            nama: 'Bangun Pagi',
            icon: '🌅',
            totalSiswa: 30,
            siswaAktif: 25,
            persentase: 83,
            bgColor: 'bg-blue-50',
            borderColor: 'border-blue-200',
            textColor: 'text-blue-700',
            progressColor: 'bg-blue-500',
        },
        {
            id: 2,
            nama: 'Beribadah',
            icon: '🤲',
            totalSiswa: 30,
            siswaAktif: 28,
            persentase: 93,
            bgColor: 'bg-purple-50',
            borderColor: 'border-purple-200',
            textColor: 'text-purple-700',
            progressColor: 'bg-purple-500',
        },
        {
            id: 3,
            nama: 'Berolahraga',
            icon: '⚽',
            totalSiswa: 30,
            siswaAktif: 22,
            persentase: 73,
            bgColor: 'bg-green-50',
            borderColor: 'border-green-200',
            textColor: 'text-green-700',
            progressColor: 'bg-green-500',
        },
        {
            id: 4,
            nama: 'Makan Sehat',
            icon: '🥗',
            totalSiswa: 30,
            siswaAktif: 27,
            persentase: 90,
            bgColor: 'bg-yellow-50',
            borderColor: 'border-yellow-200',
            textColor: 'text-yellow-700',
            progressColor: 'bg-yellow-500',
        },
        {
            id: 5,
            nama: 'Gemar Belajar',
            icon: '📚',
            totalSiswa: 30,
            siswaAktif: 26,
            persentase: 87,
            bgColor: 'bg-indigo-50',
            borderColor: 'border-indigo-200',
            textColor: 'text-indigo-700',
            progressColor: 'bg-indigo-500',
        },
        {
            id: 6,
            nama: 'Bermasyarakat',
            icon: '🤝',
            totalSiswa: 30,
            siswaAktif: 20,
            persentase: 67,
            bgColor: 'bg-pink-50',
            borderColor: 'border-pink-200',
            textColor: 'text-pink-700',
            progressColor: 'bg-pink-500',
        },
        {
            id: 7,
            nama: 'Tidur Cepat',
            icon: '😴',
            totalSiswa: 30,
            siswaAktif: 24,
            persentase: 80,
            bgColor: 'bg-cyan-50',
            borderColor: 'border-cyan-200',
            textColor: 'text-cyan-700',
            progressColor: 'bg-cyan-500',
        },
    ];

    // Statistik umum
    const overallStats = {
        totalSiswa: 30,
        rataRataKeaktifan: Math.round(
            statistikAktivitas.reduce((sum, item) => sum + item.persentase, 0) / statistikAktivitas.length
        ),
        aktivitasTertinggi: statistikAktivitas.reduce((max, item) => 
            item.persentase > max.persentase ? item : max
        ),
        aktivitasTerendah: statistikAktivitas.reduce((min, item) => 
            item.persentase < min.persentase ? item : min
        ),
    };

    return (
        <AppLayout>
            <Head title="Monitoring Aktivitas Siswa" />

            <div className="min-h-screen bg-gray-50">
                <div className="container mx-auto px-4 py-4 md:py-8">
                    {/* Header */}
                    <div className="mb-6 md:mb-8">
                        <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-3 mb-4">
                            <div className="flex items-center gap-3">
                                <div className="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center">
                                    <Activity className="w-6 h-6 text-white" />
                                </div>
                                <div>
                                    <h1 className="text-2xl md:text-3xl font-bold text-gray-900">
                                        Monitoring Aktivitas Siswa
                                    </h1>
                                    <p className="text-sm text-gray-600 mt-1">
                                        Pantau partisipasi siswa dalam 7 Kebiasaan Anak Indonesia
                                    </p>
                                </div>
                            </div>
                            <Link
                                href="/guru/monitoring-siswa"
                                className="inline-flex items-center gap-2 px-4 md:px-6 py-2.5 md:py-3 bg-purple-600 hover:bg-purple-700 text-white font-medium rounded-lg transition-all shadow-md hover:shadow-lg"
                            >
                                <User className="w-5 h-5" />
                                <span>Monitoring Per Siswa</span>
                            </Link>
                        </div>

                        {/* Class Selection */}
                        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 md:p-6 mb-4">
                            <div className="flex flex-col md:flex-row md:items-center gap-3 md:gap-4">
                                <div className="flex items-center gap-2 min-w-fit">
                                    <BookOpen className="w-5 h-5 text-blue-600" />
                                    <label className="text-sm md:text-base font-medium text-gray-700 whitespace-nowrap">
                                        Pilih Kelas yang Diampu
                                    </label>
                                </div>
                                <select
                                    value={selectedClass?.id || ''}
                                    onChange={(e) => handleClassChange(e.target.value)}
                                    className="flex-1 w-full md:max-w-md px-3 md:px-4 py-2.5 md:py-3 text-sm md:text-base bg-white border-2 border-gray-300 rounded-lg text-gray-900 font-medium focus:ring-2 focus:ring-blue-500 focus:border-blue-500 hover:border-gray-400 transition-colors cursor-pointer"
                                >
                                    <option value="" className="text-gray-500">Pilih Kelas</option>
                                    {classes.map((classItem) => (
                                        <option key={classItem.id} value={classItem.id} className="text-gray-900 font-medium py-2">
                                            {classItem.name} ({classItem.student_count} siswa)
                                        </option>
                                    ))}
                                </select>
                            </div>

                            {selectedClass && (
                                <div className="mt-4 pt-4 border-t border-gray-200">
                                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                                        <div>
                                            <p className="text-xs text-gray-600">Kelas</p>
                                            <p className="text-sm font-bold text-blue-600">{selectedClass.name}</p>
                                        </div>
                                        <div>
                                            <p className="text-xs text-gray-600">Jumlah Siswa</p>
                                            <p className="text-sm font-bold text-green-600">{selectedClass.student_count} siswa</p>
                                        </div>
                                        <div>
                                            <p className="text-xs text-gray-600">Tingkat</p>
                                            <p className="text-sm font-bold text-purple-600">Kelas {selectedClass.grade}</p>
                                        </div>
                                        <div>
                                            <p className="text-xs text-gray-600">Tahun Akademik</p>
                                            <p className="text-sm font-bold text-orange-600">{selectedClass.academic_year}</p>
                                        </div>
                                    </div>
                                </div>
                            )}
                        </div>
                    </div>

                    {/* Overall Statistics Cards */}
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                        {/* Total Siswa */}
                        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600">Total Siswa</p>
                                    <p className="text-3xl font-bold text-gray-900 mt-2">
                                        {overallStats.totalSiswa}
                                    </p>
                                </div>
                                <div className="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center">
                                    <Users className="w-6 h-6 text-blue-600" />
                                </div>
                            </div>
                        </div>

                        {/* Rata-rata Keaktifan */}
                        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600">Rata-rata Keaktifan</p>
                                    <p className="text-3xl font-bold text-green-600 mt-2">
                                        {overallStats.rataRataKeaktifan}%
                                    </p>
                                </div>
                                <div className="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                                    <TrendingUp className="w-6 h-6 text-green-600" />
                                </div>
                            </div>
                        </div>

                        {/* Aktivitas Tertinggi */}
                        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600">Tertinggi</p>
                                    <p className="text-lg font-bold text-purple-600 mt-2">
                                        {overallStats.aktivitasTertinggi.nama}
                                    </p>
                                    <p className="text-sm text-gray-500">{overallStats.aktivitasTertinggi.persentase}%</p>
                                </div>
                                <div className="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center">
                                    <CheckCircle className="w-6 h-6 text-purple-600" />
                                </div>
                            </div>
                        </div>

                        {/* Aktivitas Terendah */}
                        <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600">Terendah</p>
                                    <p className="text-lg font-bold text-orange-600 mt-2">
                                        {overallStats.aktivitasTerendah.nama}
                                    </p>
                                    <p className="text-sm text-gray-500">{overallStats.aktivitasTerendah.persentase}%</p>
                                </div>
                                <div className="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center">
                                    <AlertCircle className="w-6 h-6 text-orange-600" />
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Period Filter */}
                    <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4 md:p-6 mb-8">
                        <div className="flex flex-col md:flex-row md:items-center gap-3 md:gap-4">
                            <div className="flex items-center gap-2 min-w-fit">
                                <Calendar className="w-5 h-5 text-blue-600" />
                                <label className="text-sm md:text-base font-medium text-gray-700 whitespace-nowrap">
                                    Filter Periode
                                </label>
                            </div>
                            <div className="flex gap-2 flex-wrap">
                                <button
                                    onClick={() => handlePeriodChange('hari')}
                                    className={`px-4 md:px-6 py-2 md:py-2.5 rounded-lg font-medium text-sm md:text-base transition-all ${
                                        selectedPeriod === 'hari'
                                            ? 'bg-blue-600 text-white shadow-md'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Hari Ini
                                </button>
                                <button
                                    onClick={() => handlePeriodChange('minggu')}
                                    className={`px-4 md:px-6 py-2 md:py-2.5 rounded-lg font-medium text-sm md:text-base transition-all ${
                                        selectedPeriod === 'minggu'
                                            ? 'bg-blue-600 text-white shadow-md'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Minggu Ini
                                </button>
                                <button
                                    onClick={() => handlePeriodChange('bulan')}
                                    className={`px-4 md:px-6 py-2 md:py-2.5 rounded-lg font-medium text-sm md:text-base transition-all ${
                                        selectedPeriod === 'bulan'
                                            ? 'bg-blue-600 text-white shadow-md'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Bulan Ini
                                </button>
                            </div>
                            <div className="md:ml-auto">
                                <p className="text-xs md:text-sm text-gray-600">
                                    Menampilkan data: <span className="font-bold text-blue-600">
                                        {selectedPeriod === 'hari' && 'Hari Ini'}
                                        {selectedPeriod === 'minggu' && 'Minggu Ini'}
                                        {selectedPeriod === 'bulan' && 'Bulan Ini'}
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>

                    {/* Detail Per Aktivitas */}
                    <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                        <h2 className="text-xl font-bold text-gray-900 mb-6">
                            Detail Partisipasi Per Aktivitas
                        </h2>

                        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            {statistikAktivitas.map((aktivitas) => (
                                <div
                                    key={aktivitas.id}
                                    className={`${aktivitas.bgColor} ${aktivitas.borderColor} border-2 rounded-lg p-6 transition-all hover:shadow-md`}
                                >
                                    {/* Header */}
                                    <div className="flex items-center justify-between mb-4">
                                        <div className="flex items-center gap-3">
                                            <span className="text-3xl">{aktivitas.icon}</span>
                                            <div>
                                                <h3 className={`font-bold text-lg ${aktivitas.textColor}`}>
                                                    {aktivitas.nama}
                                                </h3>
                                                <p className="text-sm text-gray-600">
                                                    {aktivitas.siswaAktif} dari {aktivitas.totalSiswa} siswa
                                                </p>
                                            </div>
                                        </div>
                                        <div className={`text-2xl font-bold ${aktivitas.textColor}`}>
                                            {aktivitas.persentase}%
                                        </div>
                                    </div>

                                    {/* Progress Bar */}
                                    <div className="mb-4">
                                        <div className="w-full bg-gray-200 rounded-full h-3">
                                            <div
                                                className={`${aktivitas.progressColor} h-3 rounded-full transition-all duration-500`}
                                                style={{ width: `${aktivitas.persentase}%` }}
                                            ></div>
                                        </div>
                                    </div>

                                    {/* Info Tambahan */}
                                    <div className="flex items-center justify-between text-sm">
                                        <div className="flex items-center gap-2 text-gray-600">
                                            <CheckCircle className="w-4 h-4 text-green-600" />
                                            <span>{aktivitas.siswaAktif} aktif</span>
                                        </div>
                                        <div className="flex items-center gap-2 text-gray-600">
                                            <Clock className="w-4 h-4 text-orange-600" />
                                            <span>{aktivitas.totalSiswa - aktivitas.siswaAktif} belum</span>
                                        </div>
                                    </div>

                                    {/* Status Badge */}
                                    <div className="mt-4">
                                        {aktivitas.persentase === 100 ? (
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full">
                                                <CheckCircle className="w-3 h-3" />
                                                Sangat Baik
                                            </span>
                                        ) : aktivitas.persentase >= 75 ? (
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-blue-100 text-blue-700 text-xs font-medium rounded-full">
                                                <TrendingUp className="w-3 h-3" />
                                                Baik
                                            </span>
                                        ) : aktivitas.persentase >= 50 ? (
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-yellow-100 text-yellow-700 text-xs font-medium rounded-full">
                                                <AlertCircle className="w-3 h-3" />
                                                Cukup
                                            </span>
                                        ) : (
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-red-100 text-red-700 text-xs font-medium rounded-full">
                                                <AlertCircle className="w-3 h-3" />
                                                Kurang
                                            </span>
                                        )}
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Info Footer */}
                    <div className="mt-6 grid grid-cols-1 lg:grid-cols-2 gap-4">
                        {/* Informasi Umum */}
                        <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 md:p-6">
                            <div className="flex items-start gap-3">
                                <div className="w-6 h-6 bg-blue-600 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                                    <span className="text-white text-xs font-bold">i</span>
                                </div>
                                <div className="text-sm text-gray-700">
                                    <p className="font-bold text-base mb-2 text-blue-900">Informasi Umum</p>
                                    <ul className="list-disc list-inside space-y-1.5 text-gray-700">
                                        <li>Data menampilkan statistik partisipasi siswa dalam 7 kebiasaan</li>
                                        <li>Persentase dihitung dari jumlah siswa yang aktif melakukan aktivitas</li>
                                        <li>Gunakan filter periode untuk melihat data harian, mingguan, atau bulanan</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        {/* Klasifikasi Status */}
                        <div className="bg-gradient-to-br from-purple-50 to-pink-50 border border-purple-200 rounded-lg p-4 md:p-6">
                            <div className="flex items-start gap-3">
                                <div className="w-6 h-6 bg-purple-600 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                                    <CheckCircle className="w-4 h-4 text-white" />
                                </div>
                                <div className="text-sm w-full">
                                    <p className="font-bold text-base mb-3 text-purple-900">Klasifikasi Status Partisipasi</p>
                                    <div className="space-y-2.5">
                                        <div className="flex items-start gap-3">
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full whitespace-nowrap">
                                                <CheckCircle className="w-3 h-3" />
                                                Sangat Baik
                                            </span>
                                            <span className="text-gray-700 flex-1">: 100% dalam sebulan konsisten melakukan kebiasaan 7KAIH</span>
                                        </div>
                                        <div className="flex items-start gap-3">
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-blue-100 text-blue-700 text-xs font-medium rounded-full whitespace-nowrap">
                                                <TrendingUp className="w-3 h-3" />
                                                Baik
                                            </span>
                                            <span className="text-gray-700 flex-1">: 75% - 99% dalam sebulan konsisten melakukan kebiasaan 7KAIH</span>
                                        </div>
                                        <div className="flex items-start gap-3">
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-yellow-100 text-yellow-700 text-xs font-medium rounded-full whitespace-nowrap">
                                                <AlertCircle className="w-3 h-3" />
                                                Cukup
                                            </span>
                                            <span className="text-gray-700 flex-1">: 50% - 74% dalam sebulan konsisten melakukan kebiasaan 7KAIH</span>
                                        </div>
                                        <div className="flex items-start gap-3">
                                            <span className="inline-flex items-center gap-1 px-3 py-1 bg-red-100 text-red-700 text-xs font-medium rounded-full whitespace-nowrap">
                                                <AlertCircle className="w-3 h-3" />
                                                Kurang
                                            </span>
                                            <span className="text-gray-700 flex-1">: Kurang dari 50% dalam sebulan konsisten melakukan kebiasaan 7KAIH</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AppLayout>
    );
}
