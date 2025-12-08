import { SortColumn, SortOrder, User } from '../types';
import { SortIcon } from './utils';

interface GuruTableProps {
    guru: User[];
    sortBy: SortColumn;
    sortOrder: SortOrder;
    onSort: (column: SortColumn) => void;
    searchQuery: string;
}

export default function GuruTable({
    guru,
    sortBy,
    sortOrder,
    onSort,
    searchQuery,
}: GuruTableProps) {
    return (
        <div className="overflow-hidden rounded-xl bg-white shadow-lg sm:rounded-2xl">
            <div className="overflow-x-auto">
                <table className="w-full min-w-[640px]">
                    <thead>
                        <tr className="border-b-2 border-gray-200 bg-gray-50">
                            <th className="px-2 py-3 text-left text-xs font-bold text-gray-700 sm:px-4 sm:py-4 sm:text-sm">
                                ID
                            </th>
                            <th
                                className="cursor-pointer px-2 py-3 text-left text-xs font-bold text-gray-700 hover:bg-gray-100 sm:px-4 sm:py-4 sm:text-sm"
                                onClick={() => onSort('name')}
                            >
                                Nama{' '}
                                <SortIcon
                                    column="name"
                                    currentSort={sortBy}
                                    sortOrder={sortOrder}
                                />
                            </th>
                            <th
                                className="cursor-pointer px-2 py-3 text-left text-xs font-bold text-gray-700 hover:bg-gray-100 sm:px-4 sm:py-4 sm:text-sm"
                                onClick={() => onSort('email')}
                            >
                                Email{' '}
                                <SortIcon
                                    column="email"
                                    currentSort={sortBy}
                                    sortOrder={sortOrder}
                                />
                            </th>
                            <th
                                className="cursor-pointer px-2 py-3 text-center text-xs font-bold text-gray-700 hover:bg-gray-100 sm:px-4 sm:py-4 sm:text-sm"
                                onClick={() => onSort('createdAt')}
                            >
                                Tanggal Dibuat{' '}
                                <SortIcon
                                    column="createdAt"
                                    currentSort={sortBy}
                                    sortOrder={sortOrder}
                                />
                            </th>
                            <th className="px-2 py-3 text-center text-xs font-bold text-gray-700 sm:px-4 sm:py-4 sm:text-sm">
                                Aksi
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {guru.map((teacher) => (
                            <tr
                                key={teacher.id}
                                className="border-b border-gray-200 hover:bg-gray-50"
                            >
                                <td className="px-2 py-3 sm:px-4 sm:py-4">
                                    <span className="text-xs font-medium text-gray-900 sm:text-sm">
                                        {teacher.id}
                                    </span>
                                </td>
                                <td className="px-2 py-3 sm:px-4 sm:py-4">
                                    <span className="text-xs font-medium text-gray-900 sm:text-sm">
                                        {teacher.name}
                                    </span>
                                </td>
                                <td className="px-2 py-3 sm:px-4 sm:py-4">
                                    <span className="text-xs text-gray-600 sm:text-sm">
                                        {teacher.email}
                                    </span>
                                </td>
                                <td className="px-2 py-3 text-center sm:px-4 sm:py-4">
                                    <span className="text-xs text-gray-600 sm:text-sm">
                                        {new Date(
                                            teacher.createdAt,
                                        ).toLocaleDateString('id-ID', {
                                            day: '2-digit',
                                            month: '2-digit',
                                            year: 'numeric',
                                        })}
                                    </span>
                                </td>
                                <td className="px-2 py-3 sm:px-4 sm:py-4">
                                    <div className="flex justify-center gap-1 sm:gap-2">
                                        <button className="rounded-lg bg-green-500 px-2 py-1 text-xs font-medium text-white transition-colors hover:bg-green-600 sm:px-3 sm:text-sm">
                                            Edit
                                        </button>
                                        <button className="rounded-lg bg-red-500 px-2 py-1 text-xs font-medium text-white transition-colors hover:bg-red-600 sm:px-3 sm:text-sm">
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
            {guru.length === 0 && (
                <div className="p-8 text-center">
                    <p className="font-medium text-gray-600">
                        {searchQuery
                            ? `Tidak ada hasil untuk "${searchQuery}"`
                            : 'Tidak ada data guru'}
                    </p>
                </div>
            )}
        </div>
    );
}
