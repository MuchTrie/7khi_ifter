interface StatisticsCardProps {
    totalOrangTua: number;
}

export default function StatisticsCard({ totalOrangTua }: StatisticsCardProps) {
    return (
        <div className="mb-6 grid grid-cols-1 gap-4 sm:mb-8 sm:gap-6">
            <div className="rounded-xl border-l-4 border-purple-500 bg-white p-3 shadow-lg sm:rounded-2xl sm:p-4 lg:p-6">
                <div className="flex flex-col items-start gap-2 sm:flex-row sm:items-center sm:justify-between">
                    <div className="flex-1">
                        <p className="mb-0.5 text-xs font-medium text-gray-600 sm:mb-1 sm:text-sm">
                            Total Orang Tua
                        </p>
                        <p className="text-xl font-bold text-purple-600 sm:text-2xl lg:text-3xl">
                            {totalOrangTua}
                        </p>
                    </div>
                    <div className="self-end rounded-full bg-purple-100 p-2 sm:self-auto sm:p-2.5 lg:p-3">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            className="h-5 w-5 text-purple-600 sm:h-6 sm:w-6 lg:h-8 lg:w-8"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                        >
                            <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                strokeWidth={2}
                                d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
                            />
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    );
}
