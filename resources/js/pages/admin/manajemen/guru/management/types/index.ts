export interface User {
    id: number;
    name: string;
    email: string;
    createdAt: string;
}

export interface GuruManagementProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    guru: User[];
    totalGuru: number;
}

export type SortColumn = 'name' | 'email' | 'createdAt';
export type SortOrder = 'asc' | 'desc';
