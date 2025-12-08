interface StatisticsCardProps {
    totalGuru: number;
}

export default function StatisticsCard({ totalGuru }: StatisticsCardProps) {
    return (
        <div className="mb-6 grid grid-cols-1 gap-4 sm:mb-8 sm:gap-6">
            <div className="rounded-xl border-l-4 border-green-500 bg-white p-3 shadow-lg sm:rounded-2xl sm:p-4 lg:p-6">
                <div className="flex flex-col items-start gap-2 sm:flex-row sm:items-center sm:justify-between">
                    <div className="flex-1">
                        <p className="mb-0.5 text-xs font-medium text-gray-600 sm:mb-1 sm:text-sm">
                            Total Guru
                        </p>
                        <p className="text-xl font-bold text-green-600 sm:text-2xl lg:text-3xl">
                            {totalGuru}
                        </p>
                    </div>
                    <div className="self-end rounded-full bg-green-100 p-2 sm:self-auto sm:p-2.5 lg:p-3">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            className="h-5 w-5 text-green-600 sm:h-6 sm:w-6 lg:h-8 lg:w-8"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                        >
                            <path d="M12 14l9-5-9-5-9 5 9 5z" />
                            <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                            <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                strokeWidth={2}
                                d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                            />
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    );
}
