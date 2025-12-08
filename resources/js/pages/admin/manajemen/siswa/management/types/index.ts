export interface User {
    id: number;
    name: string;
    email: string;
    createdAt: string;
}

export interface SiswaManagementProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    siswa: User[];
    totalSiswa: number;
}

export type SortColumn = 'name' | 'email' | 'createdAt';
export type SortOrder = 'asc' | 'desc';
