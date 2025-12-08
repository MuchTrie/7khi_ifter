interface AddOrangTuaModalProps {
    isOpen: boolean;
    onClose: () => void;
}

export default function AddOrangTuaModal({
    isOpen,
    onClose,
}: AddOrangTuaModalProps) {
    if (!isOpen) return null;

    return (
        <div className="bg-opacity-50 fixed inset-0 z-50 flex items-center justify-center bg-black p-4">
            <div className="w-full max-w-2xl rounded-xl bg-white p-4 shadow-2xl sm:rounded-2xl sm:p-6 lg:p-8">
                <div className="mb-4 flex items-center justify-between sm:mb-6">
                    <h2 className="text-xl font-bold text-gray-900 sm:text-2xl">
                        Tambah Orang Tua Baru
                    </h2>
                    <button
                        onClick={onClose}
                        className="text-gray-400 hover:text-gray-600"
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            className="h-6 w-6"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                        >
                            <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                strokeWidth={2}
                                d="M6 18L18 6M6 6l12 12"
                            />
                        </svg>
                    </button>
                </div>

                <form className="space-y-3 sm:space-y-4">
                    <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 sm:gap-4">
                        <div>
                            <label className="mb-2 block text-xs font-medium text-gray-900 sm:text-sm">
                                Nama Lengkap
                            </label>
                            <input
                                type="text"
                                placeholder="Masukkan nama lengkap"
                                className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 focus:border-transparent focus:ring-2 focus:ring-purple-500 sm:px-4"
                            />
                        </div>
                        <div>
                            <label className="mb-2 block text-xs font-medium text-gray-900 sm:text-sm">
                                Email
                            </label>
                            <input
                                type="email"
                                placeholder="Masukkan email"
                                className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 focus:border-transparent focus:ring-2 focus:ring-purple-500 sm:px-4"
                            />
                        </div>
                    </div>

                    <div>
                        <label className="mb-2 block text-xs font-medium text-gray-900 sm:text-sm">
                            Password
                        </label>
                        <input
                            type="password"
                            placeholder="Masukkan password"
                            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 focus:border-transparent focus:ring-2 focus:ring-purple-500 sm:px-4"
                        />
                    </div>

                    <div>
                        <label className="mb-2 block text-xs font-medium text-gray-900 sm:text-sm">
                            Konfirmasi Password
                        </label>
                        <input
                            type="password"
                            placeholder="Konfirmasi password"
                            className="w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 focus:border-transparent focus:ring-2 focus:ring-purple-500 sm:px-4"
                        />
                    </div>

                    <div className="mt-4 flex flex-col justify-end gap-2 sm:mt-6 sm:flex-row sm:gap-3">
                        <button
                            type="button"
                            onClick={onClose}
                            className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 sm:px-6 sm:text-base"
                        >
                            Batal
                        </button>
                        <button
                            type="submit"
                            className="rounded-lg bg-purple-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-purple-700 sm:px-6 sm:text-base"
                        >
                            Simpan Orang Tua
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}
