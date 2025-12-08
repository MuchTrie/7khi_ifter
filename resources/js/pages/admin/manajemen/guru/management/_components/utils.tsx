import { SortColumn, SortOrder } from '../types';

interface SortIconProps {
    column: SortColumn;
    currentSort: SortColumn;
    sortOrder: SortOrder;
}

export function SortIcon({ column, currentSort, sortOrder }: SortIconProps) {
    if (currentSort !== column) {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="ml-1 inline-block h-4 w-4 text-gray-400"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
            >
                <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M7 16V4m0 0L3 8m4-4l4 4m6 0v12m0 0l4-4m-4 4l-4-4"
                />
            </svg>
        );
    }
    if (sortOrder === 'asc') {
        return (
            <svg
                xmlns="http://www.w3.org/2000/svg"
                className="ml-1 inline-block h-4 w-4 text-green-600"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
            >
                <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={2}
                    d="M5 15l7-7 7 7"
                />
            </svg>
        );
    }
    return (
        <svg
            xmlns="http://www.w3.org/2000/svg"
            className="ml-1 inline-block h-4 w-4 text-green-600"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
        >
            <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M19 9l-7 7-7-7"
            />
        </svg>
    );
}
