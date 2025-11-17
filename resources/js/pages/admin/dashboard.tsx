import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/app-layout';
import { Head } from '@inertiajs/react';
import { useState } from 'react';

interface User {
    id: number;
    name: string;
    email: string;
    role: 'siswa' | 'orangtua' | 'guru' | 'admin';
    createdAt: string;
}

interface UserStats {
    total: number;
    siswa: number;
    orangtua: number;
    guru: number;
    admin: number;
}

interface AdminDashboardProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    users: User[];
    userStats: UserStats;
}

export default function AdminDashboard({ auth, users, userStats }: AdminDashboardProps) {
    const [showAddUserModal, setShowAddUserModal] = useState(false);
    const [selectedRole, setSelectedRole] = useState<'all' | 'siswa' | 'orangtua' | 'guru' | 'admin'>('all');
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const [currentPage, setCurrentPage] = useState(1);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState<'name' | 'email' | 'role' | 'createdAt'>('name');
    const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('asc');

    // Filter users berdasarkan role
    const filteredUsers = selectedRole === 'all' 
        ? users 
        : users.filter(user => user.role === selectedRole);

    // Search users
    const searchedUsers = filteredUsers.filter(user => 
        user.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        user.email.toLowerCase().includes(searchQuery.toLowerCase())
    );

    // Sort users
    const sortedUsers = [...searchedUsers].sort((a, b) => {
        let compareA: string | number = '';
        let compareB: string | number = '';

        if (sortBy === 'name') {
            compareA = a.name.toLowerCase();
            compareB = b.name.toLowerCase();
        } else if (sortBy === 'email') {
            compareA = a.email.toLowerCase();
            compareB = b.email.toLowerCase();
        } else if (sortBy === 'role') {
            compareA = a.role.toLowerCase();
            compareB = b.role.toLowerCase();
        } else if (sortBy === 'createdAt') {
            compareA = new Date(a.createdAt).getTime();
            compareB = new Date(b.createdAt).getTime();
        }

        if (compareA < compareB) return sortOrder === 'asc' ? -1 : 1;
        if (compareA > compareB) return sortOrder === 'asc' ? 1 : -1;
        return 0;
    });

    // Pagination
    const totalPages = Math.ceil(sortedUsers.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const paginatedUsers = sortedUsers.slice(startIndex, endIndex);

    // Handler untuk sorting
    const handleSort = (column: 'name' | 'email' | 'role' | 'createdAt') => {
        if (sortBy === column) {
            setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
        } else {
            setSortBy(column);
            setSortOrder('asc');
        }
    };

    // Icon untuk sorting
    const SortIcon = ({ column }: { column: 'name' | 'email' | 'role' | 'createdAt' }) => {
        if (sortBy !== column) {
            return (
                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 inline-block ml-1 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 16V4m0 0L3 8m4-4l4 4m6 0v12m0 0l4-4m-4 4l-4-4" />
                </svg>
            );
        }
        if (sortOrder === 'asc') {
            return (
                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 inline-block ml-1 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 15l7-7 7 7" />
                </svg>
            );
        }
        return (
            <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 inline-block ml-1 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
        );
    };

    const getRoleBadgeColor = (role: string) => {
        switch (role) {
            case 'siswa':
                return 'bg-blue-100 text-blue-800';
            case 'orangtua':
                return 'bg-green-100 text-green-800';
            case 'guru':
                return 'bg-purple-100 text-purple-800';
            case 'admin':
                return 'bg-red-100 text-red-800';
            default:
                return 'bg-gray-100 text-gray-800';
        }
    };

    const getRoleLabel = (role: string) => {
        switch (role) {
            case 'siswa':
                return 'Siswa';
            case 'orangtua':
                return 'Orang Tua';
            case 'guru':
                return 'Guru';
            case 'admin':
                return 'Admin';
            default:
                return role;
        }
    };

    return (
        <AppLayout>
            <Head title="Dashboard Admin" />

            <div className="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100">
                <div className="container mx-auto px-4 py-8">
                    {/* Header */}
                    <div className="flex items-center justify-between mb-8">
                        <div>
                            <h1 className="text-3xl font-bold text-gray-900">Dashboard Admin</h1>
                            <p className="text-gray-600">Selamat datang, {auth.user.name}</p>
                        </div>
                        <button
                            onClick={() => setShowAddUserModal(true)}
                            className="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors flex items-center gap-2"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                <path fillRule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clipRule="evenodd" />
                            </svg>
                            Tambah User
                        </button>
                    </div>

                    {/* Statistics Cards */}
                    <div className="grid grid-cols-1 md:grid-cols-5 gap-6 mb-8">
                        {/* Total Users */}
                        <div className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-gray-500">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600 mb-1">Total User</p>
                                    <p className="text-3xl font-bold text-gray-900">{userStats.total}</p>
                                </div>
                                <div className="bg-gray-100 p-3 rounded-full">
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        {/* Siswa */}
                        <div className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-blue-500">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600 mb-1">Siswa</p>
                                    <p className="text-3xl font-bold text-blue-600">{userStats.siswa}</p>
                                </div>
                                <div className="bg-blue-100 p-3 rounded-full">
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 14l9-5-9-5-9 5 9 5z" />
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        {/* Orangtua */}
                        <div className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-green-500">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600 mb-1">Orang Tua</p>
                                    <p className="text-3xl font-bold text-green-600">{userStats.orangtua}</p>
                                </div>
                                <div className="bg-green-100 p-3 rounded-full">
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        {/* Guru */}
                        <div className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-purple-500">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600 mb-1">Guru</p>
                                    <p className="text-3xl font-bold text-purple-600">{userStats.guru}</p>
                                </div>
                                <div className="bg-purple-100 p-3 rounded-full">
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-purple-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                    </svg>
                                </div>
                            </div>
                        </div>

                        {/* Admin */}
                        <div className="bg-white rounded-2xl shadow-lg p-6 border-l-4 border-red-500">
                            <div className="flex items-center justify-between">
                                <div>
                                    <p className="text-sm font-medium text-gray-600 mb-1">Admin</p>
                                    <p className="text-3xl font-bold text-red-600">{userStats.admin}</p>
                                </div>
                                <div className="bg-red-100 p-3 rounded-full">
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                                    </svg>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Filter Tabs */}
                    <div className="bg-white rounded-2xl shadow-lg p-4 mb-6">
                        <div className="flex items-center justify-between mb-4">
                            <div className="flex items-center gap-2 flex-wrap">
                                <span className="text-sm font-medium text-gray-700">Filter Role:</span>
                                <button
                                    onClick={() => {
                                        setSelectedRole('all');
                                        setCurrentPage(1);
                                    }}
                                    className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                        selectedRole === 'all'
                                            ? 'bg-gray-600 text-white'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Semua ({userStats.total})
                                </button>
                                <button
                                    onClick={() => {
                                        setSelectedRole('siswa');
                                        setCurrentPage(1);
                                    }}
                                    className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                        selectedRole === 'siswa'
                                            ? 'bg-blue-600 text-white'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Siswa ({userStats.siswa})
                                </button>
                                <button
                                    onClick={() => {
                                        setSelectedRole('orangtua');
                                        setCurrentPage(1);
                                    }}
                                    className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                        selectedRole === 'orangtua'
                                            ? 'bg-green-600 text-white'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Orang Tua ({userStats.orangtua})
                                </button>
                                <button
                                    onClick={() => {
                                        setSelectedRole('guru');
                                        setCurrentPage(1);
                                    }}
                                    className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                        selectedRole === 'guru'
                                            ? 'bg-purple-600 text-white'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Guru ({userStats.guru})
                                </button>
                                <button
                                    onClick={() => {
                                        setSelectedRole('admin');
                                        setCurrentPage(1);
                                    }}
                                    className={`px-4 py-2 rounded-lg font-medium text-sm transition-colors ${
                                        selectedRole === 'admin'
                                            ? 'bg-red-600 text-white'
                                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                    }`}
                                >
                                    Admin ({userStats.admin})
                                </button>
                            </div>

                            {/* Search Box */}
                            <div className="relative">
                                <input
                                    type="text"
                                    placeholder="Cari nama atau email..."
                                    value={searchQuery}
                                    onChange={(e) => {
                                        setSearchQuery(e.target.value);
                                        setCurrentPage(1);
                                    }}
                                    className="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent w-64"
                                />
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    className="h-5 w-5 absolute left-3 top-2.5 text-gray-400"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                >
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    {/* Users Table */}
                    <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
                        <div className="overflow-x-auto">
                            <table className="w-full">
                                <thead>
                                    <tr className="border-b-2 border-gray-200 bg-gray-50">
                                        <th className="py-4 px-4 text-left font-bold text-gray-700">ID</th>
                                        <th 
                                            className="py-4 px-4 text-left font-bold text-gray-700 cursor-pointer hover:bg-gray-100"
                                            onClick={() => handleSort('name')}
                                        >
                                            Nama <SortIcon column="name" />
                                        </th>
                                        <th 
                                            className="py-4 px-4 text-left font-bold text-gray-700 cursor-pointer hover:bg-gray-100"
                                            onClick={() => handleSort('email')}
                                        >
                                            Email <SortIcon column="email" />
                                        </th>
                                        <th 
                                            className="py-4 px-4 text-center font-bold text-gray-700 cursor-pointer hover:bg-gray-100"
                                            onClick={() => handleSort('role')}
                                        >
                                            Role <SortIcon column="role" />
                                        </th>
                                        <th 
                                            className="py-4 px-4 text-center font-bold text-gray-700 cursor-pointer hover:bg-gray-100"
                                            onClick={() => handleSort('createdAt')}
                                        >
                                            Tanggal Dibuat <SortIcon column="createdAt" />
                                        </th>
                                        <th className="py-4 px-4 text-center font-bold text-gray-700">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {paginatedUsers.map((user) => (
                                        <tr key={user.id} className="border-b border-gray-200 hover:bg-gray-50">
                                            <td className="py-4 px-4">
                                                <span className="font-medium text-gray-900">{user.id}</span>
                                            </td>
                                            <td className="py-4 px-4">
                                                <span className="font-medium text-gray-900">{user.name}</span>
                                            </td>
                                            <td className="py-4 px-4">
                                                <span className="text-gray-600">{user.email}</span>
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex justify-center">
                                                    <span className={`inline-block px-3 py-1 rounded-full text-xs font-semibold ${getRoleBadgeColor(user.role)}`}>
                                                        {getRoleLabel(user.role)}
                                                    </span>
                                                </div>
                                            </td>
                                            <td className="py-4 px-4 text-center">
                                                <span className="text-gray-600">
                                                    {new Date(user.createdAt).toLocaleDateString('id-ID', {
                                                        day: '2-digit',
                                                        month: '2-digit',
                                                        year: 'numeric',
                                                    })}
                                                </span>
                                            </td>
                                            <td className="py-4 px-4">
                                                <div className="flex justify-center gap-2">
                                                    <button className="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-lg text-sm font-medium transition-colors">
                                                        Edit
                                                    </button>
                                                    <button className="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-lg text-sm font-medium transition-colors">
                                                        Hapus
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>

                        {/* No Results Message */}
                        {paginatedUsers.length === 0 && (
                            <div className="p-8 text-center">
                                <p className="text-gray-600 font-medium">
                                    {searchQuery ? `Tidak ada hasil untuk "${searchQuery}"` : 'Tidak ada data untuk ditampilkan'}
                                </p>
                            </div>
                        )}

                        {/* Pagination */}
                        {paginatedUsers.length > 0 && (
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
                                    <option value={50}>50</option>
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
                        )}
                    </div>

                    {/* Add User Modal */}
                    {showAddUserModal && (
                        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
                            <div className="bg-white rounded-2xl shadow-2xl p-8 max-w-2xl w-full mx-4">
                                <div className="flex items-center justify-between mb-6">
                                    <h2 className="text-2xl font-bold text-gray-900">Tambah User Baru</h2>
                                    <button
                                        onClick={() => setShowAddUserModal(false)}
                                        className="text-gray-400 hover:text-gray-600"
                                    >
                                        <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                                        </svg>
                                    </button>
                                </div>

                                <form className="space-y-4">
                                    <div className="grid grid-cols-2 gap-4">
                                        <div>
                                            <label className="block text-sm font-medium text-gray-700 mb-2">Nama Lengkap</label>
                                            <input
                                                type="text"
                                                placeholder="Masukkan nama lengkap"
                                                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                            />
                                        </div>
                                        <div>
                                            <label className="block text-sm font-medium text-gray-700 mb-2">Email</label>
                                            <input
                                                type="email"
                                                placeholder="Masukkan email"
                                                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                            />
                                        </div>
                                    </div>

                                    <div className="grid grid-cols-2 gap-4">
                                        <div>
                                            <label className="block text-sm font-medium text-gray-700 mb-2">Role</label>
                                            <select className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                                                <option value="">Pilih Role</option>
                                                <option value="siswa">Siswa</option>
                                                <option value="orangtua">Orang Tua</option>
                                                <option value="guru">Guru</option>
                                                <option value="admin">Admin</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label className="block text-sm font-medium text-gray-700 mb-2">Password</label>
                                            <input
                                                type="password"
                                                placeholder="Masukkan password"
                                                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                            />
                                        </div>
                                    </div>

                                    <div>
                                        <label className="block text-sm font-medium text-gray-700 mb-2">Konfirmasi Password</label>
                                        <input
                                            type="password"
                                            placeholder="Konfirmasi password"
                                            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                        />
                                    </div>

                                    <div className="flex justify-end gap-3 mt-6">
                                        <button
                                            type="button"
                                            onClick={() => setShowAddUserModal(false)}
                                            className="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 font-medium transition-colors"
                                        >
                                            Batal
                                        </button>
                                        <button
                                            type="submit"
                                            className="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium transition-colors"
                                        >
                                            Simpan User
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </AppLayout>
    );
}
