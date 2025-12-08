export interface User {
    id: number;
    name: string;
    email: string;
    createdAt: string;
}

export interface OrangTuaManagementProps {
    auth: {
        user: {
            name: string;
            email: string;
            role: string;
        };
    };
    orangtua: User[];
    totalOrangTua: number;
}

export type SortColumn = 'name' | 'email' | 'createdAt';
export type SortOrder = 'asc' | 'desc';
