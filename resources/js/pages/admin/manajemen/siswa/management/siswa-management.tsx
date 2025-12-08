import AppSidebarLayout from '@/layouts/app/app-sidebar-layout';
import { Head } from '@inertiajs/react';
import { useMemo, useState } from 'react';
import AddSiswaModal from './_components/AddSiswaModal';
import Pagination from './_components/Pagination';
import SearchBar from './_components/SearchBar';
import SiswaTable from './_components/SiswaTable';
import StatisticsCard from './_components/StatisticsCard';
import { SiswaManagementProps, SortColumn, SortOrder } from './types';

export default function SiswaManagement({
    siswa,
    totalSiswa,
}: SiswaManagementProps) {
    const [showAddModal, setShowAddModal] = useState(false);
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const [currentPage, setCurrentPage] = useState(1);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState<SortColumn>('name');
    const [sortOrder, setSortOrder] = useState<SortOrder>('asc');

    const handleSort = (column: SortColumn) => {
        if (sortBy === column) {
            setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
        } else {
            setSortBy(column);
            setSortOrder('asc');
        }
    };

    const handlePageChange = (page: number) => {
        setCurrentPage(page);
    };

    const handleItemsPerPageChange = (items: number) => {
        setItemsPerPage(items);
        setCurrentPage(1);
    };

    const processedSiswa = useMemo(() => {
        // Search
        const searched = siswa.filter(
            (student) =>
                student.name
                    .toLowerCase()
                    .includes(searchQuery.toLowerCase()) ||
                student.email.toLowerCase().includes(searchQuery.toLowerCase()),
        );

        // Sort
        const sorted = [...searched].sort((a, b) => {
            let compareA: string | number = '';
            let compareB: string | number = '';

            if (sortBy === 'name') {
                compareA = a.name.toLowerCase();
                compareB = b.name.toLowerCase();
            } else if (sortBy === 'email') {
                compareA = a.email.toLowerCase();
                compareB = b.email.toLowerCase();
            } else if (sortBy === 'createdAt') {
                compareA = new Date(a.createdAt).getTime();
                compareB = new Date(b.createdAt).getTime();
            }

            if (compareA < compareB) return sortOrder === 'asc' ? -1 : 1;
            if (compareA > compareB) return sortOrder === 'asc' ? 1 : -1;
            return 0;
        });

        return sorted;
    }, [siswa, searchQuery, sortBy, sortOrder]);

    const totalPages = Math.ceil(processedSiswa.length / itemsPerPage);
    const paginatedSiswa = processedSiswa.slice(
        (currentPage - 1) * itemsPerPage,
        currentPage * itemsPerPage,
    );

    return (
        <AppSidebarLayout>
            <Head title="Kelola Siswa" />
            <div className="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100">
                <div className="container mx-auto px-4 py-4 sm:px-6 sm:py-6 lg:px-8 lg:py-8">
                    {/* Header */}
                    <div className="mb-6 flex flex-col items-start justify-between gap-4 sm:mb-8 sm:flex-row sm:items-center">
                        <div>
                            <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">
                                Kelola Siswa
                            </h1>
                            <p className="mt-1 text-sm text-gray-600 sm:text-base">
                                Manajemen data siswa
                            </p>
                        </div>
                        <button
                            onClick={() => setShowAddModal(true)}
                            className="flex w-full items-center justify-center gap-2 rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-blue-700 sm:w-auto sm:px-6 sm:py-3 sm:text-base"
                        >
                            <svg
                                xmlns="http://www.w3.org/2000/svg"
                                className="h-4 w-4 sm:h-5 sm:w-5"
                                viewBox="0 0 20 20"
                                fill="currentColor"
                            >
                                <path
                                    fillRule="evenodd"
                                    d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z"
                                    clipRule="evenodd"
                                />
                            </svg>
                            Tambah Siswa
                        </button>
                    </div>

                    <StatisticsCard totalSiswa={totalSiswa} />

                    <SearchBar
                        searchQuery={searchQuery}
                        onSearchChange={(value) => {
                            setSearchQuery(value);
                            setCurrentPage(1);
                        }}
                    />

                    <SiswaTable
                        siswa={paginatedSiswa}
                        sortBy={sortBy}
                        sortOrder={sortOrder}
                        onSort={handleSort}
                        searchQuery={searchQuery}
                    />

                    {paginatedSiswa.length > 0 && (
                        <Pagination
                            currentPage={currentPage}
                            totalPages={totalPages}
                            itemsPerPage={itemsPerPage}
                            onPageChange={handlePageChange}
                            onItemsPerPageChange={handleItemsPerPageChange}
                        />
                    )}

                    <AddSiswaModal
                        isOpen={showAddModal}
                        onClose={() => setShowAddModal(false)}
                    />
                </div>
            </div>
        </AppSidebarLayout>
    );
}
