import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/app-layout';
import { Head } from '@inertiajs/react';
import { useState } from 'react';

interface Student {
    id: number;
    name: string;
    class: string;
}

interface ActivitySubmission {
    id: number;
    studentId: number;
    studentName: string;
    activityTitle: string;
    activityId: number;
    date: string;
    time: string;
    photo: string;
    status: 'pending' | 'approved' | 'rejected';
    submittedAt: string;
}

interface OrangtuaDashboardProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    students: Student[];
    submissions: ActivitySubmission[];
}

export default function OrangtuaDashboard({ auth, students = [], submissions = [] }: OrangtuaDashboardProps) {
    const [selectedStudent, setSelectedStudent] = useState<number | null>(1);
    const [selectedActivity, setSelectedActivity] = useState<number>(1);
    const [filterStatus, setFilterStatus] = useState<'all' | 'pending' | 'approved' | 'rejected'>('pending');
    const [itemsPerPage, setItemsPerPage] = useState(5);
    const [currentPage, setCurrentPage] = useState(1);

    // Dummy data untuk 7 kategori aktivitas (SAMA SEPERTI MENU SISWA)
    const activities = [
        { id: 1, title: 'Bangun Pagi', icon: '☀️', color: 'bg-orange-400' },
        { id: 2, title: 'Berbakti', icon: '🙏', color: 'bg-blue-400' },
        { id: 3, title: 'Berolahraga', icon: '⚽', color: 'bg-green-400' },
        { id: 4, title: 'Gemar Belajar', icon: '📚', color: 'bg-yellow-400' },
        { id: 5, title: 'Makan Makanan Sehat dan Bergizi', icon: '🍎', color: 'bg-pink-400' },
        { id: 6, title: 'Bermasyarakat', icon: '👨‍👩‍👧‍👦', color: 'bg-purple-400' },
        { id: 7, title: 'Tidur Cepat', icon: '🌙', color: 'bg-indigo-400' },
    ];

    // Dummy data untuk siswa
    const dummyStudents: Student[] = [
        { id: 1, name: 'Ahmad Rizky', class: 'A1' },
        { id: 2, name: 'Budi Santoso', class: 'A2' },
        { id: 3, name: 'Citra Dewi', class: 'B1' },
    ];

    // Dummy data untuk submissions
    const generateDummySubmissions = (): ActivitySubmission[] => {
        const dummyData: ActivitySubmission[] = [];
        const dates = [
            '2025-11-10', '2025-11-11', '2025-11-12', '2025-11-13', '2025-11-14',
            '2025-11-15', '2025-11-16', '2025-11-17', '2025-11-18', '2025-11-19'
        ];
        const times = ['08:00', '09:30', '10:15', '14:00', '15:30'];
        const statuses: Array<'pending' | 'approved' | 'rejected'> = ['pending', 'approved', 'rejected'];

        activities.forEach(activity => {
            dummyStudents.forEach(student => {
                dates.forEach((date, index) => {
                    dummyData.push({
                        id: `${student.id}-${activity.id}-${index}`,
                        studentId: student.id,
                        studentName: student.name,
                        activityTitle: activity.title,
                        activityId: activity.id,
                        date: date,
                        time: times[Math.floor(Math.random() * times.length)],
                        photo: '/api/placeholder/50/50',
                        status: statuses[Math.floor(Math.random() * statuses.length)],
                        submittedAt: `${date} ${times[0]}`
                    });
                });
            });
        });
        return dummyData;
    };

    const dummySubmissions = generateDummySubmissions();

    // Filter submissions berdasarkan student dan activity
    const filteredByActivitySubmissions = dummySubmissions.filter(
        submission =>
            submission.studentId === selectedStudent &&
            submission.activityId === selectedActivity &&
            (filterStatus === 'all' || submission.status === filterStatus)
    );

    // Pagination
    const totalPages = Math.ceil(filteredByActivitySubmissions.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const paginatedSubmissions = filteredByActivitySubmissions.slice(startIndex, endIndex);

    const selectedStudentData = dummyStudents.find(s => s.id === selectedStudent);
    const selectedActivityData = activities.find(a => a.id === selectedActivity);

    const getStatusBadgeColor = (status: string) => {
        switch (status) {
            case 'approved':
                return 'bg-green-100 text-green-800';
            case 'rejected':
                return 'bg-red-100 text-red-800';
            case 'pending':
                return 'bg-yellow-100 text-yellow-800';
            default:
                return 'bg-gray-100 text-gray-800';
        }
    };

    const getStatusLabel = (status: string) => {
        switch (status) {
            case 'approved':
                return 'Disetujui';
            case 'rejected':
                return 'Ditolak';
            case 'pending':
                return 'Menunggu';
            default:
                return status;
        }
    };

    return (
        <AppLayout>
            <Head title="Dashboard Orang Tua" />

            <div className="min-h-screen bg-gradient-to-b from-blue-50 to-blue-100">
                <div className="container mx-auto px-4 py-8">
                    {/* Header */}
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h1 className="text-3xl font-bold text-blue-900">Approval Kegiatan</h1>
                            <p className="text-blue-600">Selamat datang, {auth.user.name}</p>
                        </div>
                        <div className="flex items-center gap-4">
                            <input
                                type="text"
                                placeholder="Cari Aktivitas"
                                className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent text-gray-800"
                            />
                        </div>
                    </div>

                    {/* Main Content */}
                    <div className="flex flex-col lg:flex-row gap-8">
                        {/* Left Side - Student List */}
                        <div className="w-full lg:w-80 flex-shrink-0">
                            <div className="bg-white rounded-2xl shadow-lg p-6 sticky top-4">
                                <h2 className="text-xl font-bold text-blue-900 mb-4">Pilih Anak</h2>

                                {/* Student List */}
                                <div className="space-y-2">
                                    {dummyStudents.map((student) => (
                                        <button
                                            key={student.id}
                                            onClick={() => {
                                                setSelectedStudent(student.id);
                                                setCurrentPage(1);
                                            }}
                                            className={`w-full text-left px-4 py-3 rounded-lg font-medium transition-colors ${
                                                selectedStudent === student.id
                                                    ? 'bg-blue-600 text-white'
                                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                            }`}
                                        >
                                            <div className="font-semibold">{student.name}</div>
                                            <div className={`text-sm ${selectedStudent === student.id ? 'text-blue-100' : 'text-gray-600'}`}>
                                                Kelas {student.class}
                                            </div>
                                        </button>
                                    ))}
                                </div>

                                {/* Student Info Card */}
                                {selectedStudentData && (
                                    <div className="mt-6 pt-6 border-t border-gray-200">
                                        <div className="bg-blue-50 rounded-lg p-4">
                                            <p className="text-sm text-gray-600 mb-2">Statistik Approval Keseluruhan</p>
                                            <div className="grid grid-cols-3 gap-2">
                                                <div className="bg-white rounded p-2 text-center">
                                                    <div className="text-lg font-bold text-green-600">
                                                        {dummySubmissions.filter(s => s.studentId === selectedStudent && s.status === 'approved').length}
                                                    </div>
                                                    <div className="text-xs text-gray-600">Disetujui</div>
                                                </div>
                                                <div className="bg-white rounded p-2 text-center">
                                                    <div className="text-lg font-bold text-yellow-600">
                                                        {dummySubmissions.filter(s => s.studentId === selectedStudent && s.status === 'pending').length}
                                                    </div>
                                                    <div className="text-xs text-gray-600">Menunggu</div>
                                                </div>
                                                <div className="bg-white rounded p-2 text-center">
                                                    <div className="text-lg font-bold text-red-600">
                                                        {dummySubmissions.filter(s => s.studentId === selectedStudent && s.status === 'rejected').length}
                                                    </div>
                                                    <div className="text-xs text-gray-600">Ditolak</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* Right Side - Submissions */}
                        <div className="flex-1">
                            {/* Activity Tabs */}
                            <div className="bg-white rounded-2xl shadow-lg p-4 mb-6">
                                <div className="flex items-center gap-2 mb-4">
                                    <span className="text-sm font-medium text-gray-700">Kategori:</span>
                                </div>
                                <div className="flex gap-2 flex-wrap">
                                    {activities.map((activity) => (
                                        <button
                                            key={activity.id}
                                            onClick={() => {
                                                setSelectedActivity(activity.id);
                                                setCurrentPage(1);
                                                setFilterStatus('pending');
                                            }}
                                            className={`px-4 py-3 rounded-lg font-medium text-sm transition-colors flex items-center gap-2 ${
                                                selectedActivity === activity.id
                                                    ? `${activity.color} text-white`
                                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                            }`}
                                        >
                                            <span className="text-lg">{activity.icon}</span>
                                            {activity.title}
                                        </button>
                                    ))}
                                </div>
                            </div>

                            {/* Filter Tabs */}
                            <div className="bg-white rounded-2xl shadow-lg p-4 mb-6">
                                <div className="flex items-center gap-2 flex-wrap">
                                    <span className="text-sm font-medium text-gray-700">Filter:</span>
                                    <button
                                        onClick={() => {
                                            setFilterStatus('all');
                                            setCurrentPage(1);
                                        }}
                                        className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                            filterStatus === 'all'
                                                ? 'bg-blue-600 text-white'
                                                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                        }`}
                                    >
                                        Semua
                                    </button>
                                    <button
                                        onClick={() => {
                                            setFilterStatus('pending');
                                            setCurrentPage(1);
                                        }}
                                        className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                            filterStatus === 'pending'
                                                ? 'bg-yellow-600 text-white'
                                                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                        }`}
                                    >
                                        Menunggu
                                    </button>
                                    <button
                                        onClick={() => {
                                            setFilterStatus('approved');
                                            setCurrentPage(1);
                                        }}
                                        className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                            filterStatus === 'approved'
                                                ? 'bg-green-600 text-white'
                                                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                        }`}
                                    >
                                        Disetujui
                                    </button>
                                    <button
                                        onClick={() => {
                                            setFilterStatus('rejected');
                                            setCurrentPage(1);
                                        }}
                                        className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                            filterStatus === 'rejected'
                                                ? 'bg-red-600 text-white'
                                                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                        }`}
                                    >
                                        Ditolak
                                    </button>
                                </div>
                            </div>

                            {/* Submissions List */}
                            <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
                                {paginatedSubmissions.length > 0 ? (
                                    <>
                                        <div className="overflow-x-auto">
                                            <table className="w-full">
                                                <thead>
                                                    <tr className="border-b-2 border-gray-200 bg-gray-50">
                                                        <th className="py-4 px-4 text-left font-bold text-gray-700">Kegiatan: {selectedActivityData?.title}</th>
                                                        <th className="py-4 px-4 text-left font-bold text-gray-700">Tanggal</th>
                                                        <th className="py-4 px-4 text-left font-bold text-gray-700">Waktu</th>
                                                        <th className="py-4 px-4 text-center font-bold text-gray-700">Bukti Foto</th>
                                                        <th className="py-4 px-4 text-center font-bold text-gray-700">Status</th>
                                                        <th className="py-4 px-4 text-center font-bold text-gray-700">Aksi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    {paginatedSubmissions.map((submission) => (
                                                        <tr key={submission.id} className="border-b border-gray-200 hover:bg-gray-50">
                                                            {/* Kegiatan */}
                                                            <td className="py-4 px-4">
                                                                <div className="font-medium text-gray-800">
                                                                    {submission.activityTitle}
                                                                </div>
                                                            </td>

                                                            {/* Tanggal */}
                                                            <td className="py-4 px-4">
                                                                <div className="text-gray-600">
                                                                    {new Date(submission.date).toLocaleDateString('id-ID', {
                                                                        day: '2-digit',
                                                                        month: '2-digit',
                                                                        year: 'numeric',
                                                                    })}
                                                                </div>
                                                            </td>

                                                            {/* Waktu */}
                                                            <td className="py-4 px-4">
                                                                <div className="text-gray-600">{submission.time}</div>
                                                            </td>

                                                            {/* Bukti Foto */}
                                                            <td className="py-4 px-4">
                                                                <div className="flex justify-center">
                                                                    <label className="cursor-pointer">
                                                                        <div className="w-12 h-12 bg-gray-100 border-2 border-gray-300 rounded-lg flex items-center justify-center hover:bg-gray-200 transition-colors">
                                                                            <svg
                                                                                xmlns="http://www.w3.org/2000/svg"
                                                                                className="h-6 w-6 text-gray-400"
                                                                                fill="none"
                                                                                viewBox="0 0 24 24"
                                                                                stroke="currentColor"
                                                                            >
                                                                                <path
                                                                                    strokeLinecap="round"
                                                                                    strokeLinejoin="round"
                                                                                    strokeWidth={2}
                                                                                    d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                                                                                />
                                                                            </svg>
                                                                        </div>
                                                                    </label>
                                                                </div>
                                                            </td>

                                                            {/* Status */}
                                                            <td className="py-4 px-4">
                                                                <div className="flex justify-center">
                                                                    <span
                                                                        className={`inline-block px-3 py-1 rounded-full text-xs font-semibold ${getStatusBadgeColor(
                                                                            submission.status
                                                                        )}`}
                                                                    >
                                                                        {getStatusLabel(submission.status)}
                                                                    </span>
                                                                </div>
                                                            </td>

                                                            {/* Aksi */}
                                                            <td className="py-4 px-4">
                                                                <div className="flex justify-center gap-2">
                                                                    {submission.status === 'pending' ? (
                                                                        <>
                                                                            <button className="bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded-lg text-sm font-medium transition-colors">
                                                                                ✓
                                                                            </button>
                                                                            <button className="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-lg text-sm font-medium transition-colors">
                                                                                ✕
                                                                            </button>
                                                                        </>
                                                                    ) : (
                                                                        <span className="text-gray-500 text-sm">-</span>
                                                                    )}
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    ))}
                                                </tbody>
                                            </table>
                                        </div>

                                        {/* Pagination */}
                                        <div className="flex items-center justify-between p-4 border-t border-gray-200">
                                            <div className="flex items-center gap-3">
                                                <span className="text-sm font-medium text-gray-700">Show</span>
                                                <select
                                                    value={itemsPerPage}
                                                    onChange={(e) => {
                                                        setItemsPerPage(Number(e.target.value));
                                                        setCurrentPage(1);
                                                    }}
                                                    className="px-3 py-2 border border-gray-300 rounded-lg text-sm font-medium bg-white text-gray-700 hover:border-gray-400 focus:outline-none focus:ring-2 focus:ring-blue-500"
                                                >
                                                    <option value={5}>5</option>
                                                    <option value={10}>10</option>
                                                    <option value={20}>20</option>
                                                    <option value={31}>31</option>
                                                </select>
                                                <span className="text-sm font-medium text-gray-700">entries</span>
                                            </div>

                                            <div className="flex items-center justify-center gap-2">
                                                <button
                                                    onClick={() => setCurrentPage(1)}
                                                    disabled={currentPage === 1}
                                                    className="px-3 py-2 rounded-lg text-sm font-medium bg-gray-100 text-gray-700 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed"
                                                >
                                                    «
                                                </button>
                                                <button
                                                    onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                                                    disabled={currentPage === 1}
                                                    className="px-3 py-2 rounded-lg text-sm font-medium bg-gray-100 text-gray-700 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed"
                                                >
                                                    ‹
                                                </button>

                                                <div className="flex gap-1">
                                                    {Array.from({ length: totalPages }, (_, i) => i + 1).map((page) => (
                                                        <button
                                                            key={page}
                                                            onClick={() => setCurrentPage(page)}
                                                            className={`px-3 py-2 rounded-lg text-sm font-medium transition-colors ${
                                                                currentPage === page
                                                                    ? 'bg-blue-500 text-white'
                                                                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                                            }`}
                                                        >
                                                            {page}
                                                        </button>
                                                    ))}
                                                </div>

                                                <button
                                                    onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                                                    disabled={currentPage === totalPages}
                                                    className="px-3 py-2 rounded-lg text-sm font-medium bg-gray-100 text-gray-700 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed"
                                                >
                                                    ›
                                                </button>
                                                <button
                                                    onClick={() => setCurrentPage(totalPages)}
                                                    disabled={currentPage === totalPages}
                                                    className="px-3 py-2 rounded-lg text-sm font-medium bg-gray-100 text-gray-700 hover:bg-gray-200 disabled:opacity-50 disabled:cursor-not-allowed"
                                                >
                                                    »
                                                </button>

                                                <span className="text-sm text-gray-600 ml-2">
                                                    Halaman {currentPage} dari {totalPages}
                                                </span>
                                            </div>
                                        </div>
                                    </>
                                ) : (
                                    <div className="p-8 text-center">
                                        <p className="text-gray-600 font-medium">Tidak ada data untuk ditampilkan</p>
                                    </div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AppLayout>
    );
}
