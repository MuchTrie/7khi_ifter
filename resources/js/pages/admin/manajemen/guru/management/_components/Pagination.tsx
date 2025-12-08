interface PaginationProps {
    currentPage: number;
    totalPages: number;
    itemsPerPage: number;
    onPageChange: (page: number) => void;
    onItemsPerPageChange: (items: number) => void;
}

export default function Pagination({
    currentPage,
    totalPages,
    itemsPerPage,
    onPageChange,
    onItemsPerPageChange,
}: PaginationProps) {
    return (
        <div className="flex items-center justify-between border-t border-gray-200 p-4">
            <div className="flex items-center gap-3">
                <span className="text-sm font-medium text-gray-700">Show</span>
                <select
                    value={itemsPerPage}
                    onChange={(e) =>
                        onItemsPerPageChange(Number(e.target.value))
                    }
                    className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm font-medium text-gray-700 hover:border-gray-400 focus:ring-2 focus:ring-green-500 focus:outline-none"
                >
                    <option value={5}>5</option>
                    <option value={10}>10</option>
                    <option value={20}>20</option>
                    <option value={50}>50</option>
                </select>
                <span className="text-sm font-medium text-gray-700">
                    entries
                </span>
            </div>

            <div className="flex items-center justify-center gap-2">
                <button
                    onClick={() => onPageChange(1)}
                    disabled={currentPage === 1}
                    className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    «
                </button>
                <button
                    onClick={() => onPageChange(Math.max(1, currentPage - 1))}
                    disabled={currentPage === 1}
                    className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    ‹
                </button>

                <div className="flex gap-1">
                    {Array.from({ length: totalPages }, (_, i) => i + 1).map(
                        (page) => (
                            <button
                                key={page}
                                onClick={() => onPageChange(page)}
                                className={`rounded-lg px-3 py-2 text-sm font-medium transition-colors ${
                                    currentPage === page
                                        ? 'bg-green-500 text-white'
                                        : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                                }`}
                            >
                                {page}
                            </button>
                        ),
                    )}
                </div>

                <button
                    onClick={() =>
                        onPageChange(Math.min(totalPages, currentPage + 1))
                    }
                    disabled={currentPage === totalPages}
                    className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    ›
                </button>
                <button
                    onClick={() => onPageChange(totalPages)}
                    disabled={currentPage === totalPages}
                    className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 disabled:cursor-not-allowed disabled:opacity-50"
                >
                    »
                </button>

                <span className="ml-2 text-sm text-gray-600">
                    Halaman {currentPage} dari {totalPages}
                </span>
            </div>
        </div>
    );
}
