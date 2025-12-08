import AppSidebarLayout from '@/layouts/app/app-sidebar-layout';
import { Head } from '@inertiajs/react';
import { useState } from 'react';
import AddGuruModal from './_components/AddGuruModal';
import GuruTable from './_components/GuruTable';
import Pagination from './_components/Pagination';
import SearchBar from './_components/SearchBar';
import StatisticsCard from './_components/StatisticsCard';
import { GuruManagementProps, SortColumn, SortOrder } from './types';

export default function GuruManagement({
    guru,
    totalGuru,
}: GuruManagementProps) {
    const [showAddModal, setShowAddModal] = useState(false);
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const [currentPage, setCurrentPage] = useState(1);
    const [searchQuery, setSearchQuery] = useState('');
    const [sortBy, setSortBy] = useState<SortColumn>('name');
    const [sortOrder, setSortOrder] = useState<SortOrder>('asc');

    // Search guru
    const searchedGuru = guru.filter(
        (teacher) =>
            teacher.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
            teacher.email.toLowerCase().includes(searchQuery.toLowerCase()),
    );

    // Sort guru
    const sortedGuru = [...searchedGuru].sort((a, b) => {
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

    // Pagination
    const totalPages = Math.ceil(sortedGuru.length / itemsPerPage);
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const paginatedGuru = sortedGuru.slice(startIndex, endIndex);

    // Handler untuk sorting
    const handleSort = (column: SortColumn) => {
        if (sortBy === column) {
            setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
        } else {
            setSortBy(column);
            setSortOrder('asc');
        }
    };

    const handleSearchChange = (value: string) => {
        setSearchQuery(value);
        setCurrentPage(1);
    };

    const handleItemsPerPageChange = (items: number) => {
        setItemsPerPage(items);
        setCurrentPage(1);
    };

    return (
        <AppSidebarLayout>
            <Head title="Kelola Guru" />

            <div className="min-h-screen bg-gradient-to-b from-gray-50 to-gray-100">
                <div className="container mx-auto px-4 py-4 sm:px-6 sm:py-6 lg:px-8 lg:py-8">
                    {/* Header */}
                    <div className="mb-6 flex flex-col items-start justify-between gap-4 sm:mb-8 sm:flex-row sm:items-center">
                        <div>
                            <h1 className="text-2xl font-bold text-gray-900 sm:text-3xl">
                                Kelola Guru
                            </h1>
                            <p className="mt-1 text-sm text-gray-600 sm:text-base">
                                Manajemen data guru
                            </p>
                        </div>
                        <button
                            onClick={() => setShowAddModal(true)}
                            className="flex w-full items-center justify-center gap-2 rounded-lg bg-green-600 px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-green-700 sm:w-auto sm:px-6 sm:py-3 sm:text-base"
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
                            Tambah Guru
                        </button>
                    </div>

                    {/* Statistics Card */}
                    <StatisticsCard totalGuru={totalGuru} />

                    {/* Search Box */}
                    <SearchBar
                        searchQuery={searchQuery}
                        onSearchChange={handleSearchChange}
                    />

                    {/* Guru Table */}
                    <GuruTable
                        guru={paginatedGuru}
                        sortBy={sortBy}
                        sortOrder={sortOrder}
                        onSort={handleSort}
                        searchQuery={searchQuery}
                    />

                    {/* Pagination */}
                    {paginatedGuru.length > 0 && (
                        <Pagination
                            currentPage={currentPage}
                            totalPages={totalPages}
                            itemsPerPage={itemsPerPage}
                            onPageChange={setCurrentPage}
                            onItemsPerPageChange={handleItemsPerPageChange}
                        />
                    )}

                    {/* Add Modal */}
                    <AddGuruModal
                        isOpen={showAddModal}
                        onClose={() => setShowAddModal(false)}
                    />
                </div>
            </div>
        </AppSidebarLayout>
    );
}
